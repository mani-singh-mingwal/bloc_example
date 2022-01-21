import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class MyClass extends Equatable {
  final int values;

  MyClass(this.values);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MyClass &&
          runtimeType == other.runtimeType &&
          values == other.values;

  @override
  int get hashCode => values.hashCode;

  @override
  List<Object?> get props => [values];
}

void main(List<String> args) {
  final a = MyClass(1);
  final b = MyClass(1);

  debugPrint("${a == b}");
}
