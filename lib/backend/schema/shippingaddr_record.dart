import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ShippingaddrRecord extends FirestoreRecord {
  ShippingaddrRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "owner" field.
  DocumentReference? _owner;
  DocumentReference? get owner => _owner;
  bool hasOwner() => _owner != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "modified_at" field.
  DateTime? _modifiedAt;
  DateTime? get modifiedAt => _modifiedAt;
  bool hasModifiedAt() => _modifiedAt != null;

  // "archived" field.
  bool? _archived;
  bool get archived => _archived ?? false;
  bool hasArchived() => _archived != null;

  // "default_address" field.
  bool? _defaultAddress;
  bool get defaultAddress => _defaultAddress ?? false;
  bool hasDefaultAddress() => _defaultAddress != null;

  // "address" field.
  AddressStruct? _address;
  AddressStruct get address => _address ?? AddressStruct();
  bool hasAddress() => _address != null;

  void _initializeFields() {
    _owner = snapshotData['owner'] as DocumentReference?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _modifiedAt = snapshotData['modified_at'] as DateTime?;
    _archived = snapshotData['archived'] as bool?;
    _defaultAddress = snapshotData['default_address'] as bool?;
    _address = AddressStruct.maybeFromMap(snapshotData['address']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('shippingaddr');

  static Stream<ShippingaddrRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ShippingaddrRecord.fromSnapshot(s));

  static Future<ShippingaddrRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ShippingaddrRecord.fromSnapshot(s));

  static ShippingaddrRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ShippingaddrRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ShippingaddrRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ShippingaddrRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ShippingaddrRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createShippingaddrRecordData({
  DocumentReference? owner,
  DateTime? createdAt,
  DateTime? modifiedAt,
  bool? archived,
  bool? defaultAddress,
  AddressStruct? address,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'owner': owner,
      'created_at': createdAt,
      'modified_at': modifiedAt,
      'archived': archived,
      'default_address': defaultAddress,
      'address': AddressStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "address" field.
  addAddressStructData(firestoreData, address, 'address');

  return firestoreData;
}
