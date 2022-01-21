import 'package:block_example_two/logic/cubit/counter_cubit.dart';
import 'package:block_example_two/logic/cubit/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThirdScreen extends StatefulWidget {
  final String title;
  final Color color;

  const ThirdScreen({Key? key, required this.title, required this.color})
      : super(key: key);

  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.color,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("You have pushed this number of times"),
            const SizedBox(
              height: 10,
            ),
            BlocBuilder<CounterCubit, CounterState>(
              builder: (context, state) {
                return Text("${state.counterValue}");
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                    backgroundColor: widget.color,
                    child: const Icon(Icons.remove),
                    heroTag: "btn1",
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).decrement();
                    }),
                FloatingActionButton(
                    backgroundColor: widget.color,
                    child: const Icon(Icons.add),
                    heroTag: "btn2",
                    onPressed: () {
                      context.read<CounterCubit>().increment();
                    })
              ],
            ),
          ],
        ),
      ),
    );
  }
}
