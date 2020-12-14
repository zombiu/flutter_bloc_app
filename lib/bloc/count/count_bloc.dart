import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'count_event.dart';

part 'count_state.dart';

class CountBloc extends Bloc<CountEvent, CountState> {
  CountBloc() : super(CountInitial(0));

  @override
  Stream<CountState> mapEventToState(
    CountEvent event,
  ) async* {
    if (event is InitEvent) {
      yield await init();
    } else if (event is AddEvent) {
      yield CountState(state.count + 1);
    } else if (event is SubtractEvent) {
      int count = state.count - 1;
      if (count >= 0) {
        yield CountState(count);
      } else {
        print("-->>不能再减了");
      }
    }
  }

  ///初始化操作,在网络请求的情况下,需要使用如此方法同步数据
  ///用来处理 需要耗时的初始化场景
  Future<CountState> init() async {
    //执行网络等 耗时操作时
    return CountState(0);
  }
}
