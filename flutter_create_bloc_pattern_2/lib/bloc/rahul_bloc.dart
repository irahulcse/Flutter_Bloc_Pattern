import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'rahul_event.dart';
part 'rahul_state.dart';

class RahulBloc extends Bloc<RahulEvent, RahulState> {
  @override
  RahulState get initialState => RahulInitial();

  @override
  Stream<RahulState> mapEventToState(
    RahulEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
