// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actress.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetActressCollection on Isar {
  IsarCollection<Actress> get actress => this.collection();
}

const ActressSchema = CollectionSchema(
  name: r'Actress',
  id: 8894477815608597418,
  properties: {
    r'birthDate': PropertySchema(
      id: 0,
      name: r'birthDate',
      type: IsarType.dateTime,
    ),
    r'bust': PropertySchema(
      id: 1,
      name: r'bust',
      type: IsarType.long,
    ),
    r'dmmId': PropertySchema(
      id: 2,
      name: r'dmmId',
      type: IsarType.long,
    ),
    r'height': PropertySchema(
      id: 3,
      name: r'height',
      type: IsarType.string,
    ),
    r'hip': PropertySchema(
      id: 4,
      name: r'hip',
      type: IsarType.long,
    ),
    r'imageUrl': PropertySchema(
      id: 5,
      name: r'imageUrl',
      type: IsarType.string,
    ),
    r'isFavorite': PropertySchema(
      id: 6,
      name: r'isFavorite',
      type: IsarType.bool,
    ),
    r'name': PropertySchema(
      id: 7,
      name: r'name',
      type: IsarType.string,
    ),
    r'ruby': PropertySchema(
      id: 8,
      name: r'ruby',
      type: IsarType.string,
    ),
    r'waist': PropertySchema(
      id: 9,
      name: r'waist',
      type: IsarType.long,
    )
  },
  estimateSize: _actressEstimateSize,
  serialize: _actressSerialize,
  deserialize: _actressDeserialize,
  deserializeProp: _actressDeserializeProp,
  idName: r'id',
  indexes: {
    r'dmmId': IndexSchema(
      id: -9091967004031515641,
      name: r'dmmId',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'dmmId',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'name': IndexSchema(
      id: 879695947855722453,
      name: r'name',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'name',
          type: IndexType.value,
          caseSensitive: true,
        )
      ],
    ),
    r'bust': IndexSchema(
      id: 354080097291223689,
      name: r'bust',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'bust',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'birthDate': IndexSchema(
      id: -6248906684002595105,
      name: r'birthDate',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'birthDate',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'isFavorite': IndexSchema(
      id: 5742774614603939776,
      name: r'isFavorite',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'isFavorite',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _actressGetId,
  getLinks: _actressGetLinks,
  attach: _actressAttach,
  version: '3.1.0+1',
);

int _actressEstimateSize(
  Actress object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.height;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.imageUrl;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.ruby;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _actressSerialize(
  Actress object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.birthDate);
  writer.writeLong(offsets[1], object.bust);
  writer.writeLong(offsets[2], object.dmmId);
  writer.writeString(offsets[3], object.height);
  writer.writeLong(offsets[4], object.hip);
  writer.writeString(offsets[5], object.imageUrl);
  writer.writeBool(offsets[6], object.isFavorite);
  writer.writeString(offsets[7], object.name);
  writer.writeString(offsets[8], object.ruby);
  writer.writeLong(offsets[9], object.waist);
}

Actress _actressDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Actress();
  object.birthDate = reader.readDateTimeOrNull(offsets[0]);
  object.bust = reader.readLongOrNull(offsets[1]);
  object.dmmId = reader.readLongOrNull(offsets[2]);
  object.height = reader.readStringOrNull(offsets[3]);
  object.hip = reader.readLongOrNull(offsets[4]);
  object.id = id;
  object.imageUrl = reader.readStringOrNull(offsets[5]);
  object.isFavorite = reader.readBool(offsets[6]);
  object.name = reader.readStringOrNull(offsets[7]);
  object.ruby = reader.readStringOrNull(offsets[8]);
  object.waist = reader.readLongOrNull(offsets[9]);
  return object;
}

P _actressDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readLongOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readLongOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _actressGetId(Actress object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _actressGetLinks(Actress object) {
  return [];
}

void _actressAttach(IsarCollection<dynamic> col, Id id, Actress object) {
  object.id = id;
}

extension ActressByIndex on IsarCollection<Actress> {
  Future<Actress?> getByDmmId(int? dmmId) {
    return getByIndex(r'dmmId', [dmmId]);
  }

  Actress? getByDmmIdSync(int? dmmId) {
    return getByIndexSync(r'dmmId', [dmmId]);
  }

  Future<bool> deleteByDmmId(int? dmmId) {
    return deleteByIndex(r'dmmId', [dmmId]);
  }

  bool deleteByDmmIdSync(int? dmmId) {
    return deleteByIndexSync(r'dmmId', [dmmId]);
  }

  Future<List<Actress?>> getAllByDmmId(List<int?> dmmIdValues) {
    final values = dmmIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'dmmId', values);
  }

  List<Actress?> getAllByDmmIdSync(List<int?> dmmIdValues) {
    final values = dmmIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'dmmId', values);
  }

  Future<int> deleteAllByDmmId(List<int?> dmmIdValues) {
    final values = dmmIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'dmmId', values);
  }

  int deleteAllByDmmIdSync(List<int?> dmmIdValues) {
    final values = dmmIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'dmmId', values);
  }

  Future<Id> putByDmmId(Actress object) {
    return putByIndex(r'dmmId', object);
  }

  Id putByDmmIdSync(Actress object, {bool saveLinks = true}) {
    return putByIndexSync(r'dmmId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByDmmId(List<Actress> objects) {
    return putAllByIndex(r'dmmId', objects);
  }

  List<Id> putAllByDmmIdSync(List<Actress> objects, {bool saveLinks = true}) {
    return putAllByIndexSync(r'dmmId', objects, saveLinks: saveLinks);
  }
}

