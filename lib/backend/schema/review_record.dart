import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'review_record.g.dart';

abstract class ReviewRecord
    implements Built<ReviewRecord, ReviewRecordBuilder> {
  static Serializer<ReviewRecord> get serializer => _$reviewRecordSerializer;

  @nullable
  int get storeidx;

  @nullable
  String get uid;

  @nullable
  @BuiltValueField(wireName: 'photo_url')
  BuiltList<String> get photoUrl;

  @nullable
  String get review;

  @nullable
  @BuiltValueField(wireName: 'u_name')
  String get uName;

  @nullable
  DateTime get timestamp;

  @nullable
  @BuiltValueField(wireName: 'rate_avg')
  double get rateAvg;

  @nullable
  @BuiltValueField(wireName: 'review_id')
  String get reviewId;

  @nullable
  String get comment;

  @nullable
  int get estimatedtime;

  @nullable
  double get rate1;

  @nullable
  double get rate2;

  @nullable
  double get rate3;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ReviewRecordBuilder builder) => builder
    ..storeidx = 0
    ..uid = ''
    ..photoUrl = ListBuilder()
    ..review = ''
    ..uName = ''
    ..rateAvg = 0.0
    ..reviewId = ''
    ..comment = ''
    ..estimatedtime = 0
    ..rate1 = 0.0
    ..rate2 = 0.0
    ..rate3 = 0.0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('review');

  static Stream<ReviewRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<ReviewRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  ReviewRecord._();
  factory ReviewRecord([void Function(ReviewRecordBuilder) updates]) =
      _$ReviewRecord;

  static ReviewRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createReviewRecordData({
  int storeidx,
  String uid,
  String review,
  String uName,
  DateTime timestamp,
  double rateAvg,
  String reviewId,
  String comment,
  int estimatedtime,
  double rate1,
  double rate2,
  double rate3,
}) =>
    serializers.toFirestore(
        ReviewRecord.serializer,
        ReviewRecord((r) => r
          ..storeidx = storeidx
          ..uid = uid
          ..photoUrl = null
          ..review = review
          ..uName = uName
          ..timestamp = timestamp
          ..rateAvg = rateAvg
          ..reviewId = reviewId
          ..comment = comment
          ..estimatedtime = estimatedtime
          ..rate1 = rate1
          ..rate2 = rate2
          ..rate3 = rate3));
