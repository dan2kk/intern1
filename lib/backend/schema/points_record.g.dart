// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'points_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PointsRecord> _$pointsRecordSerializer =
    new _$PointsRecordSerializer();

class _$PointsRecordSerializer implements StructuredSerializer<PointsRecord> {
  @override
  final Iterable<Type> types = const [PointsRecord, _$PointsRecord];
  @override
  final String wireName = 'PointsRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, PointsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.amount;
    if (value != null) {
      result
        ..add('amount')
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
    value = object.reason;
    if (value != null) {
      result
        ..add('reason')
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
  PointsRecord deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PointsRecordBuilder();

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
        case 'expire_date':
          result.expireDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'earned_date':
          result.earnedDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'reason':
          result.reason = serializers.deserialize(value,
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

class _$PointsRecord extends PointsRecord {
  @override
  final int amount;
  @override
  final DateTime expireDate;
  @override
  final DateTime earnedDate;
  @override
  final String reason;
  @override
  final DocumentReference<Object> reference;

  factory _$PointsRecord([void Function(PointsRecordBuilder) updates]) =>
      (new PointsRecordBuilder()..update(updates)).build();

  _$PointsRecord._(
      {this.amount,
      this.expireDate,
      this.earnedDate,
      this.reason,
      this.reference})
      : super._();

  @override
  PointsRecord rebuild(void Function(PointsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PointsRecordBuilder toBuilder() => new PointsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PointsRecord &&
        amount == other.amount &&
        expireDate == other.expireDate &&
        earnedDate == other.earnedDate &&
        reason == other.reason &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, amount.hashCode), expireDate.hashCode),
                earnedDate.hashCode),
            reason.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PointsRecord')
          ..add('amount', amount)
          ..add('expireDate', expireDate)
          ..add('earnedDate', earnedDate)
          ..add('reason', reason)
          ..add('reference', reference))
        .toString();
  }
}

class PointsRecordBuilder
    implements Builder<PointsRecord, PointsRecordBuilder> {
  _$PointsRecord _$v;

  int _amount;
  int get amount => _$this._amount;
  set amount(int amount) => _$this._amount = amount;

  DateTime _expireDate;
  DateTime get expireDate => _$this._expireDate;
  set expireDate(DateTime expireDate) => _$this._expireDate = expireDate;

  DateTime _earnedDate;
  DateTime get earnedDate => _$this._earnedDate;
  set earnedDate(DateTime earnedDate) => _$this._earnedDate = earnedDate;

  String _reason;
  String get reason => _$this._reason;
  set reason(String reason) => _$this._reason = reason;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  PointsRecordBuilder() {
    PointsRecord._initializeBuilder(this);
  }

  PointsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _amount = $v.amount;
      _expireDate = $v.expireDate;
      _earnedDate = $v.earnedDate;
      _reason = $v.reason;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PointsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PointsRecord;
  }

  @override
  void update(void Function(PointsRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PointsRecord build() {
    final _$result = _$v ??
        new _$PointsRecord._(
            amount: amount,
            expireDate: expireDate,
            earnedDate: earnedDate,
            reason: reason,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