extension ActressQueryWhereSort on QueryBuilder<Actress, Actress, QWhere> {
  QueryBuilder<Actress, Actress, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<Actress, Actress, QAfterWhere> anyDmmId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'dmmId'),
      );
    });
  }

  QueryBuilder<Actress, Actress, QAfterWhere> anyName() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'name'),
      );
    });
  }

  QueryBuilder<Actress, Actress, QAfterWhere> anyBust() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'bust'),
      );
    });
  }

  QueryBuilder<Actress, Actress, QAfterWhere> anyBirthDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'birthDate'),
      );
    });
  }

  QueryBuilder<Actress, Actress, QAfterWhere> anyIsFavorite() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'isFavorite'),
      );
    });
  }
}

extension ActressQueryWhere on QueryBuilder<Actress, Actress, QWhereClause> {
  QueryBuilder<Actress, Actress, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Actress, Actress, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Actress, Actress, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Actress, Actress, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterWhereClause> dmmIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'dmmId',
        value: [null],
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterWhereClause> dmmIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'dmmId',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterWhereClause> dmmIdEqualTo(int? dmmId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'dmmId',
        value: [dmmId],
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterWhereClause> dmmIdNotEqualTo(
      int? dmmId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'dmmId',
              lower: [],
              upper: [dmmId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'dmmId',
              lower: [dmmId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'dmmId',
              lower: [dmmId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'dmmId',
              lower: [],
              upper: [dmmId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Actress, Actress, QAfterWhereClause> dmmIdGreaterThan(
    int? dmmId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'dmmId',
        lower: [dmmId],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterWhereClause> dmmIdLessThan(
    int? dmmId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'dmmId',
        lower: [],
        upper: [dmmId],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterWhereClause> dmmIdBetween(
    int? lowerDmmId,
    int? upperDmmId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'dmmId',
        lower: [lowerDmmId],
        includeLower: includeLower,
        upper: [upperDmmId],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterWhereClause> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'name',
        value: [null],
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterWhereClause> nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'name',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterWhereClause> nameEqualTo(String? name) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'name',
        value: [name],
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterWhereClause> nameNotEqualTo(
      String? name) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [],
              upper: [name],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [name],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [name],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'name',
              lower: [],
              upper: [name],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Actress, Actress, QAfterWhereClause> nameGreaterThan(
    String? name, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'name',
        lower: [name],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterWhereClause> nameLessThan(
    String? name, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'name',
        lower: [],
        upper: [name],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterWhereClause> nameBetween(
    String? lowerName,
    String? upperName, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'name',
        lower: [lowerName],
        includeLower: includeLower,
        upper: [upperName],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterWhereClause> nameStartsWith(
      String NamePrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'name',
        lower: [NamePrefix],
        upper: ['$NamePrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterWhereClause> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'name',
        value: [''],
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterWhereClause> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'name',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'name',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'name',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'name',
              upper: [''],
            ));
      }
    });
  }

  QueryBuilder<Actress, Actress, QAfterWhereClause> bustIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'bust',
        value: [null],
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterWhereClause> bustIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'bust',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterWhereClause> bustEqualTo(int? bust) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'bust',
        value: [bust],
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterWhereClause> bustNotEqualTo(int? bust) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'bust',
              lower: [],
              upper: [bust],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'bust',
              lower: [bust],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'bust',
              lower: [bust],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'bust',
              lower: [],
              upper: [bust],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Actress, Actress, QAfterWhereClause> bustGreaterThan(
    int? bust, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'bust',
        lower: [bust],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterWhereClause> bustLessThan(
    int? bust, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'bust',
        lower: [],
        upper: [bust],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterWhereClause> bustBetween(
    int? lowerBust,
    int? upperBust, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'bust',
        lower: [lowerBust],
        includeLower: includeLower,
        upper: [upperBust],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterWhereClause> birthDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'birthDate',
        value: [null],
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterWhereClause> birthDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'birthDate',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterWhereClause> birthDateEqualTo(
      DateTime? birthDate) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'birthDate',
        value: [birthDate],
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterWhereClause> birthDateNotEqualTo(
      DateTime? birthDate) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'birthDate',
              lower: [],
              upper: [birthDate],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'birthDate',
              lower: [birthDate],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'birthDate',
              lower: [birthDate],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'birthDate',
              lower: [],
              upper: [birthDate],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Actress, Actress, QAfterWhereClause> birthDateGreaterThan(
    DateTime? birthDate, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'birthDate',
        lower: [birthDate],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterWhereClause> birthDateLessThan(
    DateTime? birthDate, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'birthDate',
        lower: [],
        upper: [birthDate],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterWhereClause> birthDateBetween(
    DateTime? lowerBirthDate,
    DateTime? upperBirthDate, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'birthDate',
        lower: [lowerBirthDate],
        includeLower: includeLower,
        upper: [upperBirthDate],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterWhereClause> isFavoriteEqualTo(
      bool isFavorite) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'isFavorite',
        value: [isFavorite],
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterWhereClause> isFavoriteNotEqualTo(
      bool isFavorite) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isFavorite',
              lower: [],
              upper: [isFavorite],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isFavorite',
              lower: [isFavorite],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isFavorite',
              lower: [isFavorite],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'isFavorite',
              lower: [],
              upper: [isFavorite],
              includeUpper: false,
            ));
      }
    });
  }
}

extension ActressQueryFilter
    on QueryBuilder<Actress, Actress, QFilterCondition> {
  QueryBuilder<Actress, Actress, QAfterFilterCondition> birthDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'birthDate',
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterFilterCondition> birthDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'birthDate',
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterFilterCondition> birthDateEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'birthDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterFilterCondition> birthDateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'birthDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterFilterCondition> birthDateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'birthDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterFilterCondition> birthDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'birthDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterFilterCondition> bustIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'bust',
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterFilterCondition> bustIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'bust',
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterFilterCondition> bustEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bust',
        value: value,
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterFilterCondition> bustGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bust',
        value: value,
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterFilterCondition> bustLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bust',
        value: value,
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterFilterCondition> bustBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bust',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterFilterCondition> dmmIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'dmmId',
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterFilterCondition> dmmIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'dmmId',
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterFilterCondition> dmmIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dmmId',
        value: value,
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterFilterCondition> dmmIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dmmId',
        value: value,
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterFilterCondition> dmmIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dmmId',
        value: value,
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterFilterCondition> dmmIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dmmId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterFilterCondition> heightIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'height',
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterFilterCondition> heightIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'height',
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterFilterCondition> heightEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'height',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterFilterCondition> heightGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'height',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterFilterCondition> heightLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'height',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterFilterCondition> heightBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'height',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterFilterCondition> heightStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'height',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterFilterCondition> heightEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'height',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterFilterCondition> heightContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'height',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterFilterCondition> heightMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'height',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterFilterCondition> heightIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'height',
        value: '',
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterFilterCondition> heightIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'height',
        value: '',
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterFilterCondition> hipIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'hip',
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterFilterCondition> hipIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'hip',
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterFilterCondition> hipEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hip',
        value: value,
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterFilterCondition> hipGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hip',
        value: value,
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterFilterCondition> hipLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hip',
        value: value,
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterFilterCondition> hipBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hip',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterFilterCondition> imageUrlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'imageUrl',
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterFilterCondition> imageUrlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'imageUrl',
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterFilterCondition> imageUrlEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterFilterCondition> imageUrlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterFilterCondition> imageUrlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterFilterCondition> imageUrlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'imageUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterFilterCondition> imageUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterFilterCondition> imageUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterFilterCondition> imageUrlContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterFilterCondition> imageUrlMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'imageUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterFilterCondition> imageUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imageUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterFilterCondition> imageUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'imageUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterFilterCondition> isFavoriteEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isFavorite',
        value: value,
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterFilterCondition> nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterFilterCondition> nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterFilterCondition> nameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterFilterCondition> nameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterFilterCondition> nameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterFilterCondition> nameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterFilterCondition> rubyIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ruby',
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterFilterCondition> rubyIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ruby',
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterFilterCondition> rubyEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ruby',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterFilterCondition> rubyGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ruby',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterFilterCondition> rubyLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ruby',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterFilterCondition> rubyBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ruby',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterFilterCondition> rubyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'ruby',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterFilterCondition> rubyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'ruby',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterFilterCondition> rubyContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'ruby',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterFilterCondition> rubyMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'ruby',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterFilterCondition> rubyIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ruby',
        value: '',
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterFilterCondition> rubyIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'ruby',
        value: '',
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterFilterCondition> waistIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'waist',
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterFilterCondition> waistIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'waist',
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterFilterCondition> waistEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'waist',
        value: value,
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterFilterCondition> waistGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'waist',
        value: value,
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterFilterCondition> waistLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'waist',
        value: value,
      ));
    });
  }

  QueryBuilder<Actress, Actress, QAfterFilterCondition> waistBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'waist',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ActressQueryObject
    on QueryBuilder<Actress, Actress, QFilterCondition> {}

extension ActressQueryLinks
    on QueryBuilder<Actress, Actress, QFilterCondition> {}

extension ActressQuerySortBy on QueryBuilder<Actress, Actress, QSortBy> {
  QueryBuilder<Actress, Actress, QAfterSortBy> sortByBirthDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'birthDate', Sort.asc);
    });
  }

