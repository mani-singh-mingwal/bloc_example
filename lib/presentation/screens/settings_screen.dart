import 'package:block_example_two/logic/cubit/settings_cubit.dart';
import 'package:block_example_two/logic/cubit/settings_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/src/provider.dart';

class SettingsScreen extends StatefulWidget {
  final String title;

  const SettingsScreen({Key? key, required this.title}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          return Column(
            children: [
              SwitchListTile(
                  title: const Text("App Notifications"),
                  value: state.appNotifications,
                  onChanged: (newValue) {
                    context
                        .read<SettingsCubit>()
                        .toggleAppNotifications(newValue);
                  }),
              SwitchListTile(
                  title: const Text("Email Notifications"),
                  value: state.emailNotifications,
                  onChanged: (newValue) {
                    BlocProvider.of<SettingsCubit>(context)
                        .toggleEmailNotifications(newValue);
                  })
            ],
          );
        },
      ),
    );
  }
}
