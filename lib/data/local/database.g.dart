// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $UsersTable extends Users with TableInfo<$UsersTable, UserRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
    'user_id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _googleIdMeta = const VerificationMeta(
    'googleId',
  );
  @override
  late final GeneratedColumn<String> googleId = GeneratedColumn<String>(
    'google_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 70,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _heightMeta = const VerificationMeta('height');
  @override
  late final GeneratedColumn<int> height = GeneratedColumn<int>(
    'height',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _weightMeta = const VerificationMeta('weight');
  @override
  late final GeneratedColumn<int> weight = GeneratedColumn<int>(
    'weight',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    userId,
    googleId,
    name,
    email,
    height,
    weight,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(
    Insertable<UserRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    }
    if (data.containsKey('google_id')) {
      context.handle(
        _googleIdMeta,
        googleId.isAcceptableOrUnknown(data['google_id']!, _googleIdMeta),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    }
    if (data.containsKey('height')) {
      context.handle(
        _heightMeta,
        height.isAcceptableOrUnknown(data['height']!, _heightMeta),
      );
    }
    if (data.containsKey('weight')) {
      context.handle(
        _weightMeta,
        weight.isAcceptableOrUnknown(data['weight']!, _weightMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {userId};
  @override
  UserRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserRow(
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user_id'],
      )!,
      googleId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}google_id'],
      ),
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      ),
      height: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}height'],
      ),
      weight: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}weight'],
      ),
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class UserRow extends DataClass implements Insertable<UserRow> {
  final int userId;
  final String? googleId;
  final String name;
  final String? email;
  final int? height;
  final int? weight;
  const UserRow({
    required this.userId,
    this.googleId,
    required this.name,
    this.email,
    this.height,
    this.weight,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_id'] = Variable<int>(userId);
    if (!nullToAbsent || googleId != null) {
      map['google_id'] = Variable<String>(googleId);
    }
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || height != null) {
      map['height'] = Variable<int>(height);
    }
    if (!nullToAbsent || weight != null) {
      map['weight'] = Variable<int>(weight);
    }
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      userId: Value(userId),
      googleId: googleId == null && nullToAbsent
          ? const Value.absent()
          : Value(googleId),
      name: Value(name),
      email: email == null && nullToAbsent
          ? const Value.absent()
          : Value(email),
      height: height == null && nullToAbsent
          ? const Value.absent()
          : Value(height),
      weight: weight == null && nullToAbsent
          ? const Value.absent()
          : Value(weight),
    );
  }

  factory UserRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserRow(
      userId: serializer.fromJson<int>(json['userId']),
      googleId: serializer.fromJson<String?>(json['googleId']),
      name: serializer.fromJson<String>(json['name']),
      email: serializer.fromJson<String?>(json['email']),
      height: serializer.fromJson<int?>(json['height']),
      weight: serializer.fromJson<int?>(json['weight']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'userId': serializer.toJson<int>(userId),
      'googleId': serializer.toJson<String?>(googleId),
      'name': serializer.toJson<String>(name),
      'email': serializer.toJson<String?>(email),
      'height': serializer.toJson<int?>(height),
      'weight': serializer.toJson<int?>(weight),
    };
  }

  UserRow copyWith({
    int? userId,
    Value<String?> googleId = const Value.absent(),
    String? name,
    Value<String?> email = const Value.absent(),
    Value<int?> height = const Value.absent(),
    Value<int?> weight = const Value.absent(),
  }) => UserRow(
    userId: userId ?? this.userId,
    googleId: googleId.present ? googleId.value : this.googleId,
    name: name ?? this.name,
    email: email.present ? email.value : this.email,
    height: height.present ? height.value : this.height,
    weight: weight.present ? weight.value : this.weight,
  );
  UserRow copyWithCompanion(UsersCompanion data) {
    return UserRow(
      userId: data.userId.present ? data.userId.value : this.userId,
      googleId: data.googleId.present ? data.googleId.value : this.googleId,
      name: data.name.present ? data.name.value : this.name,
      email: data.email.present ? data.email.value : this.email,
      height: data.height.present ? data.height.value : this.height,
      weight: data.weight.present ? data.weight.value : this.weight,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserRow(')
          ..write('userId: $userId, ')
          ..write('googleId: $googleId, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('height: $height, ')
          ..write('weight: $weight')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(userId, googleId, name, email, height, weight);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserRow &&
          other.userId == this.userId &&
          other.googleId == this.googleId &&
          other.name == this.name &&
          other.email == this.email &&
          other.height == this.height &&
          other.weight == this.weight);
}

class UsersCompanion extends UpdateCompanion<UserRow> {
  final Value<int> userId;
  final Value<String?> googleId;
  final Value<String> name;
  final Value<String?> email;
  final Value<int?> height;
  final Value<int?> weight;
  const UsersCompanion({
    this.userId = const Value.absent(),
    this.googleId = const Value.absent(),
    this.name = const Value.absent(),
    this.email = const Value.absent(),
    this.height = const Value.absent(),
    this.weight = const Value.absent(),
  });
  UsersCompanion.insert({
    this.userId = const Value.absent(),
    this.googleId = const Value.absent(),
    required String name,
    this.email = const Value.absent(),
    this.height = const Value.absent(),
    this.weight = const Value.absent(),
  }) : name = Value(name);
  static Insertable<UserRow> custom({
    Expression<int>? userId,
    Expression<String>? googleId,
    Expression<String>? name,
    Expression<String>? email,
    Expression<int>? height,
    Expression<int>? weight,
  }) {
    return RawValuesInsertable({
      if (userId != null) 'user_id': userId,
      if (googleId != null) 'google_id': googleId,
      if (name != null) 'name': name,
      if (email != null) 'email': email,
      if (height != null) 'height': height,
      if (weight != null) 'weight': weight,
    });
  }

  UsersCompanion copyWith({
    Value<int>? userId,
    Value<String?>? googleId,
    Value<String>? name,
    Value<String?>? email,
    Value<int?>? height,
    Value<int?>? weight,
  }) {
    return UsersCompanion(
      userId: userId ?? this.userId,
      googleId: googleId ?? this.googleId,
      name: name ?? this.name,
      email: email ?? this.email,
      height: height ?? this.height,
      weight: weight ?? this.weight,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (googleId.present) {
      map['google_id'] = Variable<String>(googleId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (height.present) {
      map['height'] = Variable<int>(height.value);
    }
    if (weight.present) {
      map['weight'] = Variable<int>(weight.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('userId: $userId, ')
          ..write('googleId: $googleId, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('height: $height, ')
          ..write('weight: $weight')
          ..write(')'))
        .toString();
  }
}

class $ActivityTypesTable extends ActivityTypes
    with TableInfo<$ActivityTypesTable, ActivityTypeRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ActivityTypesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _activityTypeIdMeta = const VerificationMeta(
    'activityTypeId',
  );
  @override
  late final GeneratedColumn<int> activityTypeId = GeneratedColumn<int>(
    'activity_type_id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 70,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [activityTypeId, title];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'activity_types';
  @override
  VerificationContext validateIntegrity(
    Insertable<ActivityTypeRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('activity_type_id')) {
      context.handle(
        _activityTypeIdMeta,
        activityTypeId.isAcceptableOrUnknown(
          data['activity_type_id']!,
          _activityTypeIdMeta,
        ),
      );
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {activityTypeId};
  @override
  ActivityTypeRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ActivityTypeRow(
      activityTypeId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}activity_type_id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
    );
  }

  @override
  $ActivityTypesTable createAlias(String alias) {
    return $ActivityTypesTable(attachedDatabase, alias);
  }
}

class ActivityTypeRow extends DataClass implements Insertable<ActivityTypeRow> {
  final int activityTypeId;
  final String title;
  const ActivityTypeRow({required this.activityTypeId, required this.title});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['activity_type_id'] = Variable<int>(activityTypeId);
    map['title'] = Variable<String>(title);
    return map;
  }

  ActivityTypesCompanion toCompanion(bool nullToAbsent) {
    return ActivityTypesCompanion(
      activityTypeId: Value(activityTypeId),
      title: Value(title),
    );
  }

  factory ActivityTypeRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ActivityTypeRow(
      activityTypeId: serializer.fromJson<int>(json['activityTypeId']),
      title: serializer.fromJson<String>(json['title']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'activityTypeId': serializer.toJson<int>(activityTypeId),
      'title': serializer.toJson<String>(title),
    };
  }

  ActivityTypeRow copyWith({int? activityTypeId, String? title}) =>
      ActivityTypeRow(
        activityTypeId: activityTypeId ?? this.activityTypeId,
        title: title ?? this.title,
      );
  ActivityTypeRow copyWithCompanion(ActivityTypesCompanion data) {
    return ActivityTypeRow(
      activityTypeId: data.activityTypeId.present
          ? data.activityTypeId.value
          : this.activityTypeId,
      title: data.title.present ? data.title.value : this.title,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ActivityTypeRow(')
          ..write('activityTypeId: $activityTypeId, ')
          ..write('title: $title')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(activityTypeId, title);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ActivityTypeRow &&
          other.activityTypeId == this.activityTypeId &&
          other.title == this.title);
}

class ActivityTypesCompanion extends UpdateCompanion<ActivityTypeRow> {
  final Value<int> activityTypeId;
  final Value<String> title;
  const ActivityTypesCompanion({
    this.activityTypeId = const Value.absent(),
    this.title = const Value.absent(),
  });
  ActivityTypesCompanion.insert({
    this.activityTypeId = const Value.absent(),
    required String title,
  }) : title = Value(title);
  static Insertable<ActivityTypeRow> custom({
    Expression<int>? activityTypeId,
    Expression<String>? title,
  }) {
    return RawValuesInsertable({
      if (activityTypeId != null) 'activity_type_id': activityTypeId,
      if (title != null) 'title': title,
    });
  }

  ActivityTypesCompanion copyWith({
    Value<int>? activityTypeId,
    Value<String>? title,
  }) {
    return ActivityTypesCompanion(
      activityTypeId: activityTypeId ?? this.activityTypeId,
      title: title ?? this.title,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (activityTypeId.present) {
      map['activity_type_id'] = Variable<int>(activityTypeId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ActivityTypesCompanion(')
          ..write('activityTypeId: $activityTypeId, ')
          ..write('title: $title')
          ..write(')'))
        .toString();
  }
}

class $VirtualPetTable extends VirtualPet
    with TableInfo<$VirtualPetTable, VirtualPetData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VirtualPetTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _petvIdMeta = const VerificationMeta('petvId');
  @override
  late final GeneratedColumn<int> petvId = GeneratedColumn<int>(
    'petv_id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 30,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lifeMeta = const VerificationMeta('life');
  @override
  late final GeneratedColumn<int> life = GeneratedColumn<int>(
    'life',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(100),
  );
  static const VerificationMeta _levelMeta = const VerificationMeta('level');
  @override
  late final GeneratedColumn<int> level = GeneratedColumn<int>(
    'level',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _pointsMeta = const VerificationMeta('points');
  @override
  late final GeneratedColumn<int> points = GeneratedColumn<int>(
    'points',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _colorVariantMeta = const VerificationMeta(
    'colorVariant',
  );
  @override
  late final GeneratedColumn<String> colorVariant = GeneratedColumn<String>(
    'color_variant',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('purple'),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (user_id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    petvId,
    name,
    life,
    level,
    points,
    colorVariant,
    userId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'virtual_pet';
  @override
  VerificationContext validateIntegrity(
    Insertable<VirtualPetData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('petv_id')) {
      context.handle(
        _petvIdMeta,
        petvId.isAcceptableOrUnknown(data['petv_id']!, _petvIdMeta),
      );
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('life')) {
      context.handle(
        _lifeMeta,
        life.isAcceptableOrUnknown(data['life']!, _lifeMeta),
      );
    }
    if (data.containsKey('level')) {
      context.handle(
        _levelMeta,
        level.isAcceptableOrUnknown(data['level']!, _levelMeta),
      );
    }
    if (data.containsKey('points')) {
      context.handle(
        _pointsMeta,
        points.isAcceptableOrUnknown(data['points']!, _pointsMeta),
      );
    }
    if (data.containsKey('color_variant')) {
      context.handle(
        _colorVariantMeta,
        colorVariant.isAcceptableOrUnknown(
          data['color_variant']!,
          _colorVariantMeta,
        ),
      );
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {petvId};
  @override
  VirtualPetData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return VirtualPetData(
      petvId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}petv_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      life: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}life'],
      )!,
      level: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}level'],
      )!,
      points: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}points'],
      )!,
      colorVariant: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}color_variant'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user_id'],
      )!,
    );
  }

  @override
  $VirtualPetTable createAlias(String alias) {
    return $VirtualPetTable(attachedDatabase, alias);
  }
}

class VirtualPetData extends DataClass implements Insertable<VirtualPetData> {
  final int petvId;
  final String name;
  final int life;
  final int level;
  final int points;
  final String colorVariant;
  final int userId;
  const VirtualPetData({
    required this.petvId,
    required this.name,
    required this.life,
    required this.level,
    required this.points,
    required this.colorVariant,
    required this.userId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['petv_id'] = Variable<int>(petvId);
    map['name'] = Variable<String>(name);
    map['life'] = Variable<int>(life);
    map['level'] = Variable<int>(level);
    map['points'] = Variable<int>(points);
    map['color_variant'] = Variable<String>(colorVariant);
    map['user_id'] = Variable<int>(userId);
    return map;
  }

  VirtualPetCompanion toCompanion(bool nullToAbsent) {
    return VirtualPetCompanion(
      petvId: Value(petvId),
      name: Value(name),
      life: Value(life),
      level: Value(level),
      points: Value(points),
      colorVariant: Value(colorVariant),
      userId: Value(userId),
    );
  }

  factory VirtualPetData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return VirtualPetData(
      petvId: serializer.fromJson<int>(json['petvId']),
      name: serializer.fromJson<String>(json['name']),
      life: serializer.fromJson<int>(json['life']),
      level: serializer.fromJson<int>(json['level']),
      points: serializer.fromJson<int>(json['points']),
      colorVariant: serializer.fromJson<String>(json['colorVariant']),
      userId: serializer.fromJson<int>(json['userId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'petvId': serializer.toJson<int>(petvId),
      'name': serializer.toJson<String>(name),
      'life': serializer.toJson<int>(life),
      'level': serializer.toJson<int>(level),
      'points': serializer.toJson<int>(points),
      'colorVariant': serializer.toJson<String>(colorVariant),
      'userId': serializer.toJson<int>(userId),
    };
  }

  VirtualPetData copyWith({
    int? petvId,
    String? name,
    int? life,
    int? level,
    int? points,
    String? colorVariant,
    int? userId,
  }) => VirtualPetData(
    petvId: petvId ?? this.petvId,
    name: name ?? this.name,
    life: life ?? this.life,
    level: level ?? this.level,
    points: points ?? this.points,
    colorVariant: colorVariant ?? this.colorVariant,
    userId: userId ?? this.userId,
  );
  VirtualPetData copyWithCompanion(VirtualPetCompanion data) {
    return VirtualPetData(
      petvId: data.petvId.present ? data.petvId.value : this.petvId,
      name: data.name.present ? data.name.value : this.name,
      life: data.life.present ? data.life.value : this.life,
      level: data.level.present ? data.level.value : this.level,
      points: data.points.present ? data.points.value : this.points,
      colorVariant: data.colorVariant.present
          ? data.colorVariant.value
          : this.colorVariant,
      userId: data.userId.present ? data.userId.value : this.userId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('VirtualPetData(')
          ..write('petvId: $petvId, ')
          ..write('name: $name, ')
          ..write('life: $life, ')
          ..write('level: $level, ')
          ..write('points: $points, ')
          ..write('colorVariant: $colorVariant, ')
          ..write('userId: $userId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(petvId, name, life, level, points, colorVariant, userId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VirtualPetData &&
          other.petvId == this.petvId &&
          other.name == this.name &&
          other.life == this.life &&
          other.level == this.level &&
          other.points == this.points &&
          other.colorVariant == this.colorVariant &&
          other.userId == this.userId);
}

class VirtualPetCompanion extends UpdateCompanion<VirtualPetData> {
  final Value<int> petvId;
  final Value<String> name;
  final Value<int> life;
  final Value<int> level;
  final Value<int> points;
  final Value<String> colorVariant;
  final Value<int> userId;
  const VirtualPetCompanion({
    this.petvId = const Value.absent(),
    this.name = const Value.absent(),
    this.life = const Value.absent(),
    this.level = const Value.absent(),
    this.points = const Value.absent(),
    this.colorVariant = const Value.absent(),
    this.userId = const Value.absent(),
  });
  VirtualPetCompanion.insert({
    this.petvId = const Value.absent(),
    required String name,
    this.life = const Value.absent(),
    this.level = const Value.absent(),
    this.points = const Value.absent(),
    this.colorVariant = const Value.absent(),
    required int userId,
  }) : name = Value(name),
       userId = Value(userId);
  static Insertable<VirtualPetData> custom({
    Expression<int>? petvId,
    Expression<String>? name,
    Expression<int>? life,
    Expression<int>? level,
    Expression<int>? points,
    Expression<String>? colorVariant,
    Expression<int>? userId,
  }) {
    return RawValuesInsertable({
      if (petvId != null) 'petv_id': petvId,
      if (name != null) 'name': name,
      if (life != null) 'life': life,
      if (level != null) 'level': level,
      if (points != null) 'points': points,
      if (colorVariant != null) 'color_variant': colorVariant,
      if (userId != null) 'user_id': userId,
    });
  }

  VirtualPetCompanion copyWith({
    Value<int>? petvId,
    Value<String>? name,
    Value<int>? life,
    Value<int>? level,
    Value<int>? points,
    Value<String>? colorVariant,
    Value<int>? userId,
  }) {
    return VirtualPetCompanion(
      petvId: petvId ?? this.petvId,
      name: name ?? this.name,
      life: life ?? this.life,
      level: level ?? this.level,
      points: points ?? this.points,
      colorVariant: colorVariant ?? this.colorVariant,
      userId: userId ?? this.userId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (petvId.present) {
      map['petv_id'] = Variable<int>(petvId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (life.present) {
      map['life'] = Variable<int>(life.value);
    }
    if (level.present) {
      map['level'] = Variable<int>(level.value);
    }
    if (points.present) {
      map['points'] = Variable<int>(points.value);
    }
    if (colorVariant.present) {
      map['color_variant'] = Variable<String>(colorVariant.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VirtualPetCompanion(')
          ..write('petvId: $petvId, ')
          ..write('name: $name, ')
          ..write('life: $life, ')
          ..write('level: $level, ')
          ..write('points: $points, ')
          ..write('colorVariant: $colorVariant, ')
          ..write('userId: $userId')
          ..write(')'))
        .toString();
  }
}

class $ActivitiesTable extends Activities
    with TableInfo<$ActivitiesTable, ActivityRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ActivitiesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _activityIdMeta = const VerificationMeta(
    'activityId',
  );
  @override
  late final GeneratedColumn<int> activityId = GeneratedColumn<int>(
    'activity_id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 30,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _timeMeta = const VerificationMeta('time');
  @override
  late final GeneratedColumn<int> time = GeneratedColumn<int>(
    'time',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pointsMeta = const VerificationMeta('points');
  @override
  late final GeneratedColumn<int> points = GeneratedColumn<int>(
    'points',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 0,
      maxTextLength: 70,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _activityTypeIdMeta = const VerificationMeta(
    'activityTypeId',
  );
  @override
  late final GeneratedColumn<int> activityTypeId = GeneratedColumn<int>(
    'activity_type_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES activity_types (activity_type_id)',
    ),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (user_id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    activityId,
    title,
    date,
    time,
    points,
    description,
    activityTypeId,
    userId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'activities';
  @override
  VerificationContext validateIntegrity(
    Insertable<ActivityRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('activity_id')) {
      context.handle(
        _activityIdMeta,
        activityId.isAcceptableOrUnknown(data['activity_id']!, _activityIdMeta),
      );
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('time')) {
      context.handle(
        _timeMeta,
        time.isAcceptableOrUnknown(data['time']!, _timeMeta),
      );
    } else if (isInserting) {
      context.missing(_timeMeta);
    }
    if (data.containsKey('points')) {
      context.handle(
        _pointsMeta,
        points.isAcceptableOrUnknown(data['points']!, _pointsMeta),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('activity_type_id')) {
      context.handle(
        _activityTypeIdMeta,
        activityTypeId.isAcceptableOrUnknown(
          data['activity_type_id']!,
          _activityTypeIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_activityTypeIdMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {activityId};
  @override
  ActivityRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ActivityRow(
      activityId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}activity_id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      time: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}time'],
      )!,
      points: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}points'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      activityTypeId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}activity_type_id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user_id'],
      )!,
    );
  }

  @override
  $ActivitiesTable createAlias(String alias) {
    return $ActivitiesTable(attachedDatabase, alias);
  }
}

class ActivityRow extends DataClass implements Insertable<ActivityRow> {
  final int activityId;
  final String title;
  final DateTime date;
  final int time;
  final int points;
  final String? description;
  final int activityTypeId;
  final int userId;
  const ActivityRow({
    required this.activityId,
    required this.title,
    required this.date,
    required this.time,
    required this.points,
    this.description,
    required this.activityTypeId,
    required this.userId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['activity_id'] = Variable<int>(activityId);
    map['title'] = Variable<String>(title);
    map['date'] = Variable<DateTime>(date);
    map['time'] = Variable<int>(time);
    map['points'] = Variable<int>(points);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['activity_type_id'] = Variable<int>(activityTypeId);
    map['user_id'] = Variable<int>(userId);
    return map;
  }

  ActivitiesCompanion toCompanion(bool nullToAbsent) {
    return ActivitiesCompanion(
      activityId: Value(activityId),
      title: Value(title),
      date: Value(date),
      time: Value(time),
      points: Value(points),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      activityTypeId: Value(activityTypeId),
      userId: Value(userId),
    );
  }

  factory ActivityRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ActivityRow(
      activityId: serializer.fromJson<int>(json['activityId']),
      title: serializer.fromJson<String>(json['title']),
      date: serializer.fromJson<DateTime>(json['date']),
      time: serializer.fromJson<int>(json['time']),
      points: serializer.fromJson<int>(json['points']),
      description: serializer.fromJson<String?>(json['description']),
      activityTypeId: serializer.fromJson<int>(json['activityTypeId']),
      userId: serializer.fromJson<int>(json['userId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'activityId': serializer.toJson<int>(activityId),
      'title': serializer.toJson<String>(title),
      'date': serializer.toJson<DateTime>(date),
      'time': serializer.toJson<int>(time),
      'points': serializer.toJson<int>(points),
      'description': serializer.toJson<String?>(description),
      'activityTypeId': serializer.toJson<int>(activityTypeId),
      'userId': serializer.toJson<int>(userId),
    };
  }

  ActivityRow copyWith({
    int? activityId,
    String? title,
    DateTime? date,
    int? time,
    int? points,
    Value<String?> description = const Value.absent(),
    int? activityTypeId,
    int? userId,
  }) => ActivityRow(
    activityId: activityId ?? this.activityId,
    title: title ?? this.title,
    date: date ?? this.date,
    time: time ?? this.time,
    points: points ?? this.points,
    description: description.present ? description.value : this.description,
    activityTypeId: activityTypeId ?? this.activityTypeId,
    userId: userId ?? this.userId,
  );
  ActivityRow copyWithCompanion(ActivitiesCompanion data) {
    return ActivityRow(
      activityId: data.activityId.present
          ? data.activityId.value
          : this.activityId,
      title: data.title.present ? data.title.value : this.title,
      date: data.date.present ? data.date.value : this.date,
      time: data.time.present ? data.time.value : this.time,
      points: data.points.present ? data.points.value : this.points,
      description: data.description.present
          ? data.description.value
          : this.description,
      activityTypeId: data.activityTypeId.present
          ? data.activityTypeId.value
          : this.activityTypeId,
      userId: data.userId.present ? data.userId.value : this.userId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ActivityRow(')
          ..write('activityId: $activityId, ')
          ..write('title: $title, ')
          ..write('date: $date, ')
          ..write('time: $time, ')
          ..write('points: $points, ')
          ..write('description: $description, ')
          ..write('activityTypeId: $activityTypeId, ')
          ..write('userId: $userId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    activityId,
    title,
    date,
    time,
    points,
    description,
    activityTypeId,
    userId,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ActivityRow &&
          other.activityId == this.activityId &&
          other.title == this.title &&
          other.date == this.date &&
          other.time == this.time &&
          other.points == this.points &&
          other.description == this.description &&
          other.activityTypeId == this.activityTypeId &&
          other.userId == this.userId);
}

class ActivitiesCompanion extends UpdateCompanion<ActivityRow> {
  final Value<int> activityId;
  final Value<String> title;
  final Value<DateTime> date;
  final Value<int> time;
  final Value<int> points;
  final Value<String?> description;
  final Value<int> activityTypeId;
  final Value<int> userId;
  const ActivitiesCompanion({
    this.activityId = const Value.absent(),
    this.title = const Value.absent(),
    this.date = const Value.absent(),
    this.time = const Value.absent(),
    this.points = const Value.absent(),
    this.description = const Value.absent(),
    this.activityTypeId = const Value.absent(),
    this.userId = const Value.absent(),
  });
  ActivitiesCompanion.insert({
    this.activityId = const Value.absent(),
    required String title,
    required DateTime date,
    required int time,
    this.points = const Value.absent(),
    this.description = const Value.absent(),
    required int activityTypeId,
    required int userId,
  }) : title = Value(title),
       date = Value(date),
       time = Value(time),
       activityTypeId = Value(activityTypeId),
       userId = Value(userId);
  static Insertable<ActivityRow> custom({
    Expression<int>? activityId,
    Expression<String>? title,
    Expression<DateTime>? date,
    Expression<int>? time,
    Expression<int>? points,
    Expression<String>? description,
    Expression<int>? activityTypeId,
    Expression<int>? userId,
  }) {
    return RawValuesInsertable({
      if (activityId != null) 'activity_id': activityId,
      if (title != null) 'title': title,
      if (date != null) 'date': date,
      if (time != null) 'time': time,
      if (points != null) 'points': points,
      if (description != null) 'description': description,
      if (activityTypeId != null) 'activity_type_id': activityTypeId,
      if (userId != null) 'user_id': userId,
    });
  }

  ActivitiesCompanion copyWith({
    Value<int>? activityId,
    Value<String>? title,
    Value<DateTime>? date,
    Value<int>? time,
    Value<int>? points,
    Value<String?>? description,
    Value<int>? activityTypeId,
    Value<int>? userId,
  }) {
    return ActivitiesCompanion(
      activityId: activityId ?? this.activityId,
      title: title ?? this.title,
      date: date ?? this.date,
      time: time ?? this.time,
      points: points ?? this.points,
      description: description ?? this.description,
      activityTypeId: activityTypeId ?? this.activityTypeId,
      userId: userId ?? this.userId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (activityId.present) {
      map['activity_id'] = Variable<int>(activityId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (time.present) {
      map['time'] = Variable<int>(time.value);
    }
    if (points.present) {
      map['points'] = Variable<int>(points.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (activityTypeId.present) {
      map['activity_type_id'] = Variable<int>(activityTypeId.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ActivitiesCompanion(')
          ..write('activityId: $activityId, ')
          ..write('title: $title, ')
          ..write('date: $date, ')
          ..write('time: $time, ')
          ..write('points: $points, ')
          ..write('description: $description, ')
          ..write('activityTypeId: $activityTypeId, ')
          ..write('userId: $userId')
          ..write(')'))
        .toString();
  }
}

class $SkillsTable extends Skills with TableInfo<$SkillsTable, Skill> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SkillsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _skillIdMeta = const VerificationMeta(
    'skillId',
  );
  @override
  late final GeneratedColumn<int> skillId = GeneratedColumn<int>(
    'skill_id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 70,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _levelMeta = const VerificationMeta('level');
  @override
  late final GeneratedColumn<int> level = GeneratedColumn<int>(
    'level',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _currentProgressMeta = const VerificationMeta(
    'currentProgress',
  );
  @override
  late final GeneratedColumn<int> currentProgress = GeneratedColumn<int>(
    'current_progress',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (user_id)',
    ),
  );
  static const VerificationMeta _activityTypeIdMeta = const VerificationMeta(
    'activityTypeId',
  );
  @override
  late final GeneratedColumn<int> activityTypeId = GeneratedColumn<int>(
    'activity_type_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES activity_types (activity_type_id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    skillId,
    title,
    level,
    currentProgress,
    userId,
    activityTypeId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'skills';
  @override
  VerificationContext validateIntegrity(
    Insertable<Skill> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('skill_id')) {
      context.handle(
        _skillIdMeta,
        skillId.isAcceptableOrUnknown(data['skill_id']!, _skillIdMeta),
      );
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('level')) {
      context.handle(
        _levelMeta,
        level.isAcceptableOrUnknown(data['level']!, _levelMeta),
      );
    }
    if (data.containsKey('current_progress')) {
      context.handle(
        _currentProgressMeta,
        currentProgress.isAcceptableOrUnknown(
          data['current_progress']!,
          _currentProgressMeta,
        ),
      );
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('activity_type_id')) {
      context.handle(
        _activityTypeIdMeta,
        activityTypeId.isAcceptableOrUnknown(
          data['activity_type_id']!,
          _activityTypeIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_activityTypeIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {skillId};
  @override
  Skill map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Skill(
      skillId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}skill_id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      level: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}level'],
      )!,
      currentProgress: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}current_progress'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user_id'],
      )!,
      activityTypeId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}activity_type_id'],
      )!,
    );
  }

  @override
  $SkillsTable createAlias(String alias) {
    return $SkillsTable(attachedDatabase, alias);
  }
}

class Skill extends DataClass implements Insertable<Skill> {
  final int skillId;
  final String title;
  final int level;
  final int currentProgress;
  final int userId;
  final int activityTypeId;
  const Skill({
    required this.skillId,
    required this.title,
    required this.level,
    required this.currentProgress,
    required this.userId,
    required this.activityTypeId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['skill_id'] = Variable<int>(skillId);
    map['title'] = Variable<String>(title);
    map['level'] = Variable<int>(level);
    map['current_progress'] = Variable<int>(currentProgress);
    map['user_id'] = Variable<int>(userId);
    map['activity_type_id'] = Variable<int>(activityTypeId);
    return map;
  }

  SkillsCompanion toCompanion(bool nullToAbsent) {
    return SkillsCompanion(
      skillId: Value(skillId),
      title: Value(title),
      level: Value(level),
      currentProgress: Value(currentProgress),
      userId: Value(userId),
      activityTypeId: Value(activityTypeId),
    );
  }

  factory Skill.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Skill(
      skillId: serializer.fromJson<int>(json['skillId']),
      title: serializer.fromJson<String>(json['title']),
      level: serializer.fromJson<int>(json['level']),
      currentProgress: serializer.fromJson<int>(json['currentProgress']),
      userId: serializer.fromJson<int>(json['userId']),
      activityTypeId: serializer.fromJson<int>(json['activityTypeId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'skillId': serializer.toJson<int>(skillId),
      'title': serializer.toJson<String>(title),
      'level': serializer.toJson<int>(level),
      'currentProgress': serializer.toJson<int>(currentProgress),
      'userId': serializer.toJson<int>(userId),
      'activityTypeId': serializer.toJson<int>(activityTypeId),
    };
  }

  Skill copyWith({
    int? skillId,
    String? title,
    int? level,
    int? currentProgress,
    int? userId,
    int? activityTypeId,
  }) => Skill(
    skillId: skillId ?? this.skillId,
    title: title ?? this.title,
    level: level ?? this.level,
    currentProgress: currentProgress ?? this.currentProgress,
    userId: userId ?? this.userId,
    activityTypeId: activityTypeId ?? this.activityTypeId,
  );
  Skill copyWithCompanion(SkillsCompanion data) {
    return Skill(
      skillId: data.skillId.present ? data.skillId.value : this.skillId,
      title: data.title.present ? data.title.value : this.title,
      level: data.level.present ? data.level.value : this.level,
      currentProgress: data.currentProgress.present
          ? data.currentProgress.value
          : this.currentProgress,
      userId: data.userId.present ? data.userId.value : this.userId,
      activityTypeId: data.activityTypeId.present
          ? data.activityTypeId.value
          : this.activityTypeId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Skill(')
          ..write('skillId: $skillId, ')
          ..write('title: $title, ')
          ..write('level: $level, ')
          ..write('currentProgress: $currentProgress, ')
          ..write('userId: $userId, ')
          ..write('activityTypeId: $activityTypeId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    skillId,
    title,
    level,
    currentProgress,
    userId,
    activityTypeId,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Skill &&
          other.skillId == this.skillId &&
          other.title == this.title &&
          other.level == this.level &&
          other.currentProgress == this.currentProgress &&
          other.userId == this.userId &&
          other.activityTypeId == this.activityTypeId);
}

class SkillsCompanion extends UpdateCompanion<Skill> {
  final Value<int> skillId;
  final Value<String> title;
  final Value<int> level;
  final Value<int> currentProgress;
  final Value<int> userId;
  final Value<int> activityTypeId;
  const SkillsCompanion({
    this.skillId = const Value.absent(),
    this.title = const Value.absent(),
    this.level = const Value.absent(),
    this.currentProgress = const Value.absent(),
    this.userId = const Value.absent(),
    this.activityTypeId = const Value.absent(),
  });
  SkillsCompanion.insert({
    this.skillId = const Value.absent(),
    required String title,
    this.level = const Value.absent(),
    this.currentProgress = const Value.absent(),
    required int userId,
    required int activityTypeId,
  }) : title = Value(title),
       userId = Value(userId),
       activityTypeId = Value(activityTypeId);
  static Insertable<Skill> custom({
    Expression<int>? skillId,
    Expression<String>? title,
    Expression<int>? level,
    Expression<int>? currentProgress,
    Expression<int>? userId,
    Expression<int>? activityTypeId,
  }) {
    return RawValuesInsertable({
      if (skillId != null) 'skill_id': skillId,
      if (title != null) 'title': title,
      if (level != null) 'level': level,
      if (currentProgress != null) 'current_progress': currentProgress,
      if (userId != null) 'user_id': userId,
      if (activityTypeId != null) 'activity_type_id': activityTypeId,
    });
  }

  SkillsCompanion copyWith({
    Value<int>? skillId,
    Value<String>? title,
    Value<int>? level,
    Value<int>? currentProgress,
    Value<int>? userId,
    Value<int>? activityTypeId,
  }) {
    return SkillsCompanion(
      skillId: skillId ?? this.skillId,
      title: title ?? this.title,
      level: level ?? this.level,
      currentProgress: currentProgress ?? this.currentProgress,
      userId: userId ?? this.userId,
      activityTypeId: activityTypeId ?? this.activityTypeId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (skillId.present) {
      map['skill_id'] = Variable<int>(skillId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (level.present) {
      map['level'] = Variable<int>(level.value);
    }
    if (currentProgress.present) {
      map['current_progress'] = Variable<int>(currentProgress.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (activityTypeId.present) {
      map['activity_type_id'] = Variable<int>(activityTypeId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SkillsCompanion(')
          ..write('skillId: $skillId, ')
          ..write('title: $title, ')
          ..write('level: $level, ')
          ..write('currentProgress: $currentProgress, ')
          ..write('userId: $userId, ')
          ..write('activityTypeId: $activityTypeId')
          ..write(')'))
        .toString();
  }
}

class $GoalsTable extends Goals with TableInfo<$GoalsTable, GoalRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GoalsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _goalIdMeta = const VerificationMeta('goalId');
  @override
  late final GeneratedColumn<int> goalId = GeneratedColumn<int>(
    'goal_id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _weeklyWorkoutTargetMeta =
      const VerificationMeta('weeklyWorkoutTarget');
  @override
  late final GeneratedColumn<int> weeklyWorkoutTarget = GeneratedColumn<int>(
    'weekly_workout_target',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
    'user_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (user_id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [goalId, weeklyWorkoutTarget, userId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'goals';
  @override
  VerificationContext validateIntegrity(
    Insertable<GoalRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('goal_id')) {
      context.handle(
        _goalIdMeta,
        goalId.isAcceptableOrUnknown(data['goal_id']!, _goalIdMeta),
      );
    }
    if (data.containsKey('weekly_workout_target')) {
      context.handle(
        _weeklyWorkoutTargetMeta,
        weeklyWorkoutTarget.isAcceptableOrUnknown(
          data['weekly_workout_target']!,
          _weeklyWorkoutTargetMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_weeklyWorkoutTargetMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {goalId};
  @override
  GoalRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GoalRow(
      goalId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}goal_id'],
      )!,
      weeklyWorkoutTarget: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}weekly_workout_target'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user_id'],
      ),
    );
  }

  @override
  $GoalsTable createAlias(String alias) {
    return $GoalsTable(attachedDatabase, alias);
  }
}

class GoalRow extends DataClass implements Insertable<GoalRow> {
  final int goalId;
  final int weeklyWorkoutTarget;
  final int? userId;
  const GoalRow({
    required this.goalId,
    required this.weeklyWorkoutTarget,
    this.userId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['goal_id'] = Variable<int>(goalId);
    map['weekly_workout_target'] = Variable<int>(weeklyWorkoutTarget);
    if (!nullToAbsent || userId != null) {
      map['user_id'] = Variable<int>(userId);
    }
    return map;
  }

  GoalsCompanion toCompanion(bool nullToAbsent) {
    return GoalsCompanion(
      goalId: Value(goalId),
      weeklyWorkoutTarget: Value(weeklyWorkoutTarget),
      userId: userId == null && nullToAbsent
          ? const Value.absent()
          : Value(userId),
    );
  }

  factory GoalRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GoalRow(
      goalId: serializer.fromJson<int>(json['goalId']),
      weeklyWorkoutTarget: serializer.fromJson<int>(
        json['weeklyWorkoutTarget'],
      ),
      userId: serializer.fromJson<int?>(json['userId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'goalId': serializer.toJson<int>(goalId),
      'weeklyWorkoutTarget': serializer.toJson<int>(weeklyWorkoutTarget),
      'userId': serializer.toJson<int?>(userId),
    };
  }

  GoalRow copyWith({
    int? goalId,
    int? weeklyWorkoutTarget,
    Value<int?> userId = const Value.absent(),
  }) => GoalRow(
    goalId: goalId ?? this.goalId,
    weeklyWorkoutTarget: weeklyWorkoutTarget ?? this.weeklyWorkoutTarget,
    userId: userId.present ? userId.value : this.userId,
  );
  GoalRow copyWithCompanion(GoalsCompanion data) {
    return GoalRow(
      goalId: data.goalId.present ? data.goalId.value : this.goalId,
      weeklyWorkoutTarget: data.weeklyWorkoutTarget.present
          ? data.weeklyWorkoutTarget.value
          : this.weeklyWorkoutTarget,
      userId: data.userId.present ? data.userId.value : this.userId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GoalRow(')
          ..write('goalId: $goalId, ')
          ..write('weeklyWorkoutTarget: $weeklyWorkoutTarget, ')
          ..write('userId: $userId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(goalId, weeklyWorkoutTarget, userId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GoalRow &&
          other.goalId == this.goalId &&
          other.weeklyWorkoutTarget == this.weeklyWorkoutTarget &&
          other.userId == this.userId);
}

class GoalsCompanion extends UpdateCompanion<GoalRow> {
  final Value<int> goalId;
  final Value<int> weeklyWorkoutTarget;
  final Value<int?> userId;
  const GoalsCompanion({
    this.goalId = const Value.absent(),
    this.weeklyWorkoutTarget = const Value.absent(),
    this.userId = const Value.absent(),
  });
  GoalsCompanion.insert({
    this.goalId = const Value.absent(),
    required int weeklyWorkoutTarget,
    this.userId = const Value.absent(),
  }) : weeklyWorkoutTarget = Value(weeklyWorkoutTarget);
  static Insertable<GoalRow> custom({
    Expression<int>? goalId,
    Expression<int>? weeklyWorkoutTarget,
    Expression<int>? userId,
  }) {
    return RawValuesInsertable({
      if (goalId != null) 'goal_id': goalId,
      if (weeklyWorkoutTarget != null)
        'weekly_workout_target': weeklyWorkoutTarget,
      if (userId != null) 'user_id': userId,
    });
  }

  GoalsCompanion copyWith({
    Value<int>? goalId,
    Value<int>? weeklyWorkoutTarget,
    Value<int?>? userId,
  }) {
    return GoalsCompanion(
      goalId: goalId ?? this.goalId,
      weeklyWorkoutTarget: weeklyWorkoutTarget ?? this.weeklyWorkoutTarget,
      userId: userId ?? this.userId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (goalId.present) {
      map['goal_id'] = Variable<int>(goalId.value);
    }
    if (weeklyWorkoutTarget.present) {
      map['weekly_workout_target'] = Variable<int>(weeklyWorkoutTarget.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GoalsCompanion(')
          ..write('goalId: $goalId, ')
          ..write('weeklyWorkoutTarget: $weeklyWorkoutTarget, ')
          ..write('userId: $userId')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UsersTable users = $UsersTable(this);
  late final $ActivityTypesTable activityTypes = $ActivityTypesTable(this);
  late final $VirtualPetTable virtualPet = $VirtualPetTable(this);
  late final $ActivitiesTable activities = $ActivitiesTable(this);
  late final $SkillsTable skills = $SkillsTable(this);
  late final $GoalsTable goals = $GoalsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    users,
    activityTypes,
    virtualPet,
    activities,
    skills,
    goals,
  ];
}

typedef $$UsersTableCreateCompanionBuilder =
    UsersCompanion Function({
      Value<int> userId,
      Value<String?> googleId,
      required String name,
      Value<String?> email,
      Value<int?> height,
      Value<int?> weight,
    });
typedef $$UsersTableUpdateCompanionBuilder =
    UsersCompanion Function({
      Value<int> userId,
      Value<String?> googleId,
      Value<String> name,
      Value<String?> email,
      Value<int?> height,
      Value<int?> weight,
    });

final class $$UsersTableReferences
    extends BaseReferences<_$AppDatabase, $UsersTable, UserRow> {
  $$UsersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$VirtualPetTable, List<VirtualPetData>>
  _virtualPetRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.virtualPet,
    aliasName: 'users__user_id__virtual_pet__user_id',
  );

  $$VirtualPetTableProcessedTableManager get virtualPetRefs {
    final manager = $$VirtualPetTableTableManager(
      $_db,
      $_db.virtualPet,
    ).filter((f) => f.userId.userId.sqlEquals($_itemColumn<int>('user_id')!));

    final cache = $_typedResult.readTableOrNull(_virtualPetRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ActivitiesTable, List<ActivityRow>>
  _activitiesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.activities,
    aliasName: 'users__user_id__activities__user_id',
  );

  $$ActivitiesTableProcessedTableManager get activitiesRefs {
    final manager = $$ActivitiesTableTableManager(
      $_db,
      $_db.activities,
    ).filter((f) => f.userId.userId.sqlEquals($_itemColumn<int>('user_id')!));

    final cache = $_typedResult.readTableOrNull(_activitiesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$SkillsTable, List<Skill>> _skillsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.skills,
    aliasName: 'users__user_id__skills__user_id',
  );

  $$SkillsTableProcessedTableManager get skillsRefs {
    final manager = $$SkillsTableTableManager(
      $_db,
      $_db.skills,
    ).filter((f) => f.userId.userId.sqlEquals($_itemColumn<int>('user_id')!));

    final cache = $_typedResult.readTableOrNull(_skillsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$GoalsTable, List<GoalRow>> _goalsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.goals,
    aliasName: 'users__user_id__goals__user_id',
  );

  $$GoalsTableProcessedTableManager get goalsRefs {
    final manager = $$GoalsTableTableManager(
      $_db,
      $_db.goals,
    ).filter((f) => f.userId.userId.sqlEquals($_itemColumn<int>('user_id')!));

    final cache = $_typedResult.readTableOrNull(_goalsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$UsersTableFilterComposer extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get googleId => $composableBuilder(
    column: $table.googleId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get height => $composableBuilder(
    column: $table.height,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get weight => $composableBuilder(
    column: $table.weight,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> virtualPetRefs(
    Expression<bool> Function($$VirtualPetTableFilterComposer f) f,
  ) {
    final $$VirtualPetTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.virtualPet,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VirtualPetTableFilterComposer(
            $db: $db,
            $table: $db.virtualPet,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> activitiesRefs(
    Expression<bool> Function($$ActivitiesTableFilterComposer f) f,
  ) {
    final $$ActivitiesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.activities,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ActivitiesTableFilterComposer(
            $db: $db,
            $table: $db.activities,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> skillsRefs(
    Expression<bool> Function($$SkillsTableFilterComposer f) f,
  ) {
    final $$SkillsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.skills,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SkillsTableFilterComposer(
            $db: $db,
            $table: $db.skills,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> goalsRefs(
    Expression<bool> Function($$GoalsTableFilterComposer f) f,
  ) {
    final $$GoalsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.goals,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GoalsTableFilterComposer(
            $db: $db,
            $table: $db.goals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UsersTableOrderingComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get googleId => $composableBuilder(
    column: $table.googleId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get height => $composableBuilder(
    column: $table.height,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get weight => $composableBuilder(
    column: $table.weight,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UsersTableAnnotationComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get googleId =>
      $composableBuilder(column: $table.googleId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<int> get height =>
      $composableBuilder(column: $table.height, builder: (column) => column);

  GeneratedColumn<int> get weight =>
      $composableBuilder(column: $table.weight, builder: (column) => column);

  Expression<T> virtualPetRefs<T extends Object>(
    Expression<T> Function($$VirtualPetTableAnnotationComposer a) f,
  ) {
    final $$VirtualPetTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.virtualPet,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VirtualPetTableAnnotationComposer(
            $db: $db,
            $table: $db.virtualPet,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> activitiesRefs<T extends Object>(
    Expression<T> Function($$ActivitiesTableAnnotationComposer a) f,
  ) {
    final $$ActivitiesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.activities,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ActivitiesTableAnnotationComposer(
            $db: $db,
            $table: $db.activities,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> skillsRefs<T extends Object>(
    Expression<T> Function($$SkillsTableAnnotationComposer a) f,
  ) {
    final $$SkillsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.skills,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SkillsTableAnnotationComposer(
            $db: $db,
            $table: $db.skills,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> goalsRefs<T extends Object>(
    Expression<T> Function($$GoalsTableAnnotationComposer a) f,
  ) {
    final $$GoalsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.goals,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GoalsTableAnnotationComposer(
            $db: $db,
            $table: $db.goals,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UsersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UsersTable,
          UserRow,
          $$UsersTableFilterComposer,
          $$UsersTableOrderingComposer,
          $$UsersTableAnnotationComposer,
          $$UsersTableCreateCompanionBuilder,
          $$UsersTableUpdateCompanionBuilder,
          (UserRow, $$UsersTableReferences),
          UserRow,
          PrefetchHooks Function({
            bool virtualPetRefs,
            bool activitiesRefs,
            bool skillsRefs,
            bool goalsRefs,
          })
        > {
  $$UsersTableTableManager(_$AppDatabase db, $UsersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UsersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UsersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UsersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> userId = const Value.absent(),
                Value<String?> googleId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<int?> height = const Value.absent(),
                Value<int?> weight = const Value.absent(),
              }) => UsersCompanion(
                userId: userId,
                googleId: googleId,
                name: name,
                email: email,
                height: height,
                weight: weight,
              ),
          createCompanionCallback:
              ({
                Value<int> userId = const Value.absent(),
                Value<String?> googleId = const Value.absent(),
                required String name,
                Value<String?> email = const Value.absent(),
                Value<int?> height = const Value.absent(),
                Value<int?> weight = const Value.absent(),
              }) => UsersCompanion.insert(
                userId: userId,
                googleId: googleId,
                name: name,
                email: email,
                height: height,
                weight: weight,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$UsersTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                virtualPetRefs = false,
                activitiesRefs = false,
                skillsRefs = false,
                goalsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (virtualPetRefs) db.virtualPet,
                    if (activitiesRefs) db.activities,
                    if (skillsRefs) db.skills,
                    if (goalsRefs) db.goals,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (virtualPetRefs)
                        await $_getPrefetchedData<
                          UserRow,
                          $UsersTable,
                          VirtualPetData
                        >(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._virtualPetRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(
                                db,
                                table,
                                p0,
                              ).virtualPetRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.userId == item.userId,
                              ),
                          typedResults: items,
                        ),
                      if (activitiesRefs)
                        await $_getPrefetchedData<
                          UserRow,
                          $UsersTable,
                          ActivityRow
                        >(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._activitiesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(
                                db,
                                table,
                                p0,
                              ).activitiesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.userId == item.userId,
                              ),
                          typedResults: items,
                        ),
                      if (skillsRefs)
                        await $_getPrefetchedData<UserRow, $UsersTable, Skill>(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._skillsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(db, table, p0).skillsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.userId == item.userId,
                              ),
                          typedResults: items,
                        ),
                      if (goalsRefs)
                        await $_getPrefetchedData<
                          UserRow,
                          $UsersTable,
                          GoalRow
                        >(
                          currentTable: table,
                          referencedTable: $$UsersTableReferences
                              ._goalsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$UsersTableReferences(db, table, p0).goalsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.userId == item.userId,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$UsersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UsersTable,
      UserRow,
      $$UsersTableFilterComposer,
      $$UsersTableOrderingComposer,
      $$UsersTableAnnotationComposer,
      $$UsersTableCreateCompanionBuilder,
      $$UsersTableUpdateCompanionBuilder,
      (UserRow, $$UsersTableReferences),
      UserRow,
      PrefetchHooks Function({
        bool virtualPetRefs,
        bool activitiesRefs,
        bool skillsRefs,
        bool goalsRefs,
      })
    >;
typedef $$ActivityTypesTableCreateCompanionBuilder =
    ActivityTypesCompanion Function({
      Value<int> activityTypeId,
      required String title,
    });
typedef $$ActivityTypesTableUpdateCompanionBuilder =
    ActivityTypesCompanion Function({
      Value<int> activityTypeId,
      Value<String> title,
    });

final class $$ActivityTypesTableReferences
    extends
        BaseReferences<_$AppDatabase, $ActivityTypesTable, ActivityTypeRow> {
  $$ActivityTypesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$ActivitiesTable, List<ActivityRow>>
  _activitiesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.activities,
    aliasName: 'activity_types__activity_type_id__activities__activity_type_id',
  );

  $$ActivitiesTableProcessedTableManager get activitiesRefs {
    final manager = $$ActivitiesTableTableManager($_db, $_db.activities).filter(
      (f) => f.activityTypeId.activityTypeId.sqlEquals(
        $_itemColumn<int>('activity_type_id')!,
      ),
    );

    final cache = $_typedResult.readTableOrNull(_activitiesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$SkillsTable, List<Skill>> _skillsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.skills,
    aliasName: 'activity_types__activity_type_id__skills__activity_type_id',
  );

  $$SkillsTableProcessedTableManager get skillsRefs {
    final manager = $$SkillsTableTableManager($_db, $_db.skills).filter(
      (f) => f.activityTypeId.activityTypeId.sqlEquals(
        $_itemColumn<int>('activity_type_id')!,
      ),
    );

    final cache = $_typedResult.readTableOrNull(_skillsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ActivityTypesTableFilterComposer
    extends Composer<_$AppDatabase, $ActivityTypesTable> {
  $$ActivityTypesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get activityTypeId => $composableBuilder(
    column: $table.activityTypeId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> activitiesRefs(
    Expression<bool> Function($$ActivitiesTableFilterComposer f) f,
  ) {
    final $$ActivitiesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.activityTypeId,
      referencedTable: $db.activities,
      getReferencedColumn: (t) => t.activityTypeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ActivitiesTableFilterComposer(
            $db: $db,
            $table: $db.activities,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> skillsRefs(
    Expression<bool> Function($$SkillsTableFilterComposer f) f,
  ) {
    final $$SkillsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.activityTypeId,
      referencedTable: $db.skills,
      getReferencedColumn: (t) => t.activityTypeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SkillsTableFilterComposer(
            $db: $db,
            $table: $db.skills,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ActivityTypesTableOrderingComposer
    extends Composer<_$AppDatabase, $ActivityTypesTable> {
  $$ActivityTypesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get activityTypeId => $composableBuilder(
    column: $table.activityTypeId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ActivityTypesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ActivityTypesTable> {
  $$ActivityTypesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get activityTypeId => $composableBuilder(
    column: $table.activityTypeId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  Expression<T> activitiesRefs<T extends Object>(
    Expression<T> Function($$ActivitiesTableAnnotationComposer a) f,
  ) {
    final $$ActivitiesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.activityTypeId,
      referencedTable: $db.activities,
      getReferencedColumn: (t) => t.activityTypeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ActivitiesTableAnnotationComposer(
            $db: $db,
            $table: $db.activities,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> skillsRefs<T extends Object>(
    Expression<T> Function($$SkillsTableAnnotationComposer a) f,
  ) {
    final $$SkillsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.activityTypeId,
      referencedTable: $db.skills,
      getReferencedColumn: (t) => t.activityTypeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SkillsTableAnnotationComposer(
            $db: $db,
            $table: $db.skills,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ActivityTypesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ActivityTypesTable,
          ActivityTypeRow,
          $$ActivityTypesTableFilterComposer,
          $$ActivityTypesTableOrderingComposer,
          $$ActivityTypesTableAnnotationComposer,
          $$ActivityTypesTableCreateCompanionBuilder,
          $$ActivityTypesTableUpdateCompanionBuilder,
          (ActivityTypeRow, $$ActivityTypesTableReferences),
          ActivityTypeRow,
          PrefetchHooks Function({bool activitiesRefs, bool skillsRefs})
        > {
  $$ActivityTypesTableTableManager(_$AppDatabase db, $ActivityTypesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ActivityTypesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ActivityTypesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ActivityTypesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> activityTypeId = const Value.absent(),
                Value<String> title = const Value.absent(),
              }) => ActivityTypesCompanion(
                activityTypeId: activityTypeId,
                title: title,
              ),
          createCompanionCallback:
              ({
                Value<int> activityTypeId = const Value.absent(),
                required String title,
              }) => ActivityTypesCompanion.insert(
                activityTypeId: activityTypeId,
                title: title,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ActivityTypesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({activitiesRefs = false, skillsRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (activitiesRefs) db.activities,
                    if (skillsRefs) db.skills,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (activitiesRefs)
                        await $_getPrefetchedData<
                          ActivityTypeRow,
                          $ActivityTypesTable,
                          ActivityRow
                        >(
                          currentTable: table,
                          referencedTable: $$ActivityTypesTableReferences
                              ._activitiesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ActivityTypesTableReferences(
                                db,
                                table,
                                p0,
                              ).activitiesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.activityTypeId == item.activityTypeId,
                              ),
                          typedResults: items,
                        ),
                      if (skillsRefs)
                        await $_getPrefetchedData<
                          ActivityTypeRow,
                          $ActivityTypesTable,
                          Skill
                        >(
                          currentTable: table,
                          referencedTable: $$ActivityTypesTableReferences
                              ._skillsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ActivityTypesTableReferences(
                                db,
                                table,
                                p0,
                              ).skillsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.activityTypeId == item.activityTypeId,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$ActivityTypesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ActivityTypesTable,
      ActivityTypeRow,
      $$ActivityTypesTableFilterComposer,
      $$ActivityTypesTableOrderingComposer,
      $$ActivityTypesTableAnnotationComposer,
      $$ActivityTypesTableCreateCompanionBuilder,
      $$ActivityTypesTableUpdateCompanionBuilder,
      (ActivityTypeRow, $$ActivityTypesTableReferences),
      ActivityTypeRow,
      PrefetchHooks Function({bool activitiesRefs, bool skillsRefs})
    >;
typedef $$VirtualPetTableCreateCompanionBuilder =
    VirtualPetCompanion Function({
      Value<int> petvId,
      required String name,
      Value<int> life,
      Value<int> level,
      Value<int> points,
      Value<String> colorVariant,
      required int userId,
    });
typedef $$VirtualPetTableUpdateCompanionBuilder =
    VirtualPetCompanion Function({
      Value<int> petvId,
      Value<String> name,
      Value<int> life,
      Value<int> level,
      Value<int> points,
      Value<String> colorVariant,
      Value<int> userId,
    });

final class $$VirtualPetTableReferences
    extends BaseReferences<_$AppDatabase, $VirtualPetTable, VirtualPetData> {
  $$VirtualPetTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UsersTable _userIdTable(_$AppDatabase db) =>
      db.users.createAlias('virtual_pet__user_id__users__user_id');

  $$UsersTableProcessedTableManager get userId {
    final $_column = $_itemColumn<int>('user_id')!;

    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.userId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$VirtualPetTableFilterComposer
    extends Composer<_$AppDatabase, $VirtualPetTable> {
  $$VirtualPetTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get petvId => $composableBuilder(
    column: $table.petvId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get life => $composableBuilder(
    column: $table.life,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get level => $composableBuilder(
    column: $table.level,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get points => $composableBuilder(
    column: $table.points,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get colorVariant => $composableBuilder(
    column: $table.colorVariant,
    builder: (column) => ColumnFilters(column),
  );

  $$UsersTableFilterComposer get userId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$VirtualPetTableOrderingComposer
    extends Composer<_$AppDatabase, $VirtualPetTable> {
  $$VirtualPetTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get petvId => $composableBuilder(
    column: $table.petvId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get life => $composableBuilder(
    column: $table.life,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get level => $composableBuilder(
    column: $table.level,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get points => $composableBuilder(
    column: $table.points,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get colorVariant => $composableBuilder(
    column: $table.colorVariant,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsersTableOrderingComposer get userId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$VirtualPetTableAnnotationComposer
    extends Composer<_$AppDatabase, $VirtualPetTable> {
  $$VirtualPetTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get petvId =>
      $composableBuilder(column: $table.petvId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get life =>
      $composableBuilder(column: $table.life, builder: (column) => column);

  GeneratedColumn<int> get level =>
      $composableBuilder(column: $table.level, builder: (column) => column);

  GeneratedColumn<int> get points =>
      $composableBuilder(column: $table.points, builder: (column) => column);

  GeneratedColumn<String> get colorVariant => $composableBuilder(
    column: $table.colorVariant,
    builder: (column) => column,
  );

  $$UsersTableAnnotationComposer get userId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$VirtualPetTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $VirtualPetTable,
          VirtualPetData,
          $$VirtualPetTableFilterComposer,
          $$VirtualPetTableOrderingComposer,
          $$VirtualPetTableAnnotationComposer,
          $$VirtualPetTableCreateCompanionBuilder,
          $$VirtualPetTableUpdateCompanionBuilder,
          (VirtualPetData, $$VirtualPetTableReferences),
          VirtualPetData,
          PrefetchHooks Function({bool userId})
        > {
  $$VirtualPetTableTableManager(_$AppDatabase db, $VirtualPetTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$VirtualPetTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$VirtualPetTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$VirtualPetTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> petvId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> life = const Value.absent(),
                Value<int> level = const Value.absent(),
                Value<int> points = const Value.absent(),
                Value<String> colorVariant = const Value.absent(),
                Value<int> userId = const Value.absent(),
              }) => VirtualPetCompanion(
                petvId: petvId,
                name: name,
                life: life,
                level: level,
                points: points,
                colorVariant: colorVariant,
                userId: userId,
              ),
          createCompanionCallback:
              ({
                Value<int> petvId = const Value.absent(),
                required String name,
                Value<int> life = const Value.absent(),
                Value<int> level = const Value.absent(),
                Value<int> points = const Value.absent(),
                Value<String> colorVariant = const Value.absent(),
                required int userId,
              }) => VirtualPetCompanion.insert(
                petvId: petvId,
                name: name,
                life: life,
                level: level,
                points: points,
                colorVariant: colorVariant,
                userId: userId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$VirtualPetTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({userId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (userId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.userId,
                                referencedTable: $$VirtualPetTableReferences
                                    ._userIdTable(db),
                                referencedColumn: $$VirtualPetTableReferences
                                    ._userIdTable(db)
                                    .userId,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$VirtualPetTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $VirtualPetTable,
      VirtualPetData,
      $$VirtualPetTableFilterComposer,
      $$VirtualPetTableOrderingComposer,
      $$VirtualPetTableAnnotationComposer,
      $$VirtualPetTableCreateCompanionBuilder,
      $$VirtualPetTableUpdateCompanionBuilder,
      (VirtualPetData, $$VirtualPetTableReferences),
      VirtualPetData,
      PrefetchHooks Function({bool userId})
    >;
typedef $$ActivitiesTableCreateCompanionBuilder =
    ActivitiesCompanion Function({
      Value<int> activityId,
      required String title,
      required DateTime date,
      required int time,
      Value<int> points,
      Value<String?> description,
      required int activityTypeId,
      required int userId,
    });
typedef $$ActivitiesTableUpdateCompanionBuilder =
    ActivitiesCompanion Function({
      Value<int> activityId,
      Value<String> title,
      Value<DateTime> date,
      Value<int> time,
      Value<int> points,
      Value<String?> description,
      Value<int> activityTypeId,
      Value<int> userId,
    });

final class $$ActivitiesTableReferences
    extends BaseReferences<_$AppDatabase, $ActivitiesTable, ActivityRow> {
  $$ActivitiesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ActivityTypesTable _activityTypeIdTable(_$AppDatabase db) =>
      db.activityTypes.createAlias(
        'activities__activity_type_id__activity_types__activity_type_id',
      );

  $$ActivityTypesTableProcessedTableManager get activityTypeId {
    final $_column = $_itemColumn<int>('activity_type_id')!;

    final manager = $$ActivityTypesTableTableManager(
      $_db,
      $_db.activityTypes,
    ).filter((f) => f.activityTypeId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_activityTypeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $UsersTable _userIdTable(_$AppDatabase db) =>
      db.users.createAlias('activities__user_id__users__user_id');

  $$UsersTableProcessedTableManager get userId {
    final $_column = $_itemColumn<int>('user_id')!;

    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.userId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ActivitiesTableFilterComposer
    extends Composer<_$AppDatabase, $ActivitiesTable> {
  $$ActivitiesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get activityId => $composableBuilder(
    column: $table.activityId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get time => $composableBuilder(
    column: $table.time,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get points => $composableBuilder(
    column: $table.points,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  $$ActivityTypesTableFilterComposer get activityTypeId {
    final $$ActivityTypesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.activityTypeId,
      referencedTable: $db.activityTypes,
      getReferencedColumn: (t) => t.activityTypeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ActivityTypesTableFilterComposer(
            $db: $db,
            $table: $db.activityTypes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UsersTableFilterComposer get userId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ActivitiesTableOrderingComposer
    extends Composer<_$AppDatabase, $ActivitiesTable> {
  $$ActivitiesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get activityId => $composableBuilder(
    column: $table.activityId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get time => $composableBuilder(
    column: $table.time,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get points => $composableBuilder(
    column: $table.points,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  $$ActivityTypesTableOrderingComposer get activityTypeId {
    final $$ActivityTypesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.activityTypeId,
      referencedTable: $db.activityTypes,
      getReferencedColumn: (t) => t.activityTypeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ActivityTypesTableOrderingComposer(
            $db: $db,
            $table: $db.activityTypes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UsersTableOrderingComposer get userId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ActivitiesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ActivitiesTable> {
  $$ActivitiesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get activityId => $composableBuilder(
    column: $table.activityId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<int> get time =>
      $composableBuilder(column: $table.time, builder: (column) => column);

  GeneratedColumn<int> get points =>
      $composableBuilder(column: $table.points, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  $$ActivityTypesTableAnnotationComposer get activityTypeId {
    final $$ActivityTypesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.activityTypeId,
      referencedTable: $db.activityTypes,
      getReferencedColumn: (t) => t.activityTypeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ActivityTypesTableAnnotationComposer(
            $db: $db,
            $table: $db.activityTypes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$UsersTableAnnotationComposer get userId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ActivitiesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ActivitiesTable,
          ActivityRow,
          $$ActivitiesTableFilterComposer,
          $$ActivitiesTableOrderingComposer,
          $$ActivitiesTableAnnotationComposer,
          $$ActivitiesTableCreateCompanionBuilder,
          $$ActivitiesTableUpdateCompanionBuilder,
          (ActivityRow, $$ActivitiesTableReferences),
          ActivityRow,
          PrefetchHooks Function({bool activityTypeId, bool userId})
        > {
  $$ActivitiesTableTableManager(_$AppDatabase db, $ActivitiesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ActivitiesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ActivitiesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ActivitiesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> activityId = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<int> time = const Value.absent(),
                Value<int> points = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<int> activityTypeId = const Value.absent(),
                Value<int> userId = const Value.absent(),
              }) => ActivitiesCompanion(
                activityId: activityId,
                title: title,
                date: date,
                time: time,
                points: points,
                description: description,
                activityTypeId: activityTypeId,
                userId: userId,
              ),
          createCompanionCallback:
              ({
                Value<int> activityId = const Value.absent(),
                required String title,
                required DateTime date,
                required int time,
                Value<int> points = const Value.absent(),
                Value<String?> description = const Value.absent(),
                required int activityTypeId,
                required int userId,
              }) => ActivitiesCompanion.insert(
                activityId: activityId,
                title: title,
                date: date,
                time: time,
                points: points,
                description: description,
                activityTypeId: activityTypeId,
                userId: userId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ActivitiesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({activityTypeId = false, userId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (activityTypeId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.activityTypeId,
                                referencedTable: $$ActivitiesTableReferences
                                    ._activityTypeIdTable(db),
                                referencedColumn: $$ActivitiesTableReferences
                                    ._activityTypeIdTable(db)
                                    .activityTypeId,
                              )
                              as T;
                    }
                    if (userId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.userId,
                                referencedTable: $$ActivitiesTableReferences
                                    ._userIdTable(db),
                                referencedColumn: $$ActivitiesTableReferences
                                    ._userIdTable(db)
                                    .userId,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ActivitiesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ActivitiesTable,
      ActivityRow,
      $$ActivitiesTableFilterComposer,
      $$ActivitiesTableOrderingComposer,
      $$ActivitiesTableAnnotationComposer,
      $$ActivitiesTableCreateCompanionBuilder,
      $$ActivitiesTableUpdateCompanionBuilder,
      (ActivityRow, $$ActivitiesTableReferences),
      ActivityRow,
      PrefetchHooks Function({bool activityTypeId, bool userId})
    >;
typedef $$SkillsTableCreateCompanionBuilder =
    SkillsCompanion Function({
      Value<int> skillId,
      required String title,
      Value<int> level,
      Value<int> currentProgress,
      required int userId,
      required int activityTypeId,
    });
typedef $$SkillsTableUpdateCompanionBuilder =
    SkillsCompanion Function({
      Value<int> skillId,
      Value<String> title,
      Value<int> level,
      Value<int> currentProgress,
      Value<int> userId,
      Value<int> activityTypeId,
    });

final class $$SkillsTableReferences
    extends BaseReferences<_$AppDatabase, $SkillsTable, Skill> {
  $$SkillsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UsersTable _userIdTable(_$AppDatabase db) =>
      db.users.createAlias('skills__user_id__users__user_id');

  $$UsersTableProcessedTableManager get userId {
    final $_column = $_itemColumn<int>('user_id')!;

    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.userId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ActivityTypesTable _activityTypeIdTable(_$AppDatabase db) =>
      db.activityTypes.createAlias(
        'skills__activity_type_id__activity_types__activity_type_id',
      );

  $$ActivityTypesTableProcessedTableManager get activityTypeId {
    final $_column = $_itemColumn<int>('activity_type_id')!;

    final manager = $$ActivityTypesTableTableManager(
      $_db,
      $_db.activityTypes,
    ).filter((f) => f.activityTypeId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_activityTypeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$SkillsTableFilterComposer
    extends Composer<_$AppDatabase, $SkillsTable> {
  $$SkillsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get skillId => $composableBuilder(
    column: $table.skillId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get level => $composableBuilder(
    column: $table.level,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get currentProgress => $composableBuilder(
    column: $table.currentProgress,
    builder: (column) => ColumnFilters(column),
  );

  $$UsersTableFilterComposer get userId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ActivityTypesTableFilterComposer get activityTypeId {
    final $$ActivityTypesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.activityTypeId,
      referencedTable: $db.activityTypes,
      getReferencedColumn: (t) => t.activityTypeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ActivityTypesTableFilterComposer(
            $db: $db,
            $table: $db.activityTypes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SkillsTableOrderingComposer
    extends Composer<_$AppDatabase, $SkillsTable> {
  $$SkillsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get skillId => $composableBuilder(
    column: $table.skillId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get level => $composableBuilder(
    column: $table.level,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get currentProgress => $composableBuilder(
    column: $table.currentProgress,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsersTableOrderingComposer get userId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ActivityTypesTableOrderingComposer get activityTypeId {
    final $$ActivityTypesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.activityTypeId,
      referencedTable: $db.activityTypes,
      getReferencedColumn: (t) => t.activityTypeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ActivityTypesTableOrderingComposer(
            $db: $db,
            $table: $db.activityTypes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SkillsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SkillsTable> {
  $$SkillsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get skillId =>
      $composableBuilder(column: $table.skillId, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<int> get level =>
      $composableBuilder(column: $table.level, builder: (column) => column);

  GeneratedColumn<int> get currentProgress => $composableBuilder(
    column: $table.currentProgress,
    builder: (column) => column,
  );

  $$UsersTableAnnotationComposer get userId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ActivityTypesTableAnnotationComposer get activityTypeId {
    final $$ActivityTypesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.activityTypeId,
      referencedTable: $db.activityTypes,
      getReferencedColumn: (t) => t.activityTypeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ActivityTypesTableAnnotationComposer(
            $db: $db,
            $table: $db.activityTypes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SkillsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SkillsTable,
          Skill,
          $$SkillsTableFilterComposer,
          $$SkillsTableOrderingComposer,
          $$SkillsTableAnnotationComposer,
          $$SkillsTableCreateCompanionBuilder,
          $$SkillsTableUpdateCompanionBuilder,
          (Skill, $$SkillsTableReferences),
          Skill,
          PrefetchHooks Function({bool userId, bool activityTypeId})
        > {
  $$SkillsTableTableManager(_$AppDatabase db, $SkillsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SkillsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SkillsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SkillsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> skillId = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<int> level = const Value.absent(),
                Value<int> currentProgress = const Value.absent(),
                Value<int> userId = const Value.absent(),
                Value<int> activityTypeId = const Value.absent(),
              }) => SkillsCompanion(
                skillId: skillId,
                title: title,
                level: level,
                currentProgress: currentProgress,
                userId: userId,
                activityTypeId: activityTypeId,
              ),
          createCompanionCallback:
              ({
                Value<int> skillId = const Value.absent(),
                required String title,
                Value<int> level = const Value.absent(),
                Value<int> currentProgress = const Value.absent(),
                required int userId,
                required int activityTypeId,
              }) => SkillsCompanion.insert(
                skillId: skillId,
                title: title,
                level: level,
                currentProgress: currentProgress,
                userId: userId,
                activityTypeId: activityTypeId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$SkillsTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({userId = false, activityTypeId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (userId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.userId,
                                referencedTable: $$SkillsTableReferences
                                    ._userIdTable(db),
                                referencedColumn: $$SkillsTableReferences
                                    ._userIdTable(db)
                                    .userId,
                              )
                              as T;
                    }
                    if (activityTypeId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.activityTypeId,
                                referencedTable: $$SkillsTableReferences
                                    ._activityTypeIdTable(db),
                                referencedColumn: $$SkillsTableReferences
                                    ._activityTypeIdTable(db)
                                    .activityTypeId,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$SkillsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SkillsTable,
      Skill,
      $$SkillsTableFilterComposer,
      $$SkillsTableOrderingComposer,
      $$SkillsTableAnnotationComposer,
      $$SkillsTableCreateCompanionBuilder,
      $$SkillsTableUpdateCompanionBuilder,
      (Skill, $$SkillsTableReferences),
      Skill,
      PrefetchHooks Function({bool userId, bool activityTypeId})
    >;
typedef $$GoalsTableCreateCompanionBuilder =
    GoalsCompanion Function({
      Value<int> goalId,
      required int weeklyWorkoutTarget,
      Value<int?> userId,
    });
typedef $$GoalsTableUpdateCompanionBuilder =
    GoalsCompanion Function({
      Value<int> goalId,
      Value<int> weeklyWorkoutTarget,
      Value<int?> userId,
    });

final class $$GoalsTableReferences
    extends BaseReferences<_$AppDatabase, $GoalsTable, GoalRow> {
  $$GoalsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UsersTable _userIdTable(_$AppDatabase db) =>
      db.users.createAlias('goals__user_id__users__user_id');

  $$UsersTableProcessedTableManager? get userId {
    final $_column = $_itemColumn<int>('user_id');
    if ($_column == null) return null;
    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.userId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$GoalsTableFilterComposer extends Composer<_$AppDatabase, $GoalsTable> {
  $$GoalsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get goalId => $composableBuilder(
    column: $table.goalId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get weeklyWorkoutTarget => $composableBuilder(
    column: $table.weeklyWorkoutTarget,
    builder: (column) => ColumnFilters(column),
  );

  $$UsersTableFilterComposer get userId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$GoalsTableOrderingComposer
    extends Composer<_$AppDatabase, $GoalsTable> {
  $$GoalsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get goalId => $composableBuilder(
    column: $table.goalId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get weeklyWorkoutTarget => $composableBuilder(
    column: $table.weeklyWorkoutTarget,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsersTableOrderingComposer get userId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$GoalsTableAnnotationComposer
    extends Composer<_$AppDatabase, $GoalsTable> {
  $$GoalsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get goalId =>
      $composableBuilder(column: $table.goalId, builder: (column) => column);

  GeneratedColumn<int> get weeklyWorkoutTarget => $composableBuilder(
    column: $table.weeklyWorkoutTarget,
    builder: (column) => column,
  );

  $$UsersTableAnnotationComposer get userId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$GoalsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $GoalsTable,
          GoalRow,
          $$GoalsTableFilterComposer,
          $$GoalsTableOrderingComposer,
          $$GoalsTableAnnotationComposer,
          $$GoalsTableCreateCompanionBuilder,
          $$GoalsTableUpdateCompanionBuilder,
          (GoalRow, $$GoalsTableReferences),
          GoalRow,
          PrefetchHooks Function({bool userId})
        > {
  $$GoalsTableTableManager(_$AppDatabase db, $GoalsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GoalsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GoalsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GoalsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> goalId = const Value.absent(),
                Value<int> weeklyWorkoutTarget = const Value.absent(),
                Value<int?> userId = const Value.absent(),
              }) => GoalsCompanion(
                goalId: goalId,
                weeklyWorkoutTarget: weeklyWorkoutTarget,
                userId: userId,
              ),
          createCompanionCallback:
              ({
                Value<int> goalId = const Value.absent(),
                required int weeklyWorkoutTarget,
                Value<int?> userId = const Value.absent(),
              }) => GoalsCompanion.insert(
                goalId: goalId,
                weeklyWorkoutTarget: weeklyWorkoutTarget,
                userId: userId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$GoalsTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({userId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (userId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.userId,
                                referencedTable: $$GoalsTableReferences
                                    ._userIdTable(db),
                                referencedColumn: $$GoalsTableReferences
                                    ._userIdTable(db)
                                    .userId,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$GoalsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $GoalsTable,
      GoalRow,
      $$GoalsTableFilterComposer,
      $$GoalsTableOrderingComposer,
      $$GoalsTableAnnotationComposer,
      $$GoalsTableCreateCompanionBuilder,
      $$GoalsTableUpdateCompanionBuilder,
      (GoalRow, $$GoalsTableReferences),
      GoalRow,
      PrefetchHooks Function({bool userId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db, _db.users);
  $$ActivityTypesTableTableManager get activityTypes =>
      $$ActivityTypesTableTableManager(_db, _db.activityTypes);
  $$VirtualPetTableTableManager get virtualPet =>
      $$VirtualPetTableTableManager(_db, _db.virtualPet);
  $$ActivitiesTableTableManager get activities =>
      $$ActivitiesTableTableManager(_db, _db.activities);
  $$SkillsTableTableManager get skills =>
      $$SkillsTableTableManager(_db, _db.skills);
  $$GoalsTableTableManager get goals =>
      $$GoalsTableTableManager(_db, _db.goals);
}
