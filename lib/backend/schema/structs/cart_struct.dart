import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'cart_struct.g.dart';

abstract class CartStruct implements Built<CartStruct, CartStructBuilder> {
  static Serializer<CartStruct> get serializer => _$cartStructSerializer;

  String? get name;

  double? get price;

  @BuiltValueField(wireName: 'total_amt')
  double? get totalAmt;

  double? get qty;

  @BuiltValueField(wireName: 'ref_id')
  DocumentReference? get refId;

  String? get id;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(CartStructBuilder builder) => builder
    ..name = ''
    ..price = 0.0
    ..totalAmt = 0.0
    ..qty = 0.0
    ..id = ''
    ..firestoreUtilData = FirestoreUtilData();

  CartStruct._();
  factory CartStruct([void Function(CartStructBuilder) updates]) = _$CartStruct;
}

CartStruct createCartStruct({
  String? name,
  double? price,
  double? totalAmt,
  double? qty,
  DocumentReference? refId,
  String? id,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CartStruct(
      (c) => c
        ..name = name
        ..price = price
        ..totalAmt = totalAmt
        ..qty = qty
        ..refId = refId
        ..id = id
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

CartStruct? updateCartStruct(
  CartStruct? cart, {
  bool clearUnsetFields = true,
}) =>
    cart != null
        ? (cart.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addCartStructData(
  Map<String, dynamic> firestoreData,
  CartStruct? cart,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (cart == null) {
    return;
  }
  if (cart.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && cart.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final cartData = getCartFirestoreData(cart, forFieldValue);
  final nestedData = cartData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = cart.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getCartFirestoreData(
  CartStruct? cart, [
  bool forFieldValue = false,
]) {
  if (cart == null) {
    return {};
  }
  final firestoreData = serializers.toFirestore(CartStruct.serializer, cart);

  // Add any Firestore field values
  cart.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCartListFirestoreData(
  List<CartStruct>? carts,
) =>
    carts?.map((c) => getCartFirestoreData(c, true)).toList() ?? [];
