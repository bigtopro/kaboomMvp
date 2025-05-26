import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CafeDetailsRecord extends FirestoreRecord {
  CafeDetailsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "CafeName" field.
  String? _cafeName;
  String get cafeName => _cafeName ?? '';
  bool hasCafeName() => _cafeName != null;

  // "ConsolesAvailable" field.
  List<String>? _consolesAvailable;
  List<String> get consolesAvailable => _consolesAvailable ?? const [];
  bool hasConsolesAvailable() => _consolesAvailable != null;

  // "StartingPrice" field.
  double? _startingPrice;
  double get startingPrice => _startingPrice ?? 0.0;
  bool hasStartingPrice() => _startingPrice != null;

  // "Rating" field.
  double? _rating;
  double get rating => _rating ?? 0.0;
  bool hasRating() => _rating != null;

  // "Reviews" field.
  List<String>? _reviews;
  List<String> get reviews => _reviews ?? const [];
  bool hasReviews() => _reviews != null;

  // "Timings" field.
  String? _timings;
  String get timings => _timings ?? '';
  bool hasTimings() => _timings != null;

  // "CafeHomeImage" field.
  String? _cafeHomeImage;
  String get cafeHomeImage => _cafeHomeImage ?? '';
  bool hasCafeHomeImage() => _cafeHomeImage != null;

  // "CafeAddress" field.
  String? _cafeAddress;
  String get cafeAddress => _cafeAddress ?? '';
  bool hasCafeAddress() => _cafeAddress != null;

  // "CafeGoogleMapsLink" field.
  String? _cafeGoogleMapsLink;
  String get cafeGoogleMapsLink => _cafeGoogleMapsLink ?? '';
  bool hasCafeGoogleMapsLink() => _cafeGoogleMapsLink != null;

  // "CafeInfoImages" field.
  List<String>? _cafeInfoImages;
  List<String> get cafeInfoImages => _cafeInfoImages ?? const [];
  bool hasCafeInfoImages() => _cafeInfoImages != null;

  void _initializeFields() {
    _cafeName = snapshotData['CafeName'] as String?;
    _consolesAvailable = getDataList(snapshotData['ConsolesAvailable']);
    _startingPrice = castToType<double>(snapshotData['StartingPrice']);
    _rating = castToType<double>(snapshotData['Rating']);
    _reviews = getDataList(snapshotData['Reviews']);
    _timings = snapshotData['Timings'] as String?;
    _cafeHomeImage = snapshotData['CafeHomeImage'] as String?;
    _cafeAddress = snapshotData['CafeAddress'] as String?;
    _cafeGoogleMapsLink = snapshotData['CafeGoogleMapsLink'] as String?;
    _cafeInfoImages = getDataList(snapshotData['CafeInfoImages']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Cafe_Details');

  static Stream<CafeDetailsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CafeDetailsRecord.fromSnapshot(s));

  static Future<CafeDetailsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CafeDetailsRecord.fromSnapshot(s));

  static CafeDetailsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CafeDetailsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CafeDetailsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CafeDetailsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CafeDetailsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CafeDetailsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCafeDetailsRecordData({
  String? cafeName,
  double? startingPrice,
  double? rating,
  String? timings,
  String? cafeHomeImage,
  String? cafeAddress,
  String? cafeGoogleMapsLink,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'CafeName': cafeName,
      'StartingPrice': startingPrice,
      'Rating': rating,
      'Timings': timings,
      'CafeHomeImage': cafeHomeImage,
      'CafeAddress': cafeAddress,
      'CafeGoogleMapsLink': cafeGoogleMapsLink,
    }.withoutNulls,
  );

  return firestoreData;
}

class CafeDetailsRecordDocumentEquality implements Equality<CafeDetailsRecord> {
  const CafeDetailsRecordDocumentEquality();

  @override
  bool equals(CafeDetailsRecord? e1, CafeDetailsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.cafeName == e2?.cafeName &&
        listEquality.equals(e1?.consolesAvailable, e2?.consolesAvailable) &&
        e1?.startingPrice == e2?.startingPrice &&
        e1?.rating == e2?.rating &&
        listEquality.equals(e1?.reviews, e2?.reviews) &&
        e1?.timings == e2?.timings &&
        e1?.cafeHomeImage == e2?.cafeHomeImage &&
        e1?.cafeAddress == e2?.cafeAddress &&
        e1?.cafeGoogleMapsLink == e2?.cafeGoogleMapsLink &&
        listEquality.equals(e1?.cafeInfoImages, e2?.cafeInfoImages);
  }

  @override
  int hash(CafeDetailsRecord? e) => const ListEquality().hash([
        e?.cafeName,
        e?.consolesAvailable,
        e?.startingPrice,
        e?.rating,
        e?.reviews,
        e?.timings,
        e?.cafeHomeImage,
        e?.cafeAddress,
        e?.cafeGoogleMapsLink,
        e?.cafeInfoImages
      ]);

  @override
  bool isValidKey(Object? o) => o is CafeDetailsRecord;
}
