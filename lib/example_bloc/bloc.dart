
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class ColorEvent {}

class AmberColorEvent extends ColorEvent {}

class GreenColorEvent extends ColorEvent {}

class ColorBloc extends Bloc<ColorEvent, Color> {
  ColorBloc() : super(Colors.amber) {
    on<AmberColorEvent>((event, emit) => emit(Colors.amber));
    on<GreenColorEvent>((event, emit) => emit(Colors.green));
  }
}
