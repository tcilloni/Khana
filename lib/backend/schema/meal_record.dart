import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'meal_record.g.dart';

abstract class MealRecord implements Built<MealRecord, MealRecordBuilder> {
  static Serializer<MealRecord> get serializer => _$mealRecordSerializer;

  @BuiltValueField(wireName: 'ID')
  String? get id;

  int? get price;

  @BuiltValueField(wireName: 'host_ID')
  DocumentReference? get hostID;

  DateTime? get time;

  int? get capacity;

  String? get description;

  String? get name;

  @BuiltValueField(wireName: 'photo_url')
  String? get photoUrl;

  @BuiltValueField(wireName: 'spots_taken')
  int? get spotsTaken;

  String? get location;

  @BuiltValueField(wireName: 'token_left')
  int? get tokenLeft;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(MealRecordBuilder builder) => builder
    ..id = ''
    ..price = 0
    ..capacity = 0
    ..description = ''
    ..name = ''
    ..photoUrl = ''
    ..spotsTaken = 0
    ..location = ''
    ..tokenLeft = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('meal');

  static Stream<MealRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<MealRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  MealRecord._();
  factory MealRecord([void Function(MealRecordBuilder) updates]) = _$MealRecord;

  static MealRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createMealRecordData({
  String? id,
  int? price,
  DocumentReference? hostID,
  DateTime? time,
  int? capacity,
  String? description,
  String? name,
  String? photoUrl,
  int? spotsTaken,
  String? location,
  int? tokenLeft,
}) {
  final firestoreData = serializers.toFirestore(
    MealRecord.serializer,
    MealRecord(
      (m) => m
        ..id = id
        ..price = price
        ..hostID = hostID
        ..time = time
        ..capacity = capacity
        ..description = description
        ..name = name
        ..photoUrl = photoUrl
        ..spotsTaken = spotsTaken
        ..location = location
        ..tokenLeft = tokenLeft,
    ),
  );

  return firestoreData;
}
