
final navigationStack = NavigationStack<int>();

class NavigationStack<T> {
  List<T> _stack = [];

  bool get isEmpty => _stack.isEmpty;

  int get totalItems => _stack.length;
  void push(T item) {
    if (_stack.isNotEmpty && _stack.last == item) {
      return;
    }
    _stack.add(item);
  }

  T pop() {
    if (_stack.isEmpty) {
      throw StateError('Cannot pop from an empty stack');
    }
    return _stack.removeLast();
  }

  T peek() {
    if (_stack.isEmpty) {
      throw StateError('Cannot peek an empty stack');
    }
    return _stack.last;
  }
}
