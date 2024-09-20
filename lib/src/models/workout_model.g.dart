// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetWorkoutModelCollection on Isar {
  IsarCollection<WorkoutModel> get workoutModels => this.collection();
}

const WorkoutModelSchema = CollectionSchema(
  name: r'WorkoutModel',
  id: -3690729546837745423,
  properties: {
    r'date': PropertySchema(
      id: 0,
      name: r'date',
      type: IsarType.dateTime,
    ),
    r'setList': PropertySchema(
      id: 1,
      name: r'setList',
      type: IsarType.objectList,
      target: r'SetModel',
    )
  },
  estimateSize: _workoutModelEstimateSize,
  serialize: _workoutModelSerialize,
  deserialize: _workoutModelDeserialize,
  deserializeProp: _workoutModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {r'SetModel': SetModelSchema},
  getId: _workoutModelGetId,
  getLinks: _workoutModelGetLinks,
  attach: _workoutModelAttach,
  version: '3.1.0+1',
);

int _workoutModelEstimateSize(
  WorkoutModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.setList.length * 3;
  {
    final offsets = allOffsets[SetModel]!;
    for (var i = 0; i < object.setList.length; i++) {
      final value = object.setList[i];
      bytesCount += SetModelSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  return bytesCount;
}

void _workoutModelSerialize(
  WorkoutModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.date);
  writer.writeObjectList<SetModel>(
    offsets[1],
    allOffsets,
    SetModelSchema.serialize,
    object.setList,
  );
}

WorkoutModel _workoutModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = WorkoutModel(
    date: reader.readDateTime(offsets[0]),
    setList: reader.readObjectList<SetModel>(
          offsets[1],
          SetModelSchema.deserialize,
          allOffsets,
          SetModel(),
        ) ??
        [],
  );
  object.id = id;
  return object;
}

P _workoutModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readObjectList<SetModel>(
            offset,
            SetModelSchema.deserialize,
            allOffsets,
            SetModel(),
          ) ??
          []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _workoutModelGetId(WorkoutModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _workoutModelGetLinks(WorkoutModel object) {
  return [];
}

void _workoutModelAttach(
    IsarCollection<dynamic> col, Id id, WorkoutModel object) {
  object.id = id;
}

extension WorkoutModelQueryWhereSort
    on QueryBuilder<WorkoutModel, WorkoutModel, QWhere> {
  QueryBuilder<WorkoutModel, WorkoutModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension WorkoutModelQueryWhere
    on QueryBuilder<WorkoutModel, WorkoutModel, QWhereClause> {
  QueryBuilder<WorkoutModel, WorkoutModel, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<WorkoutModel, WorkoutModel, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<WorkoutModel, WorkoutModel, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<WorkoutModel, WorkoutModel, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<WorkoutModel, WorkoutModel, QAfterWhereClause> idBetween(
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
}

extension WorkoutModelQueryFilter
    on QueryBuilder<WorkoutModel, WorkoutModel, QFilterCondition> {
  QueryBuilder<WorkoutModel, WorkoutModel, QAfterFilterCondition> dateEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutModel, WorkoutModel, QAfterFilterCondition>
      dateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutModel, WorkoutModel, QAfterFilterCondition> dateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutModel, WorkoutModel, QAfterFilterCondition> dateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'date',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<WorkoutModel, WorkoutModel, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<WorkoutModel, WorkoutModel, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<WorkoutModel, WorkoutModel, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<WorkoutModel, WorkoutModel, QAfterFilterCondition> idBetween(
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

  QueryBuilder<WorkoutModel, WorkoutModel, QAfterFilterCondition>
      setListLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'setList',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<WorkoutModel, WorkoutModel, QAfterFilterCondition>
      setListIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'setList',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<WorkoutModel, WorkoutModel, QAfterFilterCondition>
      setListIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'setList',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WorkoutModel, WorkoutModel, QAfterFilterCondition>
      setListLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'setList',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<WorkoutModel, WorkoutModel, QAfterFilterCondition>
      setListLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'setList',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<WorkoutModel, WorkoutModel, QAfterFilterCondition>
      setListLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'setList',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension WorkoutModelQueryObject
    on QueryBuilder<WorkoutModel, WorkoutModel, QFilterCondition> {
  QueryBuilder<WorkoutModel, WorkoutModel, QAfterFilterCondition>
      setListElement(FilterQuery<SetModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'setList');
    });
  }
}

extension WorkoutModelQueryLinks
    on QueryBuilder<WorkoutModel, WorkoutModel, QFilterCondition> {}

extension WorkoutModelQuerySortBy
    on QueryBuilder<WorkoutModel, WorkoutModel, QSortBy> {
  QueryBuilder<WorkoutModel, WorkoutModel, QAfterSortBy> sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<WorkoutModel, WorkoutModel, QAfterSortBy> sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }
}

extension WorkoutModelQuerySortThenBy
    on QueryBuilder<WorkoutModel, WorkoutModel, QSortThenBy> {
  QueryBuilder<WorkoutModel, WorkoutModel, QAfterSortBy> thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<WorkoutModel, WorkoutModel, QAfterSortBy> thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<WorkoutModel, WorkoutModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<WorkoutModel, WorkoutModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension WorkoutModelQueryWhereDistinct
    on QueryBuilder<WorkoutModel, WorkoutModel, QDistinct> {
  QueryBuilder<WorkoutModel, WorkoutModel, QDistinct> distinctByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date');
    });
  }
}

extension WorkoutModelQueryProperty
    on QueryBuilder<WorkoutModel, WorkoutModel, QQueryProperty> {
  QueryBuilder<WorkoutModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<WorkoutModel, DateTime, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<WorkoutModel, List<SetModel>, QQueryOperations>
      setListProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'setList');
    });
  }
}
