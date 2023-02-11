import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'bookings_record.g.dart';

abstract class BookingsRecord
    implements Built<BookingsRecord, BookingsRecordBuilder> {
  static Serializer<BookingsRecord> get serializer =>
      _$bookingsRecordSerializer;

  @BuiltValueField(wireName: 'event_id')
  String? get eventId;

  DateTime? get date;

  @BuiltValueField(wireName: 'start_time')
  DateTime? get startTime;

  @BuiltValueField(wireName: 'end_time')
  DateTime? get endTime;

  DocumentReference? get leader;

  DocumentReference? get listener;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(BookingsRecordBuilder builder) =>
      builder..eventId = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('bookings');

  static Stream<BookingsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<BookingsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  BookingsRecord._();
  factory BookingsRecord([void Function(BookingsRecordBuilder) updates]) =
      _$BookingsRecord;

  static BookingsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createBookingsRecordData({
  String? eventId,
  DateTime? date,
  DateTime? startTime,
  DateTime? endTime,
  DocumentReference? leader,
  DocumentReference? listener,
}) {
  final firestoreData = serializers.toFirestore(
    BookingsRecord.serializer,
    BookingsRecord(
      (b) => b
        ..eventId = eventId
        ..date = date
        ..startTime = startTime
        ..endTime = endTime
        ..leader = leader
        ..listener = listener,
    ),
  );

  return firestoreData;
}
