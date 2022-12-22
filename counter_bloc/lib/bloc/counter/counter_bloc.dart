import 'package:bloc/bloc.dart';

import 'counter.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState>{
  CounterBloc() : super(const CounterState(0)){
    on<IncrementCounter>(_onIncrementCounter);
    on<DecrementCounter>(_onDecrementCounter);
  }

  Future<void> _onIncrementCounter(IncrementCounter event, Emitter<CounterState> emit) async{
    emit(CounterState(state.counter + 1));
  }

  Future<void> _onDecrementCounter(DecrementCounter event, Emitter<CounterState> emit) async{
    emit(CounterState(state.counter - 1));
  }
}