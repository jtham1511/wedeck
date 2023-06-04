import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrderRecord extends FirestoreRecord {
  OrderRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "is_delivered" field.
  bool? _isDelivered;
  bool get isDelivered => _isDelivered ?? false;
  bool hasIsDelivered() => _isDelivered != null;

  // "address" field.
  DocumentReference? _address;
  DocumentReference? get address => _address;
  bool hasAddress() => _address != null;

  // "orderid" field.
  String? _orderid;
  String get orderid => _orderid ?? '';
  bool hasOrderid() => _orderid != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  bool hasAmount() => _amount != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "productOrdered" field.
  List<DocumentReference>? _productOrdered;
  List<DocumentReference> get productOrdered => _productOrdered ?? const [];
  bool hasProductOrdered() => _productOrdered != null;

  // "rewardPts_earned" field.
  double? _rewardPtsEarned;
  double get rewardPtsEarned => _rewardPtsEarned ?? 0.0;
  bool hasRewardPtsEarned() => _rewardPtsEarned != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "hp" field.
  String? _hp;
  String get hp => _hp ?? '';
  bool hasHp() => _hp != null;

  void _initializeFields() {
    _user = snapshotData['user'] as DocumentReference?;
    _isDelivered = snapshotData['is_delivered'] as bool?;
    _address = snapshotData['address'] as DocumentReference?;
    _orderid = snapshotData['orderid'] as String?;
    _status = snapshotData['status'] as String?;
    _amount = castToType<double>(snapshotData['amount']);
    _createdAt = snapshotData['created_at'] as DateTime?;
    _productOrdered = getDataList(snapshotData['productOrdered']);
    _rewardPtsEarned = castToType<double>(snapshotData['rewardPts_earned']);
    _email = snapshotData['email'] as String?;
    _hp = snapshotData['hp'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('order');

  static Stream<OrderRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrderRecord.fromSnapshot(s));

  static Future<OrderRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrderRecord.fromSnapshot(s));

  static OrderRecord fromSnapshot(DocumentSnapshot snapshot) => OrderRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrderRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrderRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrderRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createOrderRecordData({
  DocumentReference? user,
  bool? isDelivered,
  DocumentReference? address,
  String? orderid,
  String? status,
  double? amount,
  DateTime? createdAt,
  double? rewardPtsEarned,
  String? email,
  String? hp,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user': user,
      'is_delivered': isDelivered,
      'address': address,
      'orderid': orderid,
      'status': status,
      'amount': amount,
      'created_at': createdAt,
      'rewardPts_earned': rewardPtsEarned,
      'email': email,
      'hp': hp,
    }.withoutNulls,
  );

  return firestoreData;
}
