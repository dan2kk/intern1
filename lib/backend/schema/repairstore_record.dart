import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'repairstore_record.g.dart';

abstract class RepairstoreRecord
    implements Built<RepairstoreRecord, RepairstoreRecordBuilder> {
  static Serializer<RepairstoreRecord> get serializer =>
      _$repairstoreRecordSerializer;

  @nullable
  String get name;

  @nullable
  @BuiltValueField(wireName: 'phone_num')
  String get phoneNum;

  @nullable
  String get address;

  @nullable
  @BuiltValueField(wireName: 'img_url')
  BuiltList<String> get imgUrl;

  @nullable
  double get rate;

  @nullable
  @BuiltValueField(wireName: 'img_url1')
  String get imgUrl1;

  @nullable
  String get breif;

  @nullable
  int get idx;

  @nullable
  LatLng get coordinate;

  @nullable
  String get category;

  @nullable
  @BuiltValueField(wireName: 'rate_num')
  int get rateNum;

  @nullable
  String get explain;

  @nullable
  int get storeidx;

  @nullable
  BuiltList<String> get hashtag;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(RepairstoreRecordBuilder builder) => builder
    ..name = ''
    ..phoneNum = ''
    ..address = ''
    ..imgUrl = ListBuilder()
    ..rate = 0.0
    ..imgUrl1 = ''
    ..breif = ''
    ..idx = 0
    ..category = ''
    ..rateNum = 0
    ..explain = ''
    ..storeidx = 0
    ..hashtag = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('repairstore');

  static Stream<RepairstoreRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<RepairstoreRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  RepairstoreRecord._();
  factory RepairstoreRecord([void Function(RepairstoreRecordBuilder) updates]) =
      _$RepairstoreRecord;

  static RepairstoreRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createRepairstoreRecordData({
  String name,
  String phoneNum,
  String address,
  double rate,
  String imgUrl1,
  String breif,
  int idx,
  LatLng coordinate,
  String category,
  int rateNum,
  String explain,
  int storeidx,
}) =>
    serializers.toFirestore(
        RepairstoreRecord.serializer,
        RepairstoreRecord((r) => r
          ..name = name
          ..phoneNum = phoneNum
          ..address = address
          ..imgUrl = null
          ..rate = rate
          ..imgUrl1 = imgUrl1
          ..breif = breif
          ..idx = idx
          ..coordinate = coordinate
          ..category = category
          ..rateNum = rateNum
          ..explain = explain
          ..storeidx = storeidx
          ..hashtag = null));
