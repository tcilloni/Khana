import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

bool userAcceptedMeal(
  DocumentReference userID,
  DocumentReference mealID,
  List<AcceptanceRecord> acceptanceList,
) {
  // Add your function code here!
  for (AcceptanceRecord rec in acceptanceList) {
    if ((rec.clientID == userID) && (rec.mealID == mealID)) {
      return true;
    }
  }

  return false;
}

DocumentReference getAcceptedMeal(
  DocumentReference userID,
  DocumentReference mealID,
  List<AcceptanceRecord> acceptanceList,
) {
  // Add your function code here!
  for (AcceptanceRecord rec in acceptanceList) {
    if ((rec.clientID == userID) && (rec.mealID == mealID)) {
      return rec.reference;
    }
  }

  throw Exception();
}

List<DocumentReference> getAcceptedMeals(
    List<AcceptanceRecord> acceptanceList) {
  // Add your function code here!
  List<DocumentReference> res = [];

  for (AcceptanceRecord rec in acceptanceList) {
    res.add(rec.mealID!);
  }

  return res;
}

bool isUpcomingMealOfUser(
  DocumentReference mealID,
  List<AcceptanceRecord> acceptanceList,
) {
  // Add your function code here!
  for (AcceptanceRecord rec in acceptanceList) {
    if (rec.mealID == mealID) {
      return true;
    }
  }
  return false;
}
