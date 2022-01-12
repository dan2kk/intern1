import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

double avg(
  double rate1,
  double rate2,
  double rate3,
) {
  return (rate1 + rate2 + rate3) / 3;
}

List<double> setarray(
  double rate1,
  double rate2,
  double rate3,
) {
  // Add your function code here!
  return [rate1, rate2, rate3];
}
