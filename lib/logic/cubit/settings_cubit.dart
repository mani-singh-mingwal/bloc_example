import 'package:block_example_two/logic/cubit/settings_state.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class SettingsCubit extends Cubit<SettingsState> with HydratedMixin {
  SettingsCubit(SettingsState initialState)
      : super(
            SettingsState(appNotifications: false, emailNotifications: false));

  void toggleAppNotifications(bool newValue) =>
      emit(state.copyWith(appNotifications: newValue));

  void toggleEmailNotifications(bool newValue) =>
      emit(state.copyWith(emailNotifications: newValue));

  @override
  SettingsState? fromJson(Map<String, dynamic> json) {
    return SettingsState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(SettingsState state) {
    return state.toJson();
  }
}
