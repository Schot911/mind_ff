// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leaders_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<LeadersRecord> _$leadersRecordSerializer =
    new _$LeadersRecordSerializer();

class _$LeadersRecordSerializer implements StructuredSerializer<LeadersRecord> {
  @override
  final Iterable<Type> types = const [LeadersRecord, _$LeadersRecord];
  @override
  final String wireName = 'LeadersRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, LeadersRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.uid;
    if (value != null) {
      result
        ..add('uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdTime;
    if (value != null) {
      result
        ..add('created_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.phoneNumber;
    if (value != null) {
      result
        ..add('phone_number')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.leaderIsFalse;
    if (value != null) {
      result
        ..add('leader_isFalse')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.calendar;
    if (value != null) {
      result
        ..add('calendar')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.bookings;
    if (value != null) {
      result
        ..add('bookings')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  LeadersRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LeadersRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'created_time':
          result.createdTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'phone_number':
          result.phoneNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'leader_isFalse':
          result.leaderIsFalse = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'calendar':
          result.calendar.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'bookings':
          result.bookings.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$LeadersRecord extends LeadersRecord {
  @override
  final String? email;
  @override
  final String? uid;
  @override
  final DateTime? createdTime;
  @override
  final String? phoneNumber;
  @override
  final bool? leaderIsFalse;
  @override
  final BuiltList<DocumentReference<Object?>>? calendar;
  @override
  final BuiltList<DocumentReference<Object?>>? bookings;
  @override
  final String? name;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$LeadersRecord([void Function(LeadersRecordBuilder)? updates]) =>
      (new LeadersRecordBuilder()..update(updates))._build();

  _$LeadersRecord._(
      {this.email,
      this.uid,
      this.createdTime,
      this.phoneNumber,
      this.leaderIsFalse,
      this.calendar,
      this.bookings,
      this.name,
      this.ffRef})
      : super._();

  @override
  LeadersRecord rebuild(void Function(LeadersRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LeadersRecordBuilder toBuilder() => new LeadersRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LeadersRecord &&
        email == other.email &&
        uid == other.uid &&
        createdTime == other.createdTime &&
        phoneNumber == other.phoneNumber &&
        leaderIsFalse == other.leaderIsFalse &&
        calendar == other.calendar &&
        bookings == other.bookings &&
        name == other.name &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc($jc(0, email.hashCode), uid.hashCode),
                                createdTime.hashCode),
                            phoneNumber.hashCode),
                        leaderIsFalse.hashCode),
                    calendar.hashCode),
                bookings.hashCode),
            name.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'LeadersRecord')
          ..add('email', email)
          ..add('uid', uid)
          ..add('createdTime', createdTime)
          ..add('phoneNumber', phoneNumber)
          ..add('leaderIsFalse', leaderIsFalse)
          ..add('calendar', calendar)
          ..add('bookings', bookings)
          ..add('name', name)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class LeadersRecordBuilder
    implements Builder<LeadersRecord, LeadersRecordBuilder> {
  _$LeadersRecord? _$v;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _uid;
  String? get uid => _$this._uid;
  set uid(String? uid) => _$this._uid = uid;

  DateTime? _createdTime;
  DateTime? get createdTime => _$this._createdTime;
  set createdTime(DateTime? createdTime) => _$this._createdTime = createdTime;

  String? _phoneNumber;
  String? get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String? phoneNumber) => _$this._phoneNumber = phoneNumber;

  bool? _leaderIsFalse;
  bool? get leaderIsFalse => _$this._leaderIsFalse;
  set leaderIsFalse(bool? leaderIsFalse) =>
      _$this._leaderIsFalse = leaderIsFalse;

  ListBuilder<DocumentReference<Object?>>? _calendar;
  ListBuilder<DocumentReference<Object?>> get calendar =>
      _$this._calendar ??= new ListBuilder<DocumentReference<Object?>>();
  set calendar(ListBuilder<DocumentReference<Object?>>? calendar) =>
      _$this._calendar = calendar;

  ListBuilder<DocumentReference<Object?>>? _bookings;
  ListBuilder<DocumentReference<Object?>> get bookings =>
      _$this._bookings ??= new ListBuilder<DocumentReference<Object?>>();
  set bookings(ListBuilder<DocumentReference<Object?>>? bookings) =>
      _$this._bookings = bookings;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  LeadersRecordBuilder() {
    LeadersRecord._initializeBuilder(this);
  }

  LeadersRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _email = $v.email;
      _uid = $v.uid;
      _createdTime = $v.createdTime;
      _phoneNumber = $v.phoneNumber;
      _leaderIsFalse = $v.leaderIsFalse;
      _calendar = $v.calendar?.toBuilder();
      _bookings = $v.bookings?.toBuilder();
      _name = $v.name;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LeadersRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LeadersRecord;
  }

  @override
  void update(void Function(LeadersRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  LeadersRecord build() => _build();

  _$LeadersRecord _build() {
    _$LeadersRecord _$result;
    try {
      _$result = _$v ??
          new _$LeadersRecord._(
              email: email,
              uid: uid,
              createdTime: createdTime,
              phoneNumber: phoneNumber,
              leaderIsFalse: leaderIsFalse,
              calendar: _calendar?.build(),
              bookings: _bookings?.build(),
              name: name,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'calendar';
        _calendar?.build();
        _$failedField = 'bookings';
        _bookings?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'LeadersRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
