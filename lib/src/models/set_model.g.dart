// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_model.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const SetModelSchema = Schema(
  name: r'SetModel',
  id: -8098667979550129543,
  properties: {
    r'exercise': PropertySchema(
      id: 0,
      name: r'exercise',
      type: IsarType.byte,
      enumMap: _SetModelexerciseEnumValueMap,
    ),
    r'repetitions': PropertySchema(
      id: 1,
      name: r'repetitions',
      type: IsarType.long,
    ),
    r'weight': PropertySchema(
      id: 2,
      name: r'weight',
      type: IsarType.double,
    )
  },
  estimateSize: _setModelEstimateSize,
  serialize: _setModelSerialize,
  deserialize: _setModelDeserialize,
  deserializeProp: _setModelDeserializeProp,
);

int _setModelEstimateSize(
  SetModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _setModelSerialize(
  SetModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeByte(offsets[0], object.exercise.index);
  writer.writeLong(offsets[1], object.repetitions);
  writer.writeDouble(offsets[2], object.weight);
}

SetModel _setModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SetModel(
    exercise:
        _SetModelexerciseValueEnumMap[reader.readByteOrNull(offsets[0])] ??
            Exercise.squat,
    repetitions: reader.readLongOrNull(offsets[1]),
    weight: reader.readDoubleOrNull(offsets[2]),
  );
  return object;
}

P _setModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (_SetModelexerciseValueEnumMap[reader.readByteOrNull(offset)] ??
          Exercise.squat) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readDoubleOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _SetModelexerciseEnumValueMap = {
  'barbellRow': 0,
  'benchPress': 1,
  'shoulderPress': 2,
  'deadlift': 3,
  'squat': 4,
};
const _SetModelexerciseValueEnumMap = {
  0: Exercise.barbellRow,
  1: Exercise.benchPress,
  2: Exercise.shoulderPress,
  3: Exercise.deadlift,
  4: Exercise.squat,
};

extension SetModelQueryFilter
    on QueryBuilder<SetModel, SetModel, QFilterCondition> {
  QueryBuilder<SetModel, SetModel, QAfterFilterCondition> exerciseEqualTo(
      Exercise value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'exercise',
        value: value,
      ));
    });
  }

  QueryBuilder<SetModel, SetModel, QAfterFilterCondition> exerciseGreaterThan(
    Exercise value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'exercise',
        value: value,
      ));
    });
  }

  QueryBuilder<SetModel, SetModel, QAfterFilterCondition> exerciseLessThan(
    Exercise value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'exercise',
        value: value,
      ));
    });
  }

  QueryBuilder<SetModel, SetModel, QAfterFilterCondition> exerciseBetween(
    Exercise lower,
    Exercise upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'exercise',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SetModel, SetModel, QAfterFilterCondition> repetitionsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'repetitions',
      ));
    });
  }

  QueryBuilder<SetModel, SetModel, QAfterFilterCondition>
      repetitionsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'repetitions',
      ));
    });
  }

  QueryBuilder<SetModel, SetModel, QAfterFilterCondition> repetitionsEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'repetitions',
        value: value,
      ));
    });
  }

  QueryBuilder<SetModel, SetModel, QAfterFilterCondition>
      repetitionsGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'repetitions',
        value: value,
      ));
    });
  }

  QueryBuilder<SetModel, SetModel, QAfterFilterCondition> repetitionsLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'repetitions',
        value: value,
      ));
    });
  }

  QueryBuilder<SetModel, SetModel, QAfterFilterCondition> repetitionsBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'repetitions',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SetModel, SetModel, QAfterFilterCondition> weightIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'weight',
      ));
    });
  }

  QueryBuilder<SetModel, SetModel, QAfterFilterCondition> weightIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'weight',
      ));
    });
  }

  QueryBuilder<SetModel, SetModel, QAfterFilterCondition> weightEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'weight',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SetModel, SetModel, QAfterFilterCondition> weightGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'weight',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SetModel, SetModel, QAfterFilterCondition> weightLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'weight',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SetModel, SetModel, QAfterFilterCondition> weightBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'weight',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension SetModelQueryObject
    on QueryBuilder<SetModel, SetModel, QFilterCondition> {}
