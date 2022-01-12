import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'points_record.g.dart';

abstract class PointsRecord
    implements Built<PointsRecord, PointsRecordBuilder> {
  static Serializer<PointsRecord> get serializer => _$pointsRecordSerializer;

  @nullable
  int get amount;

  @nullable
  @BuiltValueField(wireName: 'expire_date')
  DateTime get expireDate;

  @nullable
  @BuiltValueField(wireName: 'earned_date')
  DateTime get earnedDate;

  @nullable
  String get reason;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(PointsRecordBuilder builder) => builder
    ..amount = 0
    ..reason = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('points');

  static Stream<PointsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<PointsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  PointsRecord._();
  factory PointsRecord([void Function(PointsRecordBuilder) updates]) =
      _$PointsRecord;

  static PointsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createPointsRecordData({
  int amount,
  DateTime expireDate,
  DateTime earnedDate,
  String reason,
}) =>
    serializers.toFirestore(
        PointsRecord.serializer,
        PointsRecord((p) => p
          ..amount = amount
          ..expireDate = expireDate
          ..earnedDate = earnedDate
          ..reason = reason));
