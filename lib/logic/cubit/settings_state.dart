import 'package:equatable/equatable.dart';

class SettingsState extends Equatable {
  final bool appNotifications;
  final bool emailNotifications;

  const SettingsState(
      {required this.appNotifications, required this.emailNotifications});

  SettingsState copyWith({bool? appNotifications, bool? emailNotifications}) {
    return SettingsState(
        appNotifications: appNotifications ?? this.appNotifications,
        emailNotifications: emailNotifications ?? this.emailNotifications);
  }

  factory SettingsState.fromJson(Map<String, dynamic> json) {
    return SettingsState(
        appNotifications: json["appNotifications"],
        emailNotifications: json["emailNotifications"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "appNotifications": appNotifications,
      "emailNotifications": emailNotifications
    };
  }

  @override
  List<Object?> get props => [appNotifications, emailNotifications];
}
