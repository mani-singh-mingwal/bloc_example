import 'package:block_example_two/logic/cubit/settings_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit(SettingsState initialState)
      : super(
            SettingsState(appNotifications: false, emailNotifications: false));

  void toggleAppNotifications(bool newValue) =>
      emit(state.copyWith(appNotifications: newValue));

  void toggleEmailNotifications(bool newValue) =>
      emit(state.copyWith(emailNotifications: newValue));
}