  QueryBuilder<Actress, Actress, QAfterSortBy> sortByBirthDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'birthDate', Sort.desc);
    });
  }

  QueryBuilder<Actress, Actress, QAfterSortBy> sortByBust() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bust', Sort.asc);
    });
  }

  QueryBuilder<Actress, Actress, QAfterSortBy> sortByBustDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bust', Sort.desc);
    });
  }

  QueryBuilder<Actress, Actress, QAfterSortBy> sortByDmmId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dmmId', Sort.asc);
    });
  }

  QueryBuilder<Actress, Actress, QAfterSortBy> sortByDmmIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dmmId', Sort.desc);
    });
  }

  QueryBuilder<Actress, Actress, QAfterSortBy> sortByHeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'height', Sort.asc);
    });
  }

  QueryBuilder<Actress, Actress, QAfterSortBy> sortByHeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'height', Sort.desc);
    });
  }

  QueryBuilder<Actress, Actress, QAfterSortBy> sortByHip() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hip', Sort.asc);
    });
  }

  QueryBuilder<Actress, Actress, QAfterSortBy> sortByHipDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hip', Sort.desc);
    });
  }

  QueryBuilder<Actress, Actress, QAfterSortBy> sortByImageUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageUrl', Sort.asc);
    });
  }

  QueryBuilder<Actress, Actress, QAfterSortBy> sortByImageUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageUrl', Sort.desc);
    });
  }

  QueryBuilder<Actress, Actress, QAfterSortBy> sortByIsFavorite() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.asc);
    });
  }

  QueryBuilder<Actress, Actress, QAfterSortBy> sortByIsFavoriteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.desc);
    });
  }

  QueryBuilder<Actress, Actress, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Actress, Actress, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Actress, Actress, QAfterSortBy> sortByRuby() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ruby', Sort.asc);
    });
  }

  QueryBuilder<Actress, Actress, QAfterSortBy> sortByRubyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ruby', Sort.desc);
    });
  }

  QueryBuilder<Actress, Actress, QAfterSortBy> sortByWaist() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'waist', Sort.asc);
    });
  }

  QueryBuilder<Actress, Actress, QAfterSortBy> sortByWaistDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'waist', Sort.desc);
    });
  }
}

