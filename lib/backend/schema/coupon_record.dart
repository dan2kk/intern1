import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'coupon_record.g.dart';

abstract class CouponRecord
    implements Built<CouponRecord, CouponRecordBuilder> {
  static Serializer<CouponRecord> get serializer => _$couponRecordSerializer;

  @nullable
  int get amount;

  @nullable
  int get maxamount;

  @nullable
  @BuiltValueField(wireName: 'expire_date')
  DateTime get expireDate;

  @nullable
  @BuiltValueField(wireName: 'earned_date')
  DateTime get earnedDate;

  @nullable
  @BuiltValueField(wireName: 'coupon_num')
  String get couponNum;

  @nullable
  String get explain;

  @nullable
  bool get used;

  @nullable
  String get uid;

  @nullable
  String get breif;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(CouponRecordBuilder builder) => builder
    ..amount = 0
    ..maxamount = 0
    ..couponNum = ''
    ..explain = ''
    ..used = false
    ..uid = ''
    ..breif = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('coupon');

  static Stream<CouponRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<CouponRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  CouponRecord._();
  factory CouponRecord([void Function(CouponRecordBuilder) updates]) =
      _$CouponRecord;

  static CouponRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createCouponRecordData({
  int amount,
  int maxamount,
  DateTime expireDate,
  DateTime earnedDate,
  String couponNum,
  String explain,
  bool used,
  String uid,
  String breif,
}) =>
    serializers.toFirestore(
        CouponRecord.serializer,
        CouponRecord((c) => c
          ..amount = amount
          ..maxamount = maxamount
          ..expireDate = expireDate
          ..earnedDate = earnedDate
          ..couponNum = couponNum
          ..explain = explain
          ..used = used
          ..uid = uid
          ..breif = breif));
