import 'dart:async';

import 'package:from_css_color/from_css_color.dart';

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

  bool? get available;

  DocumentReference? get leader;

  @BuiltValueField(wireName: 'start_time')
  String? get startTime;

  @BuiltValueField(wireName: 'end_time')
  String? get endTime;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(CalendarRecordBuilder builder) => builder
    ..eventId = ''
    ..available = false
    ..startTime = ''
    ..endTime = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('calendar');

  static Stream<CalendarRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<CalendarRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static CalendarRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      CalendarRecord(
        (c) => c
          ..eventId = snapshot.data['event_id']
          ..date = safeGet(
              () => DateTime.fromMillisecondsSinceEpoch(snapshot.data['date']))
          ..available = snapshot.data['available']
          ..leader = safeGet(() => toRef(snapshot.data['leader']))
          ..startTime = snapshot.data['start_time']
          ..endTime = snapshot.data['end_time']
          ..ffRef = CalendarRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<CalendarRecord>> search(
          {String? term,
          FutureOr<LatLng>? location,
          int? maxResults,
          double? searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'calendar',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

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
  bool? available,
  DocumentReference? leader,
  String? startTime,
  String? endTime,
}) {
  final firestoreData = serializers.toFirestore(
    CalendarRecord.serializer,
    CalendarRecord(
      (c) => c
        ..eventId = eventId
        ..date = date
        ..available = available
        ..leader = leader
        ..startTime = startTime
        ..endTime = endTime,
    ),
  );

  return firestoreData;
}
