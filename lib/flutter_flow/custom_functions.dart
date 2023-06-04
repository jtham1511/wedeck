import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

double calItemPrice(
  double unitprice,
  int quantity,
) {
  double finalprice = unitprice * quantity;

  return finalprice;
}

double? cartTotal(
  List<double> itemPrices,
  List<int> itemQty,
) {
  double grandTotal = 0;
  for (int i = 0; i < itemPrices.length; i++) {
    grandTotal += itemPrices[i] * itemQty[i];
  }

  return grandTotal;
}

double? calculateGST(
  List<double> itemPrices,
  List<int> itemQty,
) {
  double grandTotal = 0;
  for (int i = 0; i < itemPrices.length; i++) {
    grandTotal += itemPrices[i] * itemQty[i];
  }

  double gstAmount = grandTotal * 0.08;

  return gstAmount;
}

double? totalAndGST(
  List<double> itemPrices,
  List<int> itemQty,
) {
  double grandTotal = 0;
  for (int i = 0; i < itemPrices.length; i++) {
    grandTotal += itemPrices[i] * itemQty[i];
  }
  double totalWithGST = grandTotal * 1.08;

  return totalWithGST;
}

int convertSliderStrToInt(String? sliderStr) {
  int tries;

  if (sliderStr == null) {
    return 0;
  }

  try {
    tries = int.parse(sliderStr);
  } catch (err) {
    return 0;
  }

  return tries;
}
