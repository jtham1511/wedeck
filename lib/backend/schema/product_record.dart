import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'product_record.g.dart';

abstract class ProductRecord
    implements Built<ProductRecord, ProductRecordBuilder> {
  static Serializer<ProductRecord> get serializer => _$productRecordSerializer;

  String? get name;

  String? get description;

  String? get specifications;

  @BuiltValueField(wireName: 'created_at')
  DateTime? get createdAt;

  @BuiltValueField(wireName: 'modified_at')
  DateTime? get modifiedAt;

  @BuiltValueField(wireName: 'on_sale')
  bool? get onSale;

  @BuiltValueField(wireName: 'sale_price')
  double? get salePrice;

  int? get quantity;

  double? get cost;

  @BuiltValueField(wireName: 'retail_price')
  double? get retailPrice;

  @BuiltValueField(wireName: 'product_image')
  String? get productImage;

  String? get uom;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ProductRecordBuilder builder) => builder
    ..name = ''
    ..description = ''
    ..specifications = ''
    ..onSale = false
    ..salePrice = 0.0
    ..quantity = 0
    ..cost = 0.0
    ..retailPrice = 0.0
    ..productImage = ''
    ..uom = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('product');

  static Stream<ProductRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ProductRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ProductRecord._();
  factory ProductRecord([void Function(ProductRecordBuilder) updates]) =
      _$ProductRecord;

  static ProductRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createProductRecordData({
  String? name,
  String? description,
  String? specifications,
  DateTime? createdAt,
  DateTime? modifiedAt,
  bool? onSale,
  double? salePrice,
  int? quantity,
  double? cost,
  double? retailPrice,
  String? productImage,
  String? uom,
}) {
  final firestoreData = serializers.toFirestore(
    ProductRecord.serializer,
    ProductRecord(
      (p) => p
        ..name = name
        ..description = description
        ..specifications = specifications
        ..createdAt = createdAt
        ..modifiedAt = modifiedAt
        ..onSale = onSale
        ..salePrice = salePrice
        ..quantity = quantity
        ..cost = cost
        ..retailPrice = retailPrice
        ..productImage = productImage
        ..uom = uom,
    ),
  );

  return firestoreData;
}
