import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'repairment_record.g.dart';

abstract class RepairmentRecord
    implements Built<RepairmentRecord, RepairmentRecordBuilder> {
  static Serializer<RepairmentRecord> get serializer =>
      _$repairmentRecordSerializer;

  @nullable
  int get storeidx;

  @nullable
  String get userid;

  @nullable
  String get category;

  @nullable
  String get manufacture;

  @nullable
  String get model;

  @nullable
  @BuiltValueField(wireName: 'broken_part')
  String get brokenPart;

  @nullable
  String get symptom;

  @nullable
  @BuiltValueField(wireName: 'img_url')
  String get imgUrl;

  @nullable
  @BuiltValueField(wireName: 'pickup_direct')
  bool get pickupDirect;

  @nullable
  String get address;

  @nullable
  int get price;

  @nullable
  LatLng get geopoint;

  @nullable
  int get status;

  @nullable
  String get transactionid;

  @nullable
  String get repairmentid;

  @nullable
  DateTime get timestamp;

  @nullable
  DateTime get select;

  @nullable
  @BuiltValueField(wireName: 'video_url')
  String get videoUrl;

  @nullable
  String get comment;

  @nullable
  @BuiltValueField(wireName: 'est_date')
  int get estDate;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(RepairmentRecordBuilder builder) => builder
    ..storeidx = 0
    ..userid = ''
    ..category = ''
    ..manufacture = ''
    ..model = ''
    ..brokenPart = ''
    ..symptom = ''
    ..imgUrl = ''
    ..pickupDirect = false
    ..address = ''
    ..price = 0
    ..status = 0
    ..transactionid = ''
    ..repairmentid = ''
    ..videoUrl = ''
    ..comment = ''
    ..estDate = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('repairment');

  static Stream<RepairmentRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<RepairmentRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  RepairmentRecord._();
  factory RepairmentRecord([void Function(RepairmentRecordBuilder) updates]) =
      _$RepairmentRecord;

  static RepairmentRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createRepairmentRecordData({
  int storeidx,
  String userid,
  String category,
  String manufacture,
  String model,
  String brokenPart,
  String symptom,
  String imgUrl,
  bool pickupDirect,
  String address,
  int price,
  LatLng geopoint,
  int status,
  String transactionid,
  String repairmentid,
  DateTime timestamp,
  DateTime select,
  String videoUrl,
  String comment,
  int estDate,
}) =>
    serializers.toFirestore(
        RepairmentRecord.serializer,
        RepairmentRecord((r) => r
          ..storeidx = storeidx
          ..userid = userid
          ..category = category
          ..manufacture = manufacture
          ..model = model
          ..brokenPart = brokenPart
          ..symptom = symptom
          ..imgUrl = imgUrl
          ..pickupDirect = pickupDirect
          ..address = address
          ..price = price
          ..geopoint = geopoint
          ..status = status
          ..transactionid = transactionid
          ..repairmentid = repairmentid
          ..timestamp = timestamp
          ..select = select
          ..videoUrl = videoUrl
          ..comment = comment
          ..estDate = estDate));
