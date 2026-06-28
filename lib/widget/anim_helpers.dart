import 'dart:math' as math;

import 'package:flutter/material.dart';

double interval(double value, double start, double end) {
  if (value <= start) return 0;
  if (value >= end) return 1;
  final t = (value - start) / (end - start);
  return Curves.easeOutCubic.transform(t);
}

double squeeze(double value, bool isClosing) {
  const duration = 0.48;
  final phase = isClosing ? 1 - value : value;
  if (phase <= 0 || phase >= duration) return 0;
  return math.sin((phase / duration) * math.pi);
}
