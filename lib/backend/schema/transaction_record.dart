import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'transaction_record.g.dart';

abstract class TransactionRecord
    implements Built<TransactionRecord, TransactionRecordBuilder> {
  static Serializer<TransactionRecord> get serializer =>
      _$transactionRecordSerializer;

  double? get amount;

  String? get status;

  double? get tax;

  @BuiltValueField(wireName: 'created_at')
  DateTime? get createdAt;

  int? get qty;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(TransactionRecordBuilder builder) => builder
    ..amount = 0.0
    ..status = ''
    ..tax = 0.0
    ..qty = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('transaction');

  static Stream<TransactionRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<TransactionRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  TransactionRecord._();
  factory TransactionRecord([void Function(TransactionRecordBuilder) updates]) =
      _$TransactionRecord;

  static TransactionRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createTransactionRecordData({
  double? amount,
  String? status,
  double? tax,
  DateTime? createdAt,
  int? qty,
}) {
  final firestoreData = serializers.toFirestore(
    TransactionRecord.serializer,
    TransactionRecord(
      (t) => t
        ..amount = amount
        ..status = status
        ..tax = tax
        ..createdAt = createdAt
        ..qty = qty,
    ),
  );

  return firestoreData;
}
