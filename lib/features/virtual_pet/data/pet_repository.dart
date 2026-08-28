import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gymboo_app/data/local/database.dart';
import '../domain/models/virtual_pet.dart';

abstract class PetRepository {
  Future<VirtualPet> getMyPet(String userId);
  Stream<VirtualPet?> watchMyPet(String userId);

  Future<VirtualPet> applyDailyActivityReward(String petId, {int pointsGain = 5, int lifeGain = 10});
  Future<VirtualPet> applyNeglectPenalty(String petId, {int lifeLoss = 15});
}

class LocalPetRepository implements PetRepository {
  LocalPetRepository(this._db);
  final AppDatabase _db;

  int _xpToNextLevel(int level) => level * 100;
 
  VirtualPet _toDomain(PetVirtual row) {
    return VirtualPet(
      id: row.petvId.toString(),
      name: row.name,
      life: row.life,
      level: row.level,
      points: row.points,
      xpToNextLevel: _xpToNextLevel(row.level),
    );
  }

  @override
  Future<VirtualPet> getMyPet(String userId) async {
    final row = await (_db.select(_db.petVirtuals)
    ..where((table) => table.userId.equals(int.parse(userId)))).getSingle();

    return _toDomain(row);
  }

  @override
  Stream<VirtualPet?> watchMyPet(String userId) {
    return (_db.select(_db.petVirtuals)
          ..where((tbl) => tbl.userId.equals(int.parse(userId))))
        .watchSingleOrNull()
        .map((row) => row == null ? null : _toDomain(row));
  }

  @override
  Future<VirtualPet> applyDailyActivityReward(
    String petId, 
    {int pointsGain = 5, int lifeGain = 10}) async {
      
      final id = int.parse(petId);
      final pet = await (_db.select(_db.petVirtuals)
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

    await (_db.update(_db.petVirtuals)..where((table) => table.petvId.equals(id)))
      .write(PetVirtualsCompanion(
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
      final pet = await (_db.select(_db.petVirtuals)
          ..where((tbl) => tbl.petvId.equals(id)))
        .getSingle();
 
       final newLife = (pet.life - lifeLoss).clamp(0, 100);

       //fazer perder skills tambem

       await (_db.update(_db.petVirtuals)..where((tbl) => tbl.petvId.equals(id)))
        .write(PetVirtualsCompanion(life: Value(newLife)));
 
    return getMyPet(pet.userId.toString());
      
  }
  
}

final petRepositoryProvider = Provider<PetRepository>((ref) {
  return LocalPetRepository(ref.watch(databaseProvider));
});