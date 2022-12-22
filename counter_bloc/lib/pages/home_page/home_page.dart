import 'package:counter_bloc/bloc/counter/counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () => context.read<CounterBloc>().add(IncrementCounter()),
          ),
          FloatingActionButton(
              child: const Icon(Icons.remove),
              onPressed: () => context.read<CounterBloc>().add(DecrementCounter()),
          ),
        ],
      ),
      body: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, counterState){
          return Center(
            child: Text("${counterState.counter}"),
          );
        },
      ),
    );
  }
}
