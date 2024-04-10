import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class VolunteerRecord extends FirestoreRecord {
  VolunteerRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "hoursContributed" field.
  String? _hoursContributed;
  String get hoursContributed => _hoursContributed ?? '';
  bool hasHoursContributed() => _hoursContributed != null;

  // "otherInfo" field.
  String? _otherInfo;
  String get otherInfo => _otherInfo ?? '';
  bool hasOtherInfo() => _otherInfo != null;

  // "owner" field.
  String? _owner;
  String get owner => _owner ?? '';
  bool hasOwner() => _owner != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _hoursContributed = snapshotData['hoursContributed'] as String?;
    _otherInfo = snapshotData['otherInfo'] as String?;
    _owner = snapshotData['owner'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('volunteer');

  static Stream<VolunteerRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => VolunteerRecord.fromSnapshot(s));

  static Future<VolunteerRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => VolunteerRecord.fromSnapshot(s));

  static VolunteerRecord fromSnapshot(DocumentSnapshot snapshot) =>
      VolunteerRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static VolunteerRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      VolunteerRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'VolunteerRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is VolunteerRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createVolunteerRecordData({
  String? title,
  String? hoursContributed,
  String? otherInfo,
  String? owner,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'hoursContributed': hoursContributed,
      'otherInfo': otherInfo,
      'owner': owner,
    }.withoutNulls,
  );

  return firestoreData;
}

class VolunteerRecordDocumentEquality implements Equality<VolunteerRecord> {
  const VolunteerRecordDocumentEquality();

  @override
  bool equals(VolunteerRecord? e1, VolunteerRecord? e2) {
    return e1?.title == e2?.title &&
        e1?.hoursContributed == e2?.hoursContributed &&
        e1?.otherInfo == e2?.otherInfo &&
        e1?.owner == e2?.owner;
  }

  @override
  int hash(VolunteerRecord? e) => const ListEquality()
      .hash([e?.title, e?.hoursContributed, e?.otherInfo, e?.owner]);

  @override
  bool isValidKey(Object? o) => o is VolunteerRecord;
}
