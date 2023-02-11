import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'calendar_record.g.dart';

abstract class CalendarRecord
    implements Built<CalendarRecord, CalendarRecordBuilder> {
  static Serializer<CalendarRecord> get serializer =>
      _$calendarRecordSerializer;

  @BuiltValueField(wireName: 'event_id')
  String? get eventId;

  DateTime? get date;

  @BuiltValueField(wireName: 'start_time')
  DateTime? get startTime;

  @BuiltValueField(wireName: 'end_time')
  DateTime? get endTime;

  bool? get available;

  DocumentReference? get leader;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(CalendarRecordBuilder builder) => builder
    ..eventId = ''
    ..available = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('calendar');

  static Stream<CalendarRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<CalendarRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  CalendarRecord._();
  factory CalendarRecord([void Function(CalendarRecordBuilder) updates]) =
      _$CalendarRecord;

  static CalendarRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createCalendarRecordData({
  String? eventId,
  DateTime? date,
  DateTime? startTime,
  DateTime? endTime,
  bool? available,
  DocumentReference? leader,
}) {
  final firestoreData = serializers.toFirestore(
    CalendarRecord.serializer,
    CalendarRecord(
      (c) => c
        ..eventId = eventId
        ..date = date
        ..startTime = startTime
        ..endTime = endTime
        ..available = available
        ..leader = leader,
    ),
  );

  return firestoreData;
}
