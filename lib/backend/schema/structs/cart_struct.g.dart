// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CartStruct> _$cartStructSerializer = new _$CartStructSerializer();

class _$CartStructSerializer implements StructuredSerializer<CartStruct> {
  @override
  final Iterable<Type> types = const [CartStruct, _$CartStruct];
  @override
  final String wireName = 'CartStruct';

  @override
  Iterable<Object?> serialize(Serializers serializers, CartStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.price;
    if (value != null) {
      result
        ..add('price')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.totalAmt;
    if (value != null) {
      result
        ..add('total_amt')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.qty;
    if (value != null) {
      result
        ..add('qty')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.refId;
    if (value != null) {
      result
        ..add('ref_id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  CartStruct deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CartStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'price':
          result.price = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'total_amt':
          result.totalAmt = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'qty':
          result.qty = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'ref_id':
          result.refId = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'firestoreUtilData':
          result.firestoreUtilData = serializers.deserialize(value,
                  specifiedType: const FullType(FirestoreUtilData))!
              as FirestoreUtilData;
          break;
      }
    }

    return result.build();
  }
}

class _$CartStruct extends CartStruct {
  @override
  final String? name;
  @override
  final double? price;
  @override
  final double? totalAmt;
  @override
  final double? qty;
  @override
  final DocumentReference<Object?>? refId;
  @override
  final String? id;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$CartStruct([void Function(CartStructBuilder)? updates]) =>
      (new CartStructBuilder()..update(updates))._build();

  _$CartStruct._(
      {this.name,
      this.price,
      this.totalAmt,
      this.qty,
      this.refId,
      this.id,
      required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'CartStruct', 'firestoreUtilData');
  }

  @override
  CartStruct rebuild(void Function(CartStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CartStructBuilder toBuilder() => new CartStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CartStruct &&
        name == other.name &&
        price == other.price &&
        totalAmt == other.totalAmt &&
        qty == other.qty &&
        refId == other.refId &&
        id == other.id &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, price.hashCode);
    _$hash = $jc(_$hash, totalAmt.hashCode);
    _$hash = $jc(_$hash, qty.hashCode);
    _$hash = $jc(_$hash, refId.hashCode);
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, firestoreUtilData.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CartStruct')
          ..add('name', name)
          ..add('price', price)
          ..add('totalAmt', totalAmt)
          ..add('qty', qty)
          ..add('refId', refId)
          ..add('id', id)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class CartStructBuilder implements Builder<CartStruct, CartStructBuilder> {
  _$CartStruct? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  double? _price;
  double? get price => _$this._price;
  set price(double? price) => _$this._price = price;

  double? _totalAmt;
  double? get totalAmt => _$this._totalAmt;
  set totalAmt(double? totalAmt) => _$this._totalAmt = totalAmt;

  double? _qty;
  double? get qty => _$this._qty;
  set qty(double? qty) => _$this._qty = qty;

  DocumentReference<Object?>? _refId;
  DocumentReference<Object?>? get refId => _$this._refId;
  set refId(DocumentReference<Object?>? refId) => _$this._refId = refId;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  CartStructBuilder() {
    CartStruct._initializeBuilder(this);
  }

  CartStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _price = $v.price;
      _totalAmt = $v.totalAmt;
      _qty = $v.qty;
      _refId = $v.refId;
      _id = $v.id;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CartStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CartStruct;
  }

  @override
  void update(void Function(CartStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CartStruct build() => _build();

  _$CartStruct _build() {
    final _$result = _$v ??
        new _$CartStruct._(
            name: name,
            price: price,
            totalAmt: totalAmt,
            qty: qty,
            refId: refId,
            id: id,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData, r'CartStruct', 'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