extension ActressQuerySortThenBy
    on QueryBuilder<Actress, Actress, QSortThenBy> {
  QueryBuilder<Actress, Actress, QAfterSortBy> thenByBirthDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'birthDate', Sort.asc);
    });
  }

  QueryBuilder<Actress, Actress, QAfterSortBy> thenByBirthDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'birthDate', Sort.desc);
    });
  }

  QueryBuilder<Actress, Actress, QAfterSortBy> thenByBust() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bust', Sort.asc);
    });
  }

  QueryBuilder<Actress, Actress, QAfterSortBy> thenByBustDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bust', Sort.desc);
    });
  }

  QueryBuilder<Actress, Actress, QAfterSortBy> thenByDmmId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dmmId', Sort.asc);
    });
  }

  QueryBuilder<Actress, Actress, QAfterSortBy> thenByDmmIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dmmId', Sort.desc);
    });
  }

  QueryBuilder<Actress, Actress, QAfterSortBy> thenByHeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'height', Sort.asc);
    });
  }

  QueryBuilder<Actress, Actress, QAfterSortBy> thenByHeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'height', Sort.desc);
    });
  }

  QueryBuilder<Actress, Actress, QAfterSortBy> thenByHip() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hip', Sort.asc);
    });
  }

  QueryBuilder<Actress, Actress, QAfterSortBy> thenByHipDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hip', Sort.desc);
    });
  }

  QueryBuilder<Actress, Actress, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Actress, Actress, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Actress, Actress, QAfterSortBy> thenByImageUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageUrl', Sort.asc);
    });
  }

  QueryBuilder<Actress, Actress, QAfterSortBy> thenByImageUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageUrl', Sort.desc);
    });
  }

  QueryBuilder<Actress, Actress, QAfterSortBy> thenByIsFavorite() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.asc);
    });
  }

  QueryBuilder<Actress, Actress, QAfterSortBy> thenByIsFavoriteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.desc);
    });
  }

  QueryBuilder<Actress, Actress, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Actress, Actress, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Actress, Actress, QAfterSortBy> thenByRuby() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ruby', Sort.asc);
    });
  }

  QueryBuilder<Actress, Actress, QAfterSortBy> thenByRubyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ruby', Sort.desc);
    });
  }

  QueryBuilder<Actress, Actress, QAfterSortBy> thenByWaist() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'waist', Sort.asc);
    });
  }

  QueryBuilder<Actress, Actress, QAfterSortBy> thenByWaistDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'waist', Sort.desc);
    });
  }
}

