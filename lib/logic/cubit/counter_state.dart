/// ounterValue : 34
/// wasIncremented : true

class CounterState {
  CounterState({
    required this.counterValue,
    this.wasIncremented,
  });

  late int counterValue;
  bool? wasIncremented;

  CounterState.fromJson(dynamic json) {
    counterValue = json['counterValue'];
    wasIncremented = json['wasIncremented'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['counterValue'] = counterValue;
    map['wasIncremented'] = wasIncremented;
    return map;
  }

  @override
  String toString() {
    return 'CounterState{counterValue: $counterValue, wasIncremented: $wasIncremented}';
  }
}
