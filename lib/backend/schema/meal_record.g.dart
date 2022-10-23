// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MealRecord> _$mealRecordSerializer = new _$MealRecordSerializer();

class _$MealRecordSerializer implements StructuredSerializer<MealRecord> {
  @override
  final Iterable<Type> types = const [MealRecord, _$MealRecord];
  @override
  final String wireName = 'MealRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, MealRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('ID')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.price;
    if (value != null) {
      result
        ..add('price')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.hostID;
    if (value != null) {
      result
        ..add('host_ID')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.time;
    if (value != null) {
      result
        ..add('time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.capacity;
    if (value != null) {
      result
        ..add('capacity')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.photoUrl;
    if (value != null) {
      result
        ..add('photo_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.spotsTaken;
    if (value != null) {
      result
        ..add('spots_taken')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.location;
    if (value != null) {
      result
        ..add('location')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.tokenLeft;
    if (value != null) {
      result
        ..add('token_left')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
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
  MealRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MealRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ID':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'price':
          result.price = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'host_ID':
          result.hostID = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'time':
          result.time = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'capacity':
          result.capacity = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'photo_url':
          result.photoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'spots_taken':
          result.spotsTaken = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'location':
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'token_left':
          result.tokenLeft = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
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

class _$MealRecord extends MealRecord {
  @override
  final String? id;
  @override
  final int? price;
  @override
  final DocumentReference<Object?>? hostID;
  @override
  final DateTime? time;
  @override
  final int? capacity;
  @override
  final String? description;
  @override
  final String? name;
  @override
  final String? photoUrl;
  @override
  final int? spotsTaken;
  @override
  final String? location;
  @override
  final int? tokenLeft;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$MealRecord([void Function(MealRecordBuilder)? updates]) =>
      (new MealRecordBuilder()..update(updates))._build();

  _$MealRecord._(
      {this.id,
      this.price,
      this.hostID,
      this.time,
      this.capacity,
      this.description,
      this.name,
      this.photoUrl,
      this.spotsTaken,
      this.location,
      this.tokenLeft,
      this.ffRef})
      : super._();

  @override
  MealRecord rebuild(void Function(MealRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MealRecordBuilder toBuilder() => new MealRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MealRecord &&
        id == other.id &&
        price == other.price &&
        hostID == other.hostID &&
        time == other.time &&
        capacity == other.capacity &&
        description == other.description &&
        name == other.name &&
        photoUrl == other.photoUrl &&
        spotsTaken == other.spotsTaken &&
        location == other.location &&
        tokenLeft == other.tokenLeft &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc($jc(0, id.hashCode),
                                                price.hashCode),
                                            hostID.hashCode),
                                        time.hashCode),
                                    capacity.hashCode),
                                description.hashCode),
                            name.hashCode),
                        photoUrl.hashCode),
                    spotsTaken.hashCode),
                location.hashCode),
            tokenLeft.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MealRecord')
          ..add('id', id)
          ..add('price', price)
          ..add('hostID', hostID)
          ..add('time', time)
          ..add('capacity', capacity)
          ..add('description', description)
          ..add('name', name)
          ..add('photoUrl', photoUrl)
          ..add('spotsTaken', spotsTaken)
          ..add('location', location)
          ..add('tokenLeft', tokenLeft)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class MealRecordBuilder implements Builder<MealRecord, MealRecordBuilder> {
  _$MealRecord? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  int? _price;
  int? get price => _$this._price;
  set price(int? price) => _$this._price = price;

  DocumentReference<Object?>? _hostID;
  DocumentReference<Object?>? get hostID => _$this._hostID;
  set hostID(DocumentReference<Object?>? hostID) => _$this._hostID = hostID;

  DateTime? _time;
  DateTime? get time => _$this._time;
  set time(DateTime? time) => _$this._time = time;

  int? _capacity;
  int? get capacity => _$this._capacity;
  set capacity(int? capacity) => _$this._capacity = capacity;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _photoUrl;
  String? get photoUrl => _$this._photoUrl;
  set photoUrl(String? photoUrl) => _$this._photoUrl = photoUrl;

  int? _spotsTaken;
  int? get spotsTaken => _$this._spotsTaken;
  set spotsTaken(int? spotsTaken) => _$this._spotsTaken = spotsTaken;

  String? _location;
  String? get location => _$this._location;
  set location(String? location) => _$this._location = location;

  int? _tokenLeft;
  int? get tokenLeft => _$this._tokenLeft;
  set tokenLeft(int? tokenLeft) => _$this._tokenLeft = tokenLeft;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  MealRecordBuilder() {
    MealRecord._initializeBuilder(this);
  }

  MealRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _price = $v.price;
      _hostID = $v.hostID;
      _time = $v.time;
      _capacity = $v.capacity;
      _description = $v.description;
      _name = $v.name;
      _photoUrl = $v.photoUrl;
      _spotsTaken = $v.spotsTaken;
      _location = $v.location;
      _tokenLeft = $v.tokenLeft;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MealRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MealRecord;
  }

  @override
  void update(void Function(MealRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MealRecord build() => _build();

  _$MealRecord _build() {
    final _$result = _$v ??
        new _$MealRecord._(
            id: id,
            price: price,
            hostID: hostID,
            time: time,
            capacity: capacity,
            description: description,
            name: name,
            photoUrl: photoUrl,
            spotsTaken: spotsTaken,
            location: location,
            tokenLeft: tokenLeft,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
