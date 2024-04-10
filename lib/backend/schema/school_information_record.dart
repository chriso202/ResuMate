import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class SchoolInformationRecord extends FirestoreRecord {
  SchoolInformationRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "GPA" field.
  String? _gpa;
  String get gpa => _gpa ?? '';
  bool hasGpa() => _gpa != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "state" field.
  String? _state;
  String get state => _state ?? '';
  bool hasState() => _state != null;

  // "otherInfo" field.
  String? _otherInfo;
  String get otherInfo => _otherInfo ?? '';
  bool hasOtherInfo() => _otherInfo != null;

  // "owner" field.
  String? _owner;
  String get owner => _owner ?? '';
  bool hasOwner() => _owner != null;

  void _initializeFields() {
    _gpa = snapshotData['GPA'] as String?;
    _name = snapshotData['name'] as String?;
    _city = snapshotData['city'] as String?;
    _state = snapshotData['state'] as String?;
    _otherInfo = snapshotData['otherInfo'] as String?;
    _owner = snapshotData['owner'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('schoolInformation');

  static Stream<SchoolInformationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SchoolInformationRecord.fromSnapshot(s));

  static Future<SchoolInformationRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => SchoolInformationRecord.fromSnapshot(s));

  static SchoolInformationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SchoolInformationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SchoolInformationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SchoolInformationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SchoolInformationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SchoolInformationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSchoolInformationRecordData({
  String? gpa,
  String? name,
  String? city,
  String? state,
  String? otherInfo,
  String? owner,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'GPA': gpa,
      'name': name,
      'city': city,
      'state': state,
      'otherInfo': otherInfo,
      'owner': owner,
    }.withoutNulls,
  );

  return firestoreData;
}

class SchoolInformationRecordDocumentEquality
    implements Equality<SchoolInformationRecord> {
  const SchoolInformationRecordDocumentEquality();

  @override
  bool equals(SchoolInformationRecord? e1, SchoolInformationRecord? e2) {
    return e1?.gpa == e2?.gpa &&
        e1?.name == e2?.name &&
        e1?.city == e2?.city &&
        e1?.state == e2?.state &&
        e1?.otherInfo == e2?.otherInfo &&
        e1?.owner == e2?.owner;
  }

  @override
  int hash(SchoolInformationRecord? e) => const ListEquality()
      .hash([e?.gpa, e?.name, e?.city, e?.state, e?.otherInfo, e?.owner]);

  @override
  bool isValidKey(Object? o) => o is SchoolInformationRecord;
}
