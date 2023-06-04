import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PaymentTxnRecord extends FirestoreRecord {
  PaymentTxnRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "create_on" field.
  DateTime? _createOn;
  DateTime? get createOn => _createOn;
  bool hasCreateOn() => _createOn != null;

  // "cartTotal" field.
  double? _cartTotal;
  double get cartTotal => _cartTotal ?? 0.0;
  bool hasCartTotal() => _cartTotal != null;

  // "gstTotal" field.
  double? _gstTotal;
  double get gstTotal => _gstTotal ?? 0.0;
  bool hasGstTotal() => _gstTotal != null;

  // "is_paid" field.
  bool? _isPaid;
  bool get isPaid => _isPaid ?? false;
  bool hasIsPaid() => _isPaid != null;

  // "is_cancel" field.
  bool? _isCancel;
  bool get isCancel => _isCancel ?? false;
  bool hasIsCancel() => _isCancel != null;

  // "updated_on" field.
  DateTime? _updatedOn;
  DateTime? get updatedOn => _updatedOn;
  bool hasUpdatedOn() => _updatedOn != null;

  // "order_id" field.
  String? _orderId;
  String get orderId => _orderId ?? '';
  bool hasOrderId() => _orderId != null;

  // "cart_id" field.
  List<DocumentReference>? _cartId;
  List<DocumentReference> get cartId => _cartId ?? const [];
  bool hasCartId() => _cartId != null;

  // "totalPaid" field.
  double? _totalPaid;
  double get totalPaid => _totalPaid ?? 0.0;
  bool hasTotalPaid() => _totalPaid != null;

  // "member_id" field.
  String? _memberId;
  String get memberId => _memberId ?? '';
  bool hasMemberId() => _memberId != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "hp" field.
  String? _hp;
  String get hp => _hp ?? '';
  bool hasHp() => _hp != null;

  // "user_id" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  bool hasUserId() => _userId != null;

  void _initializeFields() {
    _createOn = snapshotData['create_on'] as DateTime?;
    _cartTotal = castToType<double>(snapshotData['cartTotal']);
    _gstTotal = castToType<double>(snapshotData['gstTotal']);
    _isPaid = snapshotData['is_paid'] as bool?;
    _isCancel = snapshotData['is_cancel'] as bool?;
    _updatedOn = snapshotData['updated_on'] as DateTime?;
    _orderId = snapshotData['order_id'] as String?;
    _cartId = getDataList(snapshotData['cart_id']);
    _totalPaid = castToType<double>(snapshotData['totalPaid']);
    _memberId = snapshotData['member_id'] as String?;
    _email = snapshotData['email'] as String?;
    _hp = snapshotData['hp'] as String?;
    _userId = snapshotData['user_id'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('payment_txn');

  static Stream<PaymentTxnRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PaymentTxnRecord.fromSnapshot(s));

  static Future<PaymentTxnRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PaymentTxnRecord.fromSnapshot(s));

  static PaymentTxnRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PaymentTxnRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PaymentTxnRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PaymentTxnRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PaymentTxnRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createPaymentTxnRecordData({
  DateTime? createOn,
  double? cartTotal,
  double? gstTotal,
  bool? isPaid,
  bool? isCancel,
  DateTime? updatedOn,
  String? orderId,
  double? totalPaid,
  String? memberId,
  String? email,
  String? hp,
  DocumentReference? userId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'create_on': createOn,
      'cartTotal': cartTotal,
      'gstTotal': gstTotal,
      'is_paid': isPaid,
      'is_cancel': isCancel,
      'updated_on': updatedOn,
      'order_id': orderId,
      'totalPaid': totalPaid,
      'member_id': memberId,
      'email': email,
      'hp': hp,
      'user_id': userId,
    }.withoutNulls,
  );

  return firestoreData;
}
