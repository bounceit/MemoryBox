import 'package:flutter/material.dart';

@immutable
abstract class QualityTotalTimeEvent {}

class LoadQualityTotalTimeEvent extends QualityTotalTimeEvent {
  LoadQualityTotalTimeEvent();
}

class UpdateQualityTotalTimeEvent extends QualityTotalTimeEvent {
  UpdateQualityTotalTimeEvent({
    this.qualityTotalTime = const [],
  });
  final List qualityTotalTime;
}
