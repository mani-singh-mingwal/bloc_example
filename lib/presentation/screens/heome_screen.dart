import 'package:block_example_two/constants.dart';
import 'package:block_example_two/logic/cubit/counter_cubit.dart';
import 'package:block_example_two/logic/cubit/counter_state.dart';
import 'package:block_example_two/logic/cubit/internet_cubit.dart';
import 'package:block_example_two/logic/cubit/internet_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  final String title;
  final Color color;

  const HomeScreen({Key? key, required this.title, required this.color})
      : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<InternetCubit, InternetState>(
                builder: (context, state) {
              if (state is InternetConnected &&
                  state.connectionType == ConnectionType.wifi) {
                return const Text("Wifi");
              } else if (state is InternetConnected &&
                  state.connectionType == ConnectionType.mobile) {
                return const Text("Mobile");
              } else if (state is InternetDisconnected) {
                return const Text("Internet Disconnected");
              }
              return const CircularProgressIndicator();
            }),
            const Text("You have pushed this number of times"),
            const SizedBox(
              height: 10,
            ),
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                if (state.wasIncremented == true) {
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                        const SnackBar(content: Text("Incremented")));
                } else if (state.wasIncremented == false) {
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                        const SnackBar(content: Text("Decremented")));
                }
              },
              builder: (context, state) {
                return Text("${state.counterValue}");
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                    child: const Icon(Icons.remove),
                    heroTag: "btn1",
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).decrement();
                    }),
                FloatingActionButton(
                    child: const Icon(Icons.add),
                    heroTag: "btn2",
                    onPressed: () {
                      context.read<CounterCubit>().increment();
                    })
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            MaterialButton(
                color: Colors.redAccent,
                child: const Text("Second Screen"),
                onPressed: () {
                  Navigator.of(context).pushNamed("/secondScreen");
                }),
            MaterialButton(
                child: const Text("Third Screen"),
                color: Colors.greenAccent,
                onPressed: () {
                  Navigator.of(context).pushNamed("/thirdScreen");
                }),
          ],
        ),
      ),
    );
  }
}
