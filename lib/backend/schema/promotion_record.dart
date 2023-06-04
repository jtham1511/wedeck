import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PromotionRecord extends FirestoreRecord {
  PromotionRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "post_title" field.
  String? _postTitle;
  String get postTitle => _postTitle ?? '';
  bool hasPostTitle() => _postTitle != null;

  // "post_description" field.
  String? _postDescription;
  String get postDescription => _postDescription ?? '';
  bool hasPostDescription() => _postDescription != null;

  // "time_posted" field.
  DateTime? _timePosted;
  DateTime? get timePosted => _timePosted;
  bool hasTimePosted() => _timePosted != null;

  // "num_votes" field.
  int? _numVotes;
  int get numVotes => _numVotes ?? 0;
  bool hasNumVotes() => _numVotes != null;

  // "author" field.
  String? _author;
  String get author => _author ?? '';
  bool hasAuthor() => _author != null;

  // "product_spec" field.
  DocumentReference? _productSpec;
  DocumentReference? get productSpec => _productSpec;
  bool hasProductSpec() => _productSpec != null;

  // "coupon_image" field.
  String? _couponImage;
  String get couponImage => _couponImage ?? '';
  bool hasCouponImage() => _couponImage != null;

  void _initializeFields() {
    _postTitle = snapshotData['post_title'] as String?;
    _postDescription = snapshotData['post_description'] as String?;
    _timePosted = snapshotData['time_posted'] as DateTime?;
    _numVotes = snapshotData['num_votes'] as int?;
    _author = snapshotData['author'] as String?;
    _productSpec = snapshotData['product_spec'] as DocumentReference?;
    _couponImage = snapshotData['coupon_image'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('promotion');

  static Stream<PromotionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PromotionRecord.fromSnapshot(s));

  static Future<PromotionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PromotionRecord.fromSnapshot(s));

  static PromotionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PromotionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PromotionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PromotionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PromotionRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createPromotionRecordData({
  String? postTitle,
  String? postDescription,
  DateTime? timePosted,
  int? numVotes,
  String? author,
  DocumentReference? productSpec,
  String? couponImage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'post_title': postTitle,
      'post_description': postDescription,
      'time_posted': timePosted,
      'num_votes': numVotes,
      'author': author,
      'product_spec': productSpec,
      'coupon_image': couponImage,
    }.withoutNulls,
  );

  return firestoreData;
}
