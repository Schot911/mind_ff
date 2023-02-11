// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CalendarRecord> _$calendarRecordSerializer =
    new _$CalendarRecordSerializer();

class _$CalendarRecordSerializer
    implements StructuredSerializer<CalendarRecord> {
  @override
  final Iterable<Type> types = const [CalendarRecord, _$CalendarRecord];
  @override
  final String wireName = 'CalendarRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, CalendarRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.eventId;
    if (value != null) {
      result
        ..add('event_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.date;
    if (value != null) {
      result
        ..add('date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.startTime;
    if (value != null) {
      result
        ..add('start_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.endTime;
    if (value != null) {
      result
        ..add('end_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.available;
    if (value != null) {
      result
        ..add('available')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.leader;
    if (value != null) {
      result
        ..add('leader')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
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
  CalendarRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CalendarRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'event_id':
          result.eventId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'start_time':
          result.startTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'end_time':
          result.endTime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'available':
          result.available = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'leader':
          result.leader = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
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

class _$CalendarRecord extends CalendarRecord {
  @override
  final String? eventId;
  @override
  final DateTime? date;
  @override
  final DateTime? startTime;
  @override
  final DateTime? endTime;
  @override
  final bool? available;
  @override
  final DocumentReference<Object?>? leader;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$CalendarRecord([void Function(CalendarRecordBuilder)? updates]) =>
      (new CalendarRecordBuilder()..update(updates))._build();

  _$CalendarRecord._(
      {this.eventId,
      this.date,
      this.startTime,
      this.endTime,
      this.available,
      this.leader,
      this.ffRef})
      : super._();

  @override
  CalendarRecord rebuild(void Function(CalendarRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CalendarRecordBuilder toBuilder() =>
      new CalendarRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CalendarRecord &&
        eventId == other.eventId &&
        date == other.date &&
        startTime == other.startTime &&
        endTime == other.endTime &&
        available == other.available &&
        leader == other.leader &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, eventId.hashCode), date.hashCode),
                        startTime.hashCode),
                    endTime.hashCode),
                available.hashCode),
            leader.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CalendarRecord')
          ..add('eventId', eventId)
          ..add('date', date)
          ..add('startTime', startTime)
          ..add('endTime', endTime)
          ..add('available', available)
          ..add('leader', leader)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class CalendarRecordBuilder
    implements Builder<CalendarRecord, CalendarRecordBuilder> {
  _$CalendarRecord? _$v;

  String? _eventId;
  String? get eventId => _$this._eventId;
  set eventId(String? eventId) => _$this._eventId = eventId;

  DateTime? _date;
  DateTime? get date => _$this._date;
  set date(DateTime? date) => _$this._date = date;

  DateTime? _startTime;
  DateTime? get startTime => _$this._startTime;
  set startTime(DateTime? startTime) => _$this._startTime = startTime;

  DateTime? _endTime;
  DateTime? get endTime => _$this._endTime;
  set endTime(DateTime? endTime) => _$this._endTime = endTime;

  bool? _available;
  bool? get available => _$this._available;
  set available(bool? available) => _$this._available = available;

  DocumentReference<Object?>? _leader;
  DocumentReference<Object?>? get leader => _$this._leader;
  set leader(DocumentReference<Object?>? leader) => _$this._leader = leader;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  CalendarRecordBuilder() {
    CalendarRecord._initializeBuilder(this);
  }

  CalendarRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _eventId = $v.eventId;
      _date = $v.date;
      _startTime = $v.startTime;
      _endTime = $v.endTime;
      _available = $v.available;
      _leader = $v.leader;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CalendarRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CalendarRecord;
  }

  @override
  void update(void Function(CalendarRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CalendarRecord build() => _build();

  _$CalendarRecord _build() {
    final _$result = _$v ??
        new _$CalendarRecord._(
            eventId: eventId,
            date: date,
            startTime: startTime,
            endTime: endTime,
            available: available,
            leader: leader,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
