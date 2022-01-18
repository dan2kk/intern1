// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coupon_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CouponRecord> _$couponRecordSerializer =
    new _$CouponRecordSerializer();

class _$CouponRecordSerializer implements StructuredSerializer<CouponRecord> {
  @override
  final Iterable<Type> types = const [CouponRecord, _$CouponRecord];
  @override
  final String wireName = 'CouponRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, CouponRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.amount;
    if (value != null) {
      result
        ..add('amount')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.maxamount;
    if (value != null) {
      result
        ..add('maxamount')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.expireDate;
    if (value != null) {
      result
        ..add('expire_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.earnedDate;
    if (value != null) {
      result
        ..add('earned_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.couponNum;
    if (value != null) {
      result
        ..add('coupon_num')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.explain;
    if (value != null) {
      result
        ..add('explain')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.used;
    if (value != null) {
      result
        ..add('used')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.uid;
    if (value != null) {
      result
        ..add('uid')
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
  CouponRecord deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CouponRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'amount':
          result.amount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'maxamount':
          result.maxamount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'expire_date':
          result.expireDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'earned_date':
          result.earnedDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'coupon_num':
          result.couponNum = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'explain':
          result.explain = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'used':
          result.used = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'breif':
          result.breif = serializers.deserialize(value,
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

class _$CouponRecord extends CouponRecord {
  @override
  final int amount;
  @override
  final int maxamount;
  @override
  final DateTime expireDate;
  @override
  final DateTime earnedDate;
  @override
  final String couponNum;
  @override
  final String explain;
  @override
  final bool used;
  @override
  final String uid;
  @override
  final String breif;
  @override
  final DocumentReference<Object> reference;

  factory _$CouponRecord([void Function(CouponRecordBuilder) updates]) =>
      (new CouponRecordBuilder()..update(updates)).build();

  _$CouponRecord._(
      {this.amount,
      this.maxamount,
      this.expireDate,
      this.earnedDate,
      this.couponNum,
      this.explain,
      this.used,
      this.uid,
      this.breif,
      this.reference})
      : super._();

  @override
  CouponRecord rebuild(void Function(CouponRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CouponRecordBuilder toBuilder() => new CouponRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CouponRecord &&
        amount == other.amount &&
        maxamount == other.maxamount &&
        expireDate == other.expireDate &&
        earnedDate == other.earnedDate &&
        couponNum == other.couponNum &&
        explain == other.explain &&
        used == other.used &&
        uid == other.uid &&
        breif == other.breif &&
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
                                    $jc($jc(0, amount.hashCode),
                                        maxamount.hashCode),
                                    expireDate.hashCode),
                                earnedDate.hashCode),
                            couponNum.hashCode),
                        explain.hashCode),
                    used.hashCode),
                uid.hashCode),
            breif.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CouponRecord')
          ..add('amount', amount)
          ..add('maxamount', maxamount)
          ..add('expireDate', expireDate)
          ..add('earnedDate', earnedDate)
          ..add('couponNum', couponNum)
          ..add('explain', explain)
          ..add('used', used)
          ..add('uid', uid)
          ..add('breif', breif)
          ..add('reference', reference))
        .toString();
  }
}

class CouponRecordBuilder
    implements Builder<CouponRecord, CouponRecordBuilder> {
  _$CouponRecord _$v;

  int _amount;
  int get amount => _$this._amount;
  set amount(int amount) => _$this._amount = amount;

  int _maxamount;
  int get maxamount => _$this._maxamount;
  set maxamount(int maxamount) => _$this._maxamount = maxamount;

  DateTime _expireDate;
  DateTime get expireDate => _$this._expireDate;
  set expireDate(DateTime expireDate) => _$this._expireDate = expireDate;

  DateTime _earnedDate;
  DateTime get earnedDate => _$this._earnedDate;
  set earnedDate(DateTime earnedDate) => _$this._earnedDate = earnedDate;

  String _couponNum;
  String get couponNum => _$this._couponNum;
  set couponNum(String couponNum) => _$this._couponNum = couponNum;

  String _explain;
  String get explain => _$this._explain;
  set explain(String explain) => _$this._explain = explain;

  bool _used;
  bool get used => _$this._used;
  set used(bool used) => _$this._used = used;

  String _uid;
  String get uid => _$this._uid;
  set uid(String uid) => _$this._uid = uid;

  String _breif;
  String get breif => _$this._breif;
  set breif(String breif) => _$this._breif = breif;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  CouponRecordBuilder() {
    CouponRecord._initializeBuilder(this);
  }

  CouponRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _amount = $v.amount;
      _maxamount = $v.maxamount;
      _expireDate = $v.expireDate;
      _earnedDate = $v.earnedDate;
      _couponNum = $v.couponNum;
      _explain = $v.explain;
      _used = $v.used;
      _uid = $v.uid;
      _breif = $v.breif;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CouponRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CouponRecord;
  }

  @override
  void update(void Function(CouponRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CouponRecord build() {
    final _$result = _$v ??
        new _$CouponRecord._(
            amount: amount,
            maxamount: maxamount,
            expireDate: expireDate,
            earnedDate: earnedDate,
            couponNum: couponNum,
            explain: explain,
            used: used,
            uid: uid,
            breif: breif,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
