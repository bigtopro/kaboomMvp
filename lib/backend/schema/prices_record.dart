import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PricesRecord extends FirestoreRecord {
  PricesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "controllerCount" field.
  int? _controllerCount;
  int get controllerCount => _controllerCount ?? 0;
  bool hasControllerCount() => _controllerCount != null;

  // "weekdayPrice" field.
  double? _weekdayPrice;
  double get weekdayPrice => _weekdayPrice ?? 0.0;
  bool hasWeekdayPrice() => _weekdayPrice != null;

  // "weekendPrice" field.
  double? _weekendPrice;
  double get weekendPrice => _weekendPrice ?? 0.0;
  bool hasWeekendPrice() => _weekendPrice != null;

  // "cafeId" field.
  DocumentReference? _cafeId;
  DocumentReference? get cafeId => _cafeId;
  bool hasCafeId() => _cafeId != null;

  // "duration" field.
  String? _duration;
  String get duration => _duration ?? '';
  bool hasDuration() => _duration != null;

  // "gameType" field.
  String? _gameType;
  String get gameType => _gameType ?? '';
  bool hasGameType() => _gameType != null;

  void _initializeFields() {
    _controllerCount = castToType<int>(snapshotData['controllerCount']);
    _weekdayPrice = castToType<double>(snapshotData['weekdayPrice']);
    _weekendPrice = castToType<double>(snapshotData['weekendPrice']);
    _cafeId = snapshotData['cafeId'] as DocumentReference?;
    _duration = snapshotData['duration'] as String?;
    _gameType = snapshotData['gameType'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Prices');

  static Stream<PricesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PricesRecord.fromSnapshot(s));

  static Future<PricesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PricesRecord.fromSnapshot(s));

  static PricesRecord fromSnapshot(DocumentSnapshot snapshot) => PricesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PricesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PricesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PricesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PricesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPricesRecordData({
  int? controllerCount,
  double? weekdayPrice,
  double? weekendPrice,
  DocumentReference? cafeId,
  String? duration,
  String? gameType,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'controllerCount': controllerCount,
      'weekdayPrice': weekdayPrice,
      'weekendPrice': weekendPrice,
      'cafeId': cafeId,
      'duration': duration,
      'gameType': gameType,
    }.withoutNulls,
  );

  return firestoreData;
}

class PricesRecordDocumentEquality implements Equality<PricesRecord> {
  const PricesRecordDocumentEquality();

  @override
  bool equals(PricesRecord? e1, PricesRecord? e2) {
    return e1?.controllerCount == e2?.controllerCount &&
        e1?.weekdayPrice == e2?.weekdayPrice &&
        e1?.weekendPrice == e2?.weekendPrice &&
        e1?.cafeId == e2?.cafeId &&
        e1?.duration == e2?.duration &&
        e1?.gameType == e2?.gameType;
  }

  @override
  int hash(PricesRecord? e) => const ListEquality().hash([
        e?.controllerCount,
        e?.weekdayPrice,
        e?.weekendPrice,
        e?.cafeId,
        e?.duration,
        e?.gameType
      ]);

  @override
  bool isValidKey(Object? o) => o is PricesRecord;
}
