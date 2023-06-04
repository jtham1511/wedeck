import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PaymentMethodRecord extends FirestoreRecord {
  PaymentMethodRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "qrcode" field.
  String? _qrcode;
  String get qrcode => _qrcode ?? '';
  bool hasQrcode() => _qrcode != null;

  // "limit" field.
  double? _limit;
  double get limit => _limit ?? 0.0;
  bool hasLimit() => _limit != null;

  // "bank" field.
  String? _bank;
  String get bank => _bank ?? '';
  bool hasBank() => _bank != null;

  // "account_name" field.
  String? _accountName;
  String get accountName => _accountName ?? '';
  bool hasAccountName() => _accountName != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _qrcode = snapshotData['qrcode'] as String?;
    _limit = castToType<double>(snapshotData['limit']);
    _bank = snapshotData['bank'] as String?;
    _accountName = snapshotData['account_name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('payment_method');

  static Stream<PaymentMethodRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PaymentMethodRecord.fromSnapshot(s));

  static Future<PaymentMethodRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PaymentMethodRecord.fromSnapshot(s));

  static PaymentMethodRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PaymentMethodRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PaymentMethodRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PaymentMethodRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PaymentMethodRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createPaymentMethodRecordData({
  String? name,
  String? qrcode,
  double? limit,
  String? bank,
  String? accountName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'qrcode': qrcode,
      'limit': limit,
      'bank': bank,
      'account_name': accountName,
    }.withoutNulls,
  );

  return firestoreData;
}
