import 'package:emdr_therapy/constants.dart';
import 'package:flutter/material.dart';

class Setting {
  int _time = 1;
  double _size = 1;
  AnimationType _animationType = AnimationType.GLIDE;
  Color _color = Color(0xFF004444);
  int _duration = 60;
  Setting(
      [this._time = 1,
      this._size = 1,
      this._animationType = AnimationType.GLIDE,
      this._color = const Color(0xFF004444),
      this._duration = 60]);
  int get time => _time;
  double get size => _size;
  AnimationType get animationType => _animationType;
  Color get color => _color;
  int get duration => _duration;
  set time(int value) {
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
}
