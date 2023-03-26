// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TransactionRecord> _$transactionRecordSerializer =
    new _$TransactionRecordSerializer();

class _$TransactionRecordSerializer
    implements StructuredSerializer<TransactionRecord> {
  @override
  final Iterable<Type> types = const [TransactionRecord, _$TransactionRecord];
  @override
  final String wireName = 'TransactionRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, TransactionRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.amount;
    if (value != null) {
      result
        ..add('amount')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.tax;
    if (value != null) {
      result
        ..add('tax')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.createdAt;
    if (value != null) {
      result
        ..add('created_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.qty;
    if (value != null) {
      result
        ..add('qty')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  TransactionRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TransactionRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'amount':
          result.amount = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'tax':
          result.tax = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'qty':
          result.qty = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$TransactionRecord extends TransactionRecord {
  @override
  final double? amount;
  @override
  final String? status;
  @override
  final double? tax;
  @override
  final DateTime? createdAt;
  @override
  final int? qty;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$TransactionRecord(
          [void Function(TransactionRecordBuilder)? updates]) =>
      (new TransactionRecordBuilder()..update(updates))._build();

  _$TransactionRecord._(
      {this.amount,
      this.status,
      this.tax,
      this.createdAt,
      this.qty,
      this.ffRef})
      : super._();

  @override
  TransactionRecord rebuild(void Function(TransactionRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TransactionRecordBuilder toBuilder() =>
      new TransactionRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TransactionRecord &&
        amount == other.amount &&
        status == other.status &&
        tax == other.tax &&
        createdAt == other.createdAt &&
        qty == other.qty &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, amount.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, tax.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, qty.hashCode);
    _$hash = $jc(_$hash, ffRef.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TransactionRecord')
          ..add('amount', amount)
          ..add('status', status)
          ..add('tax', tax)
          ..add('createdAt', createdAt)
          ..add('qty', qty)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class TransactionRecordBuilder
    implements Builder<TransactionRecord, TransactionRecordBuilder> {
  _$TransactionRecord? _$v;

  double? _amount;
  double? get amount => _$this._amount;
  set amount(double? amount) => _$this._amount = amount;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  double? _tax;
  double? get tax => _$this._tax;
  set tax(double? tax) => _$this._tax = tax;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  int? _qty;
  int? get qty => _$this._qty;
  set qty(int? qty) => _$this._qty = qty;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  TransactionRecordBuilder() {
    TransactionRecord._initializeBuilder(this);
  }

  TransactionRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _amount = $v.amount;
      _status = $v.status;
      _tax = $v.tax;
      _createdAt = $v.createdAt;
      _qty = $v.qty;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TransactionRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TransactionRecord;
  }

  @override
  void update(void Function(TransactionRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TransactionRecord build() => _build();

  _$TransactionRecord _build() {
    final _$result = _$v ??
        new _$TransactionRecord._(
            amount: amount,
            status: status,
            tax: tax,
            createdAt: createdAt,
            qty: qty,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
