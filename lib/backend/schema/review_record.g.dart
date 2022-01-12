// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ReviewRecord> _$reviewRecordSerializer =
    new _$ReviewRecordSerializer();

class _$ReviewRecordSerializer implements StructuredSerializer<ReviewRecord> {
  @override
  final Iterable<Type> types = const [ReviewRecord, _$ReviewRecord];
  @override
  final String wireName = 'ReviewRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, ReviewRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.storeidx;
    if (value != null) {
      result
        ..add('storeidx')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.uid;
    if (value != null) {
      result
        ..add('uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.photoUrl;
    if (value != null) {
      result
        ..add('photo_url')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.review;
    if (value != null) {
      result
        ..add('review')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.uName;
    if (value != null) {
      result
        ..add('u_name')
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
    value = object.rateAvg;
    if (value != null) {
      result
        ..add('rate_avg')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.reviewId;
    if (value != null) {
      result
        ..add('review_id')
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
    value = object.estimatedtime;
    if (value != null) {
      result
        ..add('estimatedtime')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.rate1;
    if (value != null) {
      result
        ..add('rate1')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.rate2;
    if (value != null) {
      result
        ..add('rate2')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.rate3;
    if (value != null) {
      result
        ..add('rate3')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
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
  ReviewRecord deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ReviewRecordBuilder();

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
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'photo_url':
          result.photoUrl.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'review':
          result.review = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'u_name':
          result.uName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'timestamp':
          result.timestamp = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'rate_avg':
          result.rateAvg = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'review_id':
          result.reviewId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'comment':
          result.comment = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'estimatedtime':
          result.estimatedtime = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'rate1':
          result.rate1 = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'rate2':
          result.rate2 = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'rate3':
          result.rate3 = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
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

class _$ReviewRecord extends ReviewRecord {
  @override
  final int storeidx;
  @override
  final String uid;
  @override
  final BuiltList<String> photoUrl;
  @override
  final String review;
  @override
  final String uName;
  @override
  final DateTime timestamp;
  @override
  final double rateAvg;
  @override
  final String reviewId;
  @override
  final String comment;
  @override
  final int estimatedtime;
  @override
  final double rate1;
  @override
  final double rate2;
  @override
  final double rate3;
  @override
  final DocumentReference<Object> reference;

  factory _$ReviewRecord([void Function(ReviewRecordBuilder) updates]) =>
      (new ReviewRecordBuilder()..update(updates)).build();

  _$ReviewRecord._(
      {this.storeidx,
      this.uid,
      this.photoUrl,
      this.review,
      this.uName,
      this.timestamp,
      this.rateAvg,
      this.reviewId,
      this.comment,
      this.estimatedtime,
      this.rate1,
      this.rate2,
      this.rate3,
      this.reference})
      : super._();

  @override
  ReviewRecord rebuild(void Function(ReviewRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReviewRecordBuilder toBuilder() => new ReviewRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReviewRecord &&
        storeidx == other.storeidx &&
        uid == other.uid &&
        photoUrl == other.photoUrl &&
        review == other.review &&
        uName == other.uName &&
        timestamp == other.timestamp &&
        rateAvg == other.rateAvg &&
        reviewId == other.reviewId &&
        comment == other.comment &&
        estimatedtime == other.estimatedtime &&
        rate1 == other.rate1 &&
        rate2 == other.rate2 &&
        rate3 == other.rate3 &&
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
                                                        $jc(0,
                                                            storeidx.hashCode),
                                                        uid.hashCode),
                                                    photoUrl.hashCode),
                                                review.hashCode),
                                            uName.hashCode),
                                        timestamp.hashCode),
                                    rateAvg.hashCode),
                                reviewId.hashCode),
                            comment.hashCode),
                        estimatedtime.hashCode),
                    rate1.hashCode),
                rate2.hashCode),
            rate3.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ReviewRecord')
          ..add('storeidx', storeidx)
          ..add('uid', uid)
          ..add('photoUrl', photoUrl)
          ..add('review', review)
          ..add('uName', uName)
          ..add('timestamp', timestamp)
          ..add('rateAvg', rateAvg)
          ..add('reviewId', reviewId)
          ..add('comment', comment)
          ..add('estimatedtime', estimatedtime)
          ..add('rate1', rate1)
          ..add('rate2', rate2)
          ..add('rate3', rate3)
          ..add('reference', reference))
        .toString();
  }
}

class ReviewRecordBuilder
    implements Builder<ReviewRecord, ReviewRecordBuilder> {
  _$ReviewRecord _$v;

  int _storeidx;
  int get storeidx => _$this._storeidx;
  set storeidx(int storeidx) => _$this._storeidx = storeidx;

  String _uid;
  String get uid => _$this._uid;
  set uid(String uid) => _$this._uid = uid;

  ListBuilder<String> _photoUrl;
  ListBuilder<String> get photoUrl =>
      _$this._photoUrl ??= new ListBuilder<String>();
  set photoUrl(ListBuilder<String> photoUrl) => _$this._photoUrl = photoUrl;

  String _review;
  String get review => _$this._review;
  set review(String review) => _$this._review = review;

  String _uName;
  String get uName => _$this._uName;
  set uName(String uName) => _$this._uName = uName;

  DateTime _timestamp;
  DateTime get timestamp => _$this._timestamp;
  set timestamp(DateTime timestamp) => _$this._timestamp = timestamp;

  double _rateAvg;
  double get rateAvg => _$this._rateAvg;
  set rateAvg(double rateAvg) => _$this._rateAvg = rateAvg;

  String _reviewId;
  String get reviewId => _$this._reviewId;
  set reviewId(String reviewId) => _$this._reviewId = reviewId;

  String _comment;
  String get comment => _$this._comment;
  set comment(String comment) => _$this._comment = comment;

  int _estimatedtime;
  int get estimatedtime => _$this._estimatedtime;
  set estimatedtime(int estimatedtime) => _$this._estimatedtime = estimatedtime;

  double _rate1;
  double get rate1 => _$this._rate1;
  set rate1(double rate1) => _$this._rate1 = rate1;

  double _rate2;
  double get rate2 => _$this._rate2;
  set rate2(double rate2) => _$this._rate2 = rate2;

  double _rate3;
  double get rate3 => _$this._rate3;
  set rate3(double rate3) => _$this._rate3 = rate3;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  ReviewRecordBuilder() {
    ReviewRecord._initializeBuilder(this);
  }

  ReviewRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _storeidx = $v.storeidx;
      _uid = $v.uid;
      _photoUrl = $v.photoUrl?.toBuilder();
      _review = $v.review;
      _uName = $v.uName;
      _timestamp = $v.timestamp;
      _rateAvg = $v.rateAvg;
      _reviewId = $v.reviewId;
      _comment = $v.comment;
      _estimatedtime = $v.estimatedtime;
      _rate1 = $v.rate1;
      _rate2 = $v.rate2;
      _rate3 = $v.rate3;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ReviewRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ReviewRecord;
  }

  @override
  void update(void Function(ReviewRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ReviewRecord build() {
    _$ReviewRecord _$result;
    try {
      _$result = _$v ??
          new _$ReviewRecord._(
              storeidx: storeidx,
              uid: uid,
              photoUrl: _photoUrl?.build(),
              review: review,
              uName: uName,
              timestamp: timestamp,
              rateAvg: rateAvg,
              reviewId: reviewId,
              comment: comment,
              estimatedtime: estimatedtime,
              rate1: rate1,
              rate2: rate2,
              rate3: rate3,
              reference: reference);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'photoUrl';
        _photoUrl?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ReviewRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
