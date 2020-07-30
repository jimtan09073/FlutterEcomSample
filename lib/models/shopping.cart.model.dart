import 'dart:async';

class Bloc {
  final _cartStateController = StreamController<int>();

  changeState(int val) {
    _cartStateController.sink.add(val);
  }

  get hasUpdate => _cartStateController.stream;

  dispose() {
    _cartStateController.close();
  }
}

final bloc = Bloc();