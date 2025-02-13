extension Proiz on List<int> {
  int mulElem() {
    return reduce((value, element) => value * element);
  }
}
