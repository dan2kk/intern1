// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repairstore_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<RepairstoreRecord> _$repairstoreRecordSerializer =
    new _$RepairstoreRecordSerializer();

class _$RepairstoreRecordSerializer
    implements StructuredSerializer<RepairstoreRecord> {
  @override
  final Iterable<Type> types = const [RepairstoreRecord, _$RepairstoreRecord];
  @override
  final String wireName = 'RepairstoreRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, RepairstoreRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.phoneNum;
    if (value != null) {
      result
        ..add('phone_num')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.address;
    if (value != null) {
      result
        ..add('address')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.imgUrl;
    if (value != null) {
      result
        ..add('img_url')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.rate;
    if (value != null) {
      result
        ..add('rate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.imgUrl1;
    if (value != null) {
      result
        ..add('img_url1')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.breif;
    if (value != null) {
      result
        ..add('breif')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.idx;
    if (value != null) {
      result
        ..add('idx')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.coordinate;
    if (value != null) {
      result
        ..add('coordinate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(LatLng)));
    }
    value = object.category;
    if (value != null) {
      result
        ..add('category')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.rateNum;
    if (value != null) {
      result
        ..add('rate_num')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.explain;
    if (value != null) {
      result
        ..add('explain')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.storeidx;
    if (value != null) {
      result
        ..add('storeidx')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.hashtag;
    if (value != null) {
      result
        ..add('hashtag')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
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
  RepairstoreRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RepairstoreRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'phone_num':
          result.phoneNum = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'img_url':
          result.imgUrl.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'rate':
          result.rate = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'img_url1':
          result.imgUrl1 = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'breif':
          result.breif = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'idx':
          result.idx = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'coordinate':
          result.coordinate = serializers.deserialize(value,
              specifiedType: const FullType(LatLng)) as LatLng;
          break;
        case 'category':
          result.category = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'rate_num':
          result.rateNum = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'explain':
          result.explain = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'storeidx':
          result.storeidx = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'hashtag':
          result.hashtag.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
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

class _$RepairstoreRecord extends RepairstoreRecord {
  @override
  final String name;
  @override
  final String phoneNum;
  @override
  final String address;
  @override
  final BuiltList<String> imgUrl;
  @override
  final double rate;
  @override
  final String imgUrl1;
  @override
  final String breif;
  @override
  final int idx;
  @override
  final LatLng coordinate;
  @override
  final String category;
  @override
  final int rateNum;
  @override
  final String explain;
  @override
  final int storeidx;
  @override
  final BuiltList<String> hashtag;
  @override
  final DocumentReference<Object> reference;

  factory _$RepairstoreRecord(
          [void Function(RepairstoreRecordBuilder) updates]) =>
      (new RepairstoreRecordBuilder()..update(updates)).build();

  _$RepairstoreRecord._(
      {this.name,
      this.phoneNum,
      this.address,
      this.imgUrl,
      this.rate,
      this.imgUrl1,
      this.breif,
      this.idx,
      this.coordinate,
      this.category,
      this.rateNum,
      this.explain,
      this.storeidx,
      this.hashtag,
      this.reference})
      : super._();

  @override
  RepairstoreRecord rebuild(void Function(RepairstoreRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RepairstoreRecordBuilder toBuilder() =>
      new RepairstoreRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RepairstoreRecord &&
        name == other.name &&
        phoneNum == other.phoneNum &&
        address == other.address &&
        imgUrl == other.imgUrl &&
        rate == other.rate &&
        imgUrl1 == other.imgUrl1 &&
        breif == other.breif &&
        idx == other.idx &&
        coordinate == other.coordinate &&
        category == other.category &&
        rateNum == other.rateNum &&
        explain == other.explain &&
        storeidx == other.storeidx &&
        hashtag == other.hashtag &&
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
                                                            $jc(0,
                                                                name.hashCode),
                                                            phoneNum.hashCode),
                                                        address.hashCode),
                                                    imgUrl.hashCode),
                                                rate.hashCode),
                                            imgUrl1.hashCode),
                                        breif.hashCode),
                                    idx.hashCode),
                                coordinate.hashCode),
                            category.hashCode),
                        rateNum.hashCode),
                    explain.hashCode),
                storeidx.hashCode),
            hashtag.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('RepairstoreRecord')
          ..add('name', name)
          ..add('phoneNum', phoneNum)
          ..add('address', address)
          ..add('imgUrl', imgUrl)
          ..add('rate', rate)
          ..add('imgUrl1', imgUrl1)
          ..add('breif', breif)
          ..add('idx', idx)
          ..add('coordinate', coordinate)
          ..add('category', category)
          ..add('rateNum', rateNum)
          ..add('explain', explain)
          ..add('storeidx', storeidx)
          ..add('hashtag', hashtag)
          ..add('reference', reference))
        .toString();
  }
}

class RepairstoreRecordBuilder
    implements Builder<RepairstoreRecord, RepairstoreRecordBuilder> {
  _$RepairstoreRecord _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _phoneNum;
  String get phoneNum => _$this._phoneNum;
  set phoneNum(String phoneNum) => _$this._phoneNum = phoneNum;

  String _address;
  String get address => _$this._address;
  set address(String address) => _$this._address = address;

  ListBuilder<String> _imgUrl;
  ListBuilder<String> get imgUrl =>
      _$this._imgUrl ??= new ListBuilder<String>();
  set imgUrl(ListBuilder<String> imgUrl) => _$this._imgUrl = imgUrl;

  double _rate;
  double get rate => _$this._rate;
  set rate(double rate) => _$this._rate = rate;

  String _imgUrl1;
  String get imgUrl1 => _$this._imgUrl1;
  set imgUrl1(String imgUrl1) => _$this._imgUrl1 = imgUrl1;

  String _breif;
  String get breif => _$this._breif;
  set breif(String breif) => _$this._breif = breif;

  int _idx;
  int get idx => _$this._idx;
  set idx(int idx) => _$this._idx = idx;

  LatLng _coordinate;
  LatLng get coordinate => _$this._coordinate;
  set coordinate(LatLng coordinate) => _$this._coordinate = coordinate;

  String _category;
  String get category => _$this._category;
  set category(String category) => _$this._category = category;

  int _rateNum;
  int get rateNum => _$this._rateNum;
  set rateNum(int rateNum) => _$this._rateNum = rateNum;

  String _explain;
  String get explain => _$this._explain;
  set explain(String explain) => _$this._explain = explain;

  int _storeidx;
  int get storeidx => _$this._storeidx;
  set storeidx(int storeidx) => _$this._storeidx = storeidx;

  ListBuilder<String> _hashtag;
  ListBuilder<String> get hashtag =>
      _$this._hashtag ??= new ListBuilder<String>();
  set hashtag(ListBuilder<String> hashtag) => _$this._hashtag = hashtag;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  RepairstoreRecordBuilder() {
    RepairstoreRecord._initializeBuilder(this);
  }

  RepairstoreRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _phoneNum = $v.phoneNum;
      _address = $v.address;
      _imgUrl = $v.imgUrl?.toBuilder();
      _rate = $v.rate;
      _imgUrl1 = $v.imgUrl1;
      _breif = $v.breif;
      _idx = $v.idx;
      _coordinate = $v.coordinate;
      _category = $v.category;
      _rateNum = $v.rateNum;
      _explain = $v.explain;
      _storeidx = $v.storeidx;
      _hashtag = $v.hashtag?.toBuilder();
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RepairstoreRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RepairstoreRecord;
  }

  @override
  void update(void Function(RepairstoreRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$RepairstoreRecord build() {
    _$RepairstoreRecord _$result;
    try {
      _$result = _$v ??
          new _$RepairstoreRecord._(
              name: name,
              phoneNum: phoneNum,
              address: address,
              imgUrl: _imgUrl?.build(),
              rate: rate,
              imgUrl1: imgUrl1,
              breif: breif,
              idx: idx,
              coordinate: coordinate,
              category: category,
              rateNum: rateNum,
              explain: explain,
              storeidx: storeidx,
              hashtag: _hashtag?.build(),
              reference: reference);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'imgUrl';
        _imgUrl?.build();

        _$failedField = 'hashtag';
        _hashtag?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'RepairstoreRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
