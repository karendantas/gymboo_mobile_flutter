import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gymboo_app/data/local/database.dart';
import 'package:gymboo_app/features/virtual_pet/domain/models/pet_color_variant.dart';
import '../domain/models/virtual_pet.dart';

abstract class PetRepository {
  Future<VirtualPet> getMyPet(String userId);
  Future<VirtualPet> createPet({required String userId, required String name});
  Stream<VirtualPet?> watchMyPet(String userId);

  Future<VirtualPet> applyDailyActivityReward(String petId, {int pointsGain = 5, int lifeGain = 10});
  Future<VirtualPet> applyNeglectPenalty(String petId, {int lifeLoss = 15});
}

class LocalPetRepository implements PetRepository {
  LocalPetRepository(this._db);
  final AppDatabase _db;

  int _xpToNextLevel(int level) => level * 100;
 
  VirtualPet _toDomain(VirtualPetData row) {
    return VirtualPet(
      id: row.petvId.toString(),
      name: row.name,
      life: row.life,
      level: row.level,
      points: row.points,
      xpToNextLevel: _xpToNextLevel(row.level),
    colorVariant: PetColorVariant.values.byName(row.colorVariant),
    );
  }

  @override
  Future<VirtualPet> getMyPet(String userId) async {
    final row = await (_db.select(_db.virtualPet)
    ..where((table) => table.userId.equals(int.parse(userId)))).getSingle();

    return _toDomain(row);
  }

  @override
Future<VirtualPet> createPet({required String userId, required String name}) async {
  final newId = await _db.into(_db.virtualPet).insert(
    VirtualPetCompanion.insert(
      name: name,
      userId: int.parse(userId),
    ),
  );
  return getMyPet(userId);
}

  @override
  Stream<VirtualPet?> watchMyPet(String userId) {
    return (_db.select(_db.virtualPet)
          ..where((tbl) => tbl.userId.equals(int.parse(userId))))
        .watchSingleOrNull()
        .map((row) => row == null ? null : _toDomain(row));
  }

  @override
  Future<VirtualPet> applyDailyActivityReward(
    String petId, 
    {int pointsGain = 5, int lifeGain = 10}) async {
      
      final id = int.parse(petId);
      final pet = await (_db.select(_db.virtualPet)
        ..where((table) => table.petvId.equals(int.parse(petId)))
      ).getSingle();

    final newLife = (pet.life + lifeGain).clamp(0, 100);
    var newPoints = pet.points + pointsGain;
    var newLevel = pet.level;

    final xpNeeded = _xpToNextLevel(newLevel);
    if (newPoints >= xpNeeded) {
      newPoints -= xpNeeded;
      newLevel +=1 ;
    } 

    //aumentar skills

    await (_db.update(_db.virtualPet)..where((table) => table.petvId.equals(id)))
      .write(VirtualPetCompanion(
        life: Value(newLife),
        points: Value(newPoints),
        level: Value(newLevel),
      ))
    ;

    return getMyPet(pet.userId.toString());
  }

  @override
  Future<VirtualPet> applyNeglectPenalty(String petId, {int lifeLoss = 15}) async {
     final id = int.parse(petId);
      final pet = await (_db.select(_db.virtualPet)
          ..where((tbl) => tbl.petvId.equals(id)))
        .getSingle();
 
       final newLife = (pet.life - lifeLoss).clamp(0, 100);

       //fazer perder skills tambem

       await (_db.update(_db.virtualPet)..where((tbl) => tbl.petvId.equals(id)))
        .write(VirtualPetCompanion(life: Value(newLife)));
 
    return getMyPet(pet.userId.toString());
      
  }
  
}

final petRepositoryProvider = Provider<PetRepository>((ref) {
  return LocalPetRepository(ref.watch(databaseProvider));
});