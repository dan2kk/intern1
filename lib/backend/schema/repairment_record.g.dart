// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repairment_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<RepairmentRecord> _$repairmentRecordSerializer =
    new _$RepairmentRecordSerializer();

class _$RepairmentRecordSerializer
    implements StructuredSerializer<RepairmentRecord> {
  @override
  final Iterable<Type> types = const [RepairmentRecord, _$RepairmentRecord];
  @override
  final String wireName = 'RepairmentRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, RepairmentRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.storeidx;
    if (value != null) {
      result
        ..add('storeidx')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.userid;
    if (value != null) {
      result
        ..add('userid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.category;
    if (value != null) {
      result
        ..add('category')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.manufacture;
    if (value != null) {
      result
        ..add('manufacture')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.model;
    if (value != null) {
      result
        ..add('model')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.brokenPart;
    if (value != null) {
      result
        ..add('broken_part')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.symptom;
    if (value != null) {
      result
        ..add('symptom')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.imgUrl;
    if (value != null) {
      result
        ..add('img_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.pickupDirect;
    if (value != null) {
      result
        ..add('pickup_direct')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.address;
    if (value != null) {
      result
        ..add('address')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.price;
    if (value != null) {
      result
        ..add('price')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.geopoint;
    if (value != null) {
      result
        ..add('geopoint')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(LatLng)));
    }
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.transactionid;
    if (value != null) {
      result
        ..add('transactionid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.repairmentid;
    if (value != null) {
      result
        ..add('repairmentid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.timestamp;
    if (value != null) {
      result
        ..add('timestamp')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.select;
    if (value != null) {
      result
        ..add('select')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.videoUrl;
    if (value != null) {
      result
        ..add('video_url')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.comment;
    if (value != null) {
      result
        ..add('comment')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.estDate;
    if (value != null) {
      result
        ..add('est_date')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.firsttransactionid;
    if (value != null) {
      result
        ..add('firsttransactionid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.reference;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    return result;
  }

  @override
  RepairmentRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RepairmentRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'storeidx':
          result.storeidx = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'userid':
          result.userid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'category':
          result.category = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'manufacture':
          result.manufacture = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'model':
          result.model = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'broken_part':
          result.brokenPart = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'symptom':
          result.symptom = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'img_url':
          result.imgUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'pickup_direct':
          result.pickupDirect = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'price':
          result.price = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'geopoint':
          result.geopoint = serializers.deserialize(value,
              specifiedType: const FullType(LatLng)) as LatLng;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'transactionid':
          result.transactionid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'repairmentid':
          result.repairmentid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'timestamp':
          result.timestamp = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'select':
          result.select = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'video_url':
          result.videoUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'comment':
          result.comment = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'est_date':
          result.estDate = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'firsttransactionid':
          result.firsttransactionid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'Document__Reference__Field':
          result.reference = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
      }
    }

    return result.build();
  }
}

class _$RepairmentRecord extends RepairmentRecord {
  @override
  final int storeidx;
  @override
  final String userid;
  @override
  final String category;
  @override
  final String manufacture;
  @override
  final String model;
  @override
  final String brokenPart;
  @override
  final String symptom;
  @override
  final String imgUrl;
  @override
  final bool pickupDirect;
  @override
  final String address;
  @override
  final int price;
  @override
  final LatLng geopoint;
  @override
  final int status;
  @override
  final String transactionid;
  @override
  final String repairmentid;
  @override
  final DateTime timestamp;
  @override
  final DateTime select;
  @override
  final String videoUrl;
  @override
  final String comment;
  @override
  final int estDate;
  @override
  final String firsttransactionid;
  @override
  final DocumentReference<Object> reference;

  factory _$RepairmentRecord(
          [void Function(RepairmentRecordBuilder) updates]) =>
      (new RepairmentRecordBuilder()..update(updates)).build();

  _$RepairmentRecord._(
      {this.storeidx,
      this.userid,
      this.category,
      this.manufacture,
      this.model,
      this.brokenPart,
      this.symptom,
      this.imgUrl,
      this.pickupDirect,
      this.address,
      this.price,
      this.geopoint,
      this.status,
      this.transactionid,
      this.repairmentid,
      this.timestamp,
      this.select,
      this.videoUrl,
      this.comment,
      this.estDate,
      this.firsttransactionid,
      this.reference})
      : super._();

  @override
  RepairmentRecord rebuild(void Function(RepairmentRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RepairmentRecordBuilder toBuilder() =>
      new RepairmentRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RepairmentRecord &&
        storeidx == other.storeidx &&
        userid == other.userid &&
        category == other.category &&
        manufacture == other.manufacture &&
        model == other.model &&
        brokenPart == other.brokenPart &&
        symptom == other.symptom &&
        imgUrl == other.imgUrl &&
        pickupDirect == other.pickupDirect &&
        address == other.address &&
        price == other.price &&
        geopoint == other.geopoint &&
        status == other.status &&
        transactionid == other.transactionid &&
        repairmentid == other.repairmentid &&
        timestamp == other.timestamp &&
        select == other.select &&
        videoUrl == other.videoUrl &&
        comment == other.comment &&
        estDate == other.estDate &&
        firsttransactionid == other.firsttransactionid &&
        reference == other.reference;
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
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            $jc($jc($jc($jc(0, storeidx.hashCode), userid.hashCode), category.hashCode),
                                                                                manufacture.hashCode),
                                                                            model.hashCode),
                                                                        brokenPart.hashCode),
                                                                    symptom.hashCode),
                                                                imgUrl.hashCode),
                                                            pickupDirect.hashCode),
                                                        address.hashCode),
                                                    price.hashCode),
                                                geopoint.hashCode),
                                            status.hashCode),
                                        transactionid.hashCode),
                                    repairmentid.hashCode),
                                timestamp.hashCode),
                            select.hashCode),
                        videoUrl.hashCode),
                    comment.hashCode),
                estDate.hashCode),
            firsttransactionid.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('RepairmentRecord')
          ..add('storeidx', storeidx)
          ..add('userid', userid)
          ..add('category', category)
          ..add('manufacture', manufacture)
          ..add('model', model)
          ..add('brokenPart', brokenPart)
          ..add('symptom', symptom)
          ..add('imgUrl', imgUrl)
          ..add('pickupDirect', pickupDirect)
          ..add('address', address)
          ..add('price', price)
          ..add('geopoint', geopoint)
          ..add('status', status)
          ..add('transactionid', transactionid)
          ..add('repairmentid', repairmentid)
          ..add('timestamp', timestamp)
          ..add('select', select)
          ..add('videoUrl', videoUrl)
          ..add('comment', comment)
          ..add('estDate', estDate)
          ..add('firsttransactionid', firsttransactionid)
          ..add('reference', reference))
        .toString();
  }
}

class RepairmentRecordBuilder
    implements Builder<RepairmentRecord, RepairmentRecordBuilder> {
  _$RepairmentRecord _$v;

  int _storeidx;
  int get storeidx => _$this._storeidx;
  set storeidx(int storeidx) => _$this._storeidx = storeidx;

  String _userid;
  String get userid => _$this._userid;
  set userid(String userid) => _$this._userid = userid;

  String _category;
  String get category => _$this._category;
  set category(String category) => _$this._category = category;

  String _manufacture;
  String get manufacture => _$this._manufacture;
  set manufacture(String manufacture) => _$this._manufacture = manufacture;

  String _model;
  String get model => _$this._model;
  set model(String model) => _$this._model = model;

  String _brokenPart;
  String get brokenPart => _$this._brokenPart;
  set brokenPart(String brokenPart) => _$this._brokenPart = brokenPart;

  String _symptom;
  String get symptom => _$this._symptom;
  set symptom(String symptom) => _$this._symptom = symptom;

  String _imgUrl;
  String get imgUrl => _$this._imgUrl;
  set imgUrl(String imgUrl) => _$this._imgUrl = imgUrl;

  bool _pickupDirect;
  bool get pickupDirect => _$this._pickupDirect;
  set pickupDirect(bool pickupDirect) => _$this._pickupDirect = pickupDirect;

  String _address;
  String get address => _$this._address;
  set address(String address) => _$this._address = address;

  int _price;
  int get price => _$this._price;
  set price(int price) => _$this._price = price;

  LatLng _geopoint;
  LatLng get geopoint => _$this._geopoint;
  set geopoint(LatLng geopoint) => _$this._geopoint = geopoint;

  int _status;
  int get status => _$this._status;
  set status(int status) => _$this._status = status;

  String _transactionid;
  String get transactionid => _$this._transactionid;
  set transactionid(String transactionid) =>
      _$this._transactionid = transactionid;

  String _repairmentid;
  String get repairmentid => _$this._repairmentid;
  set repairmentid(String repairmentid) => _$this._repairmentid = repairmentid;

  DateTime _timestamp;
  DateTime get timestamp => _$this._timestamp;
  set timestamp(DateTime timestamp) => _$this._timestamp = timestamp;

  DateTime _select;
  DateTime get select => _$this._select;
  set select(DateTime select) => _$this._select = select;

  String _videoUrl;
  String get videoUrl => _$this._videoUrl;
  set videoUrl(String videoUrl) => _$this._videoUrl = videoUrl;

  String _comment;
  String get comment => _$this._comment;
  set comment(String comment) => _$this._comment = comment;

  int _estDate;
  int get estDate => _$this._estDate;
  set estDate(int estDate) => _$this._estDate = estDate;

  String _firsttransactionid;
  String get firsttransactionid => _$this._firsttransactionid;
  set firsttransactionid(String firsttransactionid) =>
      _$this._firsttransactionid = firsttransactionid;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  RepairmentRecordBuilder() {
    RepairmentRecord._initializeBuilder(this);
  }

  RepairmentRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _storeidx = $v.storeidx;
      _userid = $v.userid;
      _category = $v.category;
      _manufacture = $v.manufacture;
      _model = $v.model;
      _brokenPart = $v.brokenPart;
      _symptom = $v.symptom;
      _imgUrl = $v.imgUrl;
      _pickupDirect = $v.pickupDirect;
      _address = $v.address;
      _price = $v.price;
      _geopoint = $v.geopoint;
      _status = $v.status;
      _transactionid = $v.transactionid;
      _repairmentid = $v.repairmentid;
      _timestamp = $v.timestamp;
      _select = $v.select;
      _videoUrl = $v.videoUrl;
      _comment = $v.comment;
      _estDate = $v.estDate;
      _firsttransactionid = $v.firsttransactionid;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RepairmentRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RepairmentRecord;
  }

  @override
  void update(void Function(RepairmentRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$RepairmentRecord build() {
    final _$result = _$v ??
        new _$RepairmentRecord._(
            storeidx: storeidx,
            userid: userid,
            category: category,
            manufacture: manufacture,
            model: model,
            brokenPart: brokenPart,
            symptom: symptom,
            imgUrl: imgUrl,
            pickupDirect: pickupDirect,
            address: address,
            price: price,
            geopoint: geopoint,
            status: status,
            transactionid: transactionid,
            repairmentid: repairmentid,
            timestamp: timestamp,
            select: select,
            videoUrl: videoUrl,
            comment: comment,
            estDate: estDate,
            firsttransactionid: firsttransactionid,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
