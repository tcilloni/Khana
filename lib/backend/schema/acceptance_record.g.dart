// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'acceptance_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AcceptanceRecord> _$acceptanceRecordSerializer =
    new _$AcceptanceRecordSerializer();

class _$AcceptanceRecordSerializer
    implements StructuredSerializer<AcceptanceRecord> {
  @override
  final Iterable<Type> types = const [AcceptanceRecord, _$AcceptanceRecord];
  @override
  final String wireName = 'AcceptanceRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, AcceptanceRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.mealID;
    if (value != null) {
      result
        ..add('meal_ID')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.clientID;
    if (value != null) {
      result
        ..add('client_ID')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  AcceptanceRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AcceptanceRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'meal_ID':
          result.mealID = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'client_ID':
          result.clientID = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$AcceptanceRecord extends AcceptanceRecord {
  @override
  final DocumentReference<Object?>? mealID;
  @override
  final DocumentReference<Object?>? clientID;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$AcceptanceRecord(
          [void Function(AcceptanceRecordBuilder)? updates]) =>
      (new AcceptanceRecordBuilder()..update(updates))._build();

  _$AcceptanceRecord._({this.mealID, this.clientID, this.ffRef}) : super._();

  @override
  AcceptanceRecord rebuild(void Function(AcceptanceRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AcceptanceRecordBuilder toBuilder() =>
      new AcceptanceRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AcceptanceRecord &&
        mealID == other.mealID &&
        clientID == other.clientID &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, mealID.hashCode), clientID.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'AcceptanceRecord')
          ..add('mealID', mealID)
          ..add('clientID', clientID)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class AcceptanceRecordBuilder
    implements Builder<AcceptanceRecord, AcceptanceRecordBuilder> {
  _$AcceptanceRecord? _$v;

  DocumentReference<Object?>? _mealID;
  DocumentReference<Object?>? get mealID => _$this._mealID;
  set mealID(DocumentReference<Object?>? mealID) => _$this._mealID = mealID;

  DocumentReference<Object?>? _clientID;
  DocumentReference<Object?>? get clientID => _$this._clientID;
  set clientID(DocumentReference<Object?>? clientID) =>
      _$this._clientID = clientID;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  AcceptanceRecordBuilder() {
    AcceptanceRecord._initializeBuilder(this);
  }

  AcceptanceRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _mealID = $v.mealID;
      _clientID = $v.clientID;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AcceptanceRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AcceptanceRecord;
  }

  @override
  void update(void Function(AcceptanceRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  AcceptanceRecord build() => _build();

  _$AcceptanceRecord _build() {
    final _$result = _$v ??
        new _$AcceptanceRecord._(
            mealID: mealID, clientID: clientID, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
