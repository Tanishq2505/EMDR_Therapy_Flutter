import 'package:emdr_therapy/constants.dart';
import 'package:flutter/material.dart';

class Setting {
  double _time = 1.0;
  double _size = 50;
  AnimationType _animationType = AnimationType.GLIDE;
  Color _color = Color(0xFF004444);
  int _duration = 1;
  bool _clockwise;
  bool _isPlaying;
  Setting([
    this._time = 10.0,
    this._size = 10,
    this._animationType = AnimationType.GLIDE,
    this._color = const Color(0xFF004444),
    this._duration = 1,
    this._clockwise = true,
    this._isPlaying = false,
  ]);
  double get time => _time;
  double get size => _size;
  AnimationType get animationType => _animationType;
  Color get color => _color;
  int get duration => _duration;
  bool get clockwise => _clockwise;
  bool get isPlaying => _isPlaying;
  set time(double value) {
    _time = value;
  }

  set size(double value) {
    _size = value;
  }

  set animationType(AnimationType value) {
    _animationType = value;
  }

  set color(Color value) {
    _color = value;
  }

  set duration(int value) {
    _duration = value;
  }

  set clockwise(bool value) {
    _clockwise = value;
  }

  set isPlaying(bool value) {
    _isPlaying = value;
  }
}
