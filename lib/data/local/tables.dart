import 'package:drift/drift.dart';


@DataClassName('UserRow')
class Users extends Table {
  IntColumn get userId => integer().autoIncrement()();
  TextColumn get googleId => text().nullable()(); 
  TextColumn get name => text().withLength(min: 1, max: 70)();
  TextColumn get email => text().withLength(min: 1, max: 100).nullable()();
  IntColumn get height => integer().nullable()(); // cm
  IntColumn get weight => integer().nullable()(); // kg
}

@DataClassName('ActivityTypeRow')
class ActivityTypes extends Table {
  IntColumn get activityTypeId => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 1, max: 70)();
}

class VirtualPet extends Table {
  IntColumn get petvId => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 30)();
  IntColumn get life => integer().withDefault(const Constant(100))();
  IntColumn get level => integer().withDefault(const Constant(1))();
  IntColumn get points => integer().withDefault(const Constant(0))();
   TextColumn get colorVariant => text().withDefault(const Constant('purple'))();
  IntColumn get userId => integer().references(Users, #userId)();
}

@DataClassName('ActivityRow')
class Activities extends Table {
  IntColumn get activityId => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 1, max: 30)();
  DateTimeColumn get date => dateTime()();
  IntColumn get time => integer()(); // duração em minutos
  IntColumn get points => integer().withDefault(const Constant(0))();
  TextColumn get description =>
      text().withLength(min: 0, max: 70).nullable()();
  IntColumn get activityTypeId =>
      integer().references(ActivityTypes, #activityTypeId)();
  IntColumn get userId => integer().references(Users, #userId)();
}

class Skills extends Table {
  IntColumn get skillId => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 1, max: 70)();
  IntColumn get level => integer().withDefault(const Constant(1))();
  IntColumn get currentProgress => integer().withDefault(const Constant(0))();
  IntColumn get userId => integer().references(Users, #userId)();
  IntColumn get activityTypeId =>
      integer().references(ActivityTypes, #activityTypeId)();
}

@DataClassName('GoalRow')
class Goals extends Table {
  IntColumn get goalId => integer().autoIncrement()();
  IntColumn get weeklyWorkoutTarget =>integer()();
  IntColumn get userId => integer().nullable().references(Users, #userId)();
}

