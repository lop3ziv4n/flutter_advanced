import 'dart:async';

const PRODUCTS = ['Camera', 'Keyboard', 'Speakers', 'Microphone'];

// Widgets + Streams = Reactive Flutter App
// Streams ≃ Observable en Rx
class ProductBloc {
  ProductBloc() {
    // listen: add value on stream products
    products.listen((event) => _productCount.add(event.length));
  }

  Stream<List<String>> get products async* {
    final List<String> products = [];
    for (String product in PRODUCTS) {
      await Future.delayed(const Duration(seconds: 2));
      products.add(product);

      yield products;
    }
  }

  // Controller stream value
  final StreamController<int> _productCount = StreamController<int>();

  Stream<int> get productCount => _productCount.stream;

  dispose() {
    _productCount.close();
  }
}
