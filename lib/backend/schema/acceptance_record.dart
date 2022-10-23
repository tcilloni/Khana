import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'acceptance_record.g.dart';

abstract class AcceptanceRecord
    implements Built<AcceptanceRecord, AcceptanceRecordBuilder> {
  static Serializer<AcceptanceRecord> get serializer =>
      _$acceptanceRecordSerializer;

  @BuiltValueField(wireName: 'meal_ID')
  DocumentReference? get mealID;

  @BuiltValueField(wireName: 'client_ID')
  DocumentReference? get clientID;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(AcceptanceRecordBuilder builder) => builder;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('acceptance');

  static Stream<AcceptanceRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<AcceptanceRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  AcceptanceRecord._();
  factory AcceptanceRecord([void Function(AcceptanceRecordBuilder) updates]) =
      _$AcceptanceRecord;

  static AcceptanceRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createAcceptanceRecordData({
  DocumentReference? mealID,
  DocumentReference? clientID,
}) {
  final firestoreData = serializers.toFirestore(
    AcceptanceRecord.serializer,
    AcceptanceRecord(
      (a) => a
        ..mealID = mealID
        ..clientID = clientID,
    ),
  );

  return firestoreData;
}
