import 'dart:async';

import 'dart:math';

void main(List<String> args) async {
  final card = Card();
  final invoice = Invoice();
  final invoice2 = Invoice2();
  card.setListener(invoice);
  card.setListener(invoice2);
  card.updateCard();
  card.updateCard();
}

abstract class Listener {
  void updateInvoice(int count) {}
}

class Invoice implements Listener {
  int _count = 0;

  @override
  void updateInvoice(int count) {
    _count = _count + count;
    print('Invoice: $_count');
  }
}

class Invoice2 implements Listener {
  int _count = 0;

  @override
  void updateInvoice(int count) {
    _count = _count + count;
    print('Invoice2: $_count');
  }
}

class Card {
  final List<Listener> _listeners = [];
  setListener(Listener listener) {
    _listeners.add(listener);
  }

  void updateCard() {
    print('updateCard');
    notifyListener();
  }

  void notifyListener() {
    for (var item in _listeners) {
      item.updateInvoice(1);
    }
  }
}
