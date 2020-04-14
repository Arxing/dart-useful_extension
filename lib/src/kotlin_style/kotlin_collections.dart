class IndexedValue<T> {
  int index;
  T value;

  IndexedValue(this.index, this.value);

  @override
  String toString() {
    return "[$index]{$value}";
  }
}

extension $KotlinCollection<E> on Iterable<E> {
  int get lastIndex => this.length - 1;

  Iterable<IndexedValue<E>> withIndex() => this.toList().asMap().entries.map((entry) => IndexedValue(entry.key, entry.value));

  Iterable<E> whereNot(bool test(E element)) => this.where((element) => !test(element));

  Iterable<int> indexes() => this.withIndex().indexes();

  E elementAtOr(int index, [E defaultValue = null]) => this.length > index && index >= 0 ? this.toList()[index] : defaultValue;

  E firstOr([E defaultValue = null]) => this.elementAtOr(0, defaultValue);

  E lastOr([E defaultValue = null]) => this.elementAtOr(this.lastIndex, defaultValue);
}

extension $KotlinIndexedValueExtension<E> on Iterable<IndexedValue<E>> {
  Iterable<int> indexes() => this.map((iv) => iv.index);

  Iterable<E> values() => this.map((iv) => iv.value);
}
