import 'package:block_example_two/logic/cubit/counter_cubit.dart';
import 'package:block_example_two/logic/cubit/counter_state.dart';
import 'package:block_example_two/logic/cubit/internet_cubit.dart';
import 'package:block_example_two/logic/cubit/internet_state.dart';
import 'package:block_example_two/logic/cubit/settings_cubit.dart';
import 'package:block_example_two/logic/cubit/settings_state.dart';
import 'package:block_example_two/presentation/router.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());
  runApp(MyApp(
    appRoute: AppRoute(),
    connectivity: Connectivity(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.appRoute, required this.connectivity})
      : super(key: key);
  final AppRoute appRoute;
  final Connectivity connectivity;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(
          create: (context) =>
              InternetCubit(InternetLoading(), connectivity: connectivity),
        ),
        BlocProvider(
            create: (context) => CounterCubit(
                  CounterState(counterValue: 0),
                )),
        BlocProvider(
            create: (context) => SettingsCubit(SettingsState(
                appNotifications: false, emailNotifications: false)))
      ],
      child: MaterialApp(
        title: "Flutter Demo",
        theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: appRoute.onGenerateRoute,
      ),
    );
  }
}
