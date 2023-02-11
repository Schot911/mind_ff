import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'listeners_record.g.dart';

abstract class ListenersRecord
    implements Built<ListenersRecord, ListenersRecordBuilder> {
  static Serializer<ListenersRecord> get serializer =>
      _$listenersRecordSerializer;

  String? get email;

  String? get uid;

  @BuiltValueField(wireName: 'created_time')
  DateTime? get createdTime;

  @BuiltValueField(wireName: 'phone_number')
  String? get phoneNumber;

  BuiltList<DocumentReference>? get calendar;

  BuiltList<DocumentReference>? get bookings;

  String? get name;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ListenersRecordBuilder builder) => builder
    ..email = ''
    ..uid = ''
    ..phoneNumber = ''
    ..calendar = ListBuilder()
    ..bookings = ListBuilder()
    ..name = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('listeners');

  static Stream<ListenersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ListenersRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ListenersRecord._();
  factory ListenersRecord([void Function(ListenersRecordBuilder) updates]) =
      _$ListenersRecord;

  static ListenersRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createListenersRecordData({
  String? email,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? name,
}) {
  final firestoreData = serializers.toFirestore(
    ListenersRecord.serializer,
    ListenersRecord(
      (l) => l
        ..email = email
        ..uid = uid
        ..createdTime = createdTime
        ..phoneNumber = phoneNumber
        ..calendar = null
        ..bookings = null
        ..name = name,
    ),
  );

  return firestoreData;
}
