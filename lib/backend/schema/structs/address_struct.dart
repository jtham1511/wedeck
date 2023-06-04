// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AddressStruct extends FFFirebaseStruct {
  AddressStruct({
    String? name,
    String? addressline1,
    String? addressline2,
    String? city,
    int? zipcode,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _addressline1 = addressline1,
        _addressline2 = addressline2,
        _city = city,
        _zipcode = zipcode,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "addressline1" field.
  String? _addressline1;
  String get addressline1 => _addressline1 ?? '';
  set addressline1(String? val) => _addressline1 = val;
  bool hasAddressline1() => _addressline1 != null;

  // "addressline2" field.
  String? _addressline2;
  String get addressline2 => _addressline2 ?? '';
  set addressline2(String? val) => _addressline2 = val;
  bool hasAddressline2() => _addressline2 != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  set city(String? val) => _city = val;
  bool hasCity() => _city != null;

  // "Zipcode" field.
  int? _zipcode;
  int get zipcode => _zipcode ?? 0;
  set zipcode(int? val) => _zipcode = val;
  void incrementZipcode(int amount) => _zipcode = zipcode + amount;
  bool hasZipcode() => _zipcode != null;

  static AddressStruct fromMap(Map<String, dynamic> data) => AddressStruct(
        name: data['name'] as String?,
        addressline1: data['addressline1'] as String?,
        addressline2: data['addressline2'] as String?,
        city: data['city'] as String?,
        zipcode: data['Zipcode'] as int?,
      );

  static AddressStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? AddressStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'addressline1': _addressline1,
        'addressline2': _addressline2,
        'city': _city,
        'Zipcode': _zipcode,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => toMap();
  static AddressStruct fromSerializableMap(Map<String, dynamic> data) =>
      fromMap(data);

  @override
  String toString() => 'AddressStruct(${toMap()})';
}

AddressStruct createAddressStruct({
  String? name,
  String? addressline1,
  String? addressline2,
  String? city,
  int? zipcode,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AddressStruct(
      name: name,
      addressline1: addressline1,
      addressline2: addressline2,
      city: city,
      zipcode: zipcode,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AddressStruct? updateAddressStruct(
  AddressStruct? address, {
  bool clearUnsetFields = true,
}) =>
    address
      ?..firestoreUtilData =
          FirestoreUtilData(clearUnsetFields: clearUnsetFields);

void addAddressStructData(
  Map<String, dynamic> firestoreData,
  AddressStruct? address,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (address == null) {
    return;
  }
  if (address.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && address.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final addressData = getAddressFirestoreData(address, forFieldValue);
  final nestedData = addressData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = address.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAddressFirestoreData(
  AddressStruct? address, [
  bool forFieldValue = false,
]) {
  if (address == null) {
    return {};
  }
  final firestoreData = mapToFirestore(address.toMap());

  // Add any Firestore field values
  address.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAddressListFirestoreData(
  List<AddressStruct>? addresss,
) =>
    addresss?.map((e) => getAddressFirestoreData(e, true)).toList() ?? [];
