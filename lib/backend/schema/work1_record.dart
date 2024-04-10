import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';

class Work1Record extends FirestoreRecord {
  Work1Record._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "startDate" field.
  String? _startDate;
  String get startDate => _startDate ?? '';
  bool hasStartDate() => _startDate != null;

  // "endDate" field.
  String? _endDate;
  String get endDate => _endDate ?? '';
  bool hasEndDate() => _endDate != null;

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
    _startDate = snapshotData['startDate'] as String?;
    _endDate = snapshotData['endDate'] as String?;
    _otherInfo = snapshotData['otherInfo'] as String?;
    _owner = snapshotData['owner'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('work1');

  static Stream<Work1Record> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => Work1Record.fromSnapshot(s));

  static Future<Work1Record> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => Work1Record.fromSnapshot(s));

  static Work1Record fromSnapshot(DocumentSnapshot snapshot) => Work1Record._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static Work1Record getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      Work1Record._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'Work1Record(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is Work1Record &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWork1RecordData({
  String? title,
  String? startDate,
  String? endDate,
  String? otherInfo,
  String? owner,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'startDate': startDate,
      'endDate': endDate,
      'otherInfo': otherInfo,
      'owner': owner,
    }.withoutNulls,
  );

  return firestoreData;
}

class Work1RecordDocumentEquality implements Equality<Work1Record> {
  const Work1RecordDocumentEquality();

  @override
  bool equals(Work1Record? e1, Work1Record? e2) {
    return e1?.title == e2?.title &&
        e1?.startDate == e2?.startDate &&
        e1?.endDate == e2?.endDate &&
        e1?.otherInfo == e2?.otherInfo &&
        e1?.owner == e2?.owner;
  }

  @override
  int hash(Work1Record? e) => const ListEquality()
      .hash([e?.title, e?.startDate, e?.endDate, e?.otherInfo, e?.owner]);

  @override
  bool isValidKey(Object? o) => o is Work1Record;
}
