import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'leaders_record.g.dart';

abstract class LeadersRecord
    implements Built<LeadersRecord, LeadersRecordBuilder> {
  static Serializer<LeadersRecord> get serializer => _$leadersRecordSerializer;

  String? get email;

  String? get uid;

  @BuiltValueField(wireName: 'created_time')
  DateTime? get createdTime;

  @BuiltValueField(wireName: 'phone_number')
  String? get phoneNumber;

  @BuiltValueField(wireName: 'leader_isFalse')
  bool? get leaderIsFalse;

  BuiltList<DocumentReference>? get calendar;

  BuiltList<DocumentReference>? get bookings;

  String? get name;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(LeadersRecordBuilder builder) => builder
    ..email = ''
    ..uid = ''
    ..phoneNumber = ''
    ..leaderIsFalse = false
    ..calendar = ListBuilder()
    ..bookings = ListBuilder()
    ..name = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('leaders');

  static Stream<LeadersRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<LeadersRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  LeadersRecord._();
  factory LeadersRecord([void Function(LeadersRecordBuilder) updates]) =
      _$LeadersRecord;

  static LeadersRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createLeadersRecordData({
  String? email,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  bool? leaderIsFalse,
  String? name,
}) {
  final firestoreData = serializers.toFirestore(
    LeadersRecord.serializer,
    LeadersRecord(
      (l) => l
        ..email = email
        ..uid = uid
        ..createdTime = createdTime
        ..phoneNumber = phoneNumber
        ..leaderIsFalse = leaderIsFalse
        ..calendar = null
        ..bookings = null
        ..name = name,
    ),
  );

  return firestoreData;
}