extension ActressQueryWhereDistinct
    on QueryBuilder<Actress, Actress, QDistinct> {
  QueryBuilder<Actress, Actress, QDistinct> distinctByBirthDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'birthDate');
    });
  }

  QueryBuilder<Actress, Actress, QDistinct> distinctByBust() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bust');
    });
  }

  QueryBuilder<Actress, Actress, QDistinct> distinctByDmmId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dmmId');
    });
  }

  QueryBuilder<Actress, Actress, QDistinct> distinctByHeight(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'height', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Actress, Actress, QDistinct> distinctByHip() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hip');
    });
  }

  QueryBuilder<Actress, Actress, QDistinct> distinctByImageUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'imageUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Actress, Actress, QDistinct> distinctByIsFavorite() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isFavorite');
    });
  }

  QueryBuilder<Actress, Actress, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Actress, Actress, QDistinct> distinctByRuby(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ruby', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Actress, Actress, QDistinct> distinctByWaist() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'waist');
    });
  }
}

extension ActressQueryProperty
    on QueryBuilder<Actress, Actress, QQueryProperty> {
  QueryBuilder<Actress, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Actress, DateTime?, QQueryOperations> birthDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'birthDate');
    });
  }

  QueryBuilder<Actress, int?, QQueryOperations> bustProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bust');
    });
  }

  QueryBuilder<Actress, int?, QQueryOperations> dmmIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dmmId');
    });
  }

  QueryBuilder<Actress, String?, QQueryOperations> heightProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'height');
    });
  }

  QueryBuilder<Actress, int?, QQueryOperations> hipProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hip');
    });
  }

  QueryBuilder<Actress, String?, QQueryOperations> imageUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'imageUrl');
    });
  }

  QueryBuilder<Actress, bool, QQueryOperations> isFavoriteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isFavorite');
    });
  }

  QueryBuilder<Actress, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<Actress, String?, QQueryOperations> rubyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ruby');
    });
  }

  QueryBuilder<Actress, int?, QQueryOperations> waistProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'waist');
    });
  }
}
