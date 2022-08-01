class ScrollState{
  final bool modifier;
  final bool loading;
  final int currentMax;

  ScrollState({
    required this.modifier,
    this.loading = true,
    required this.currentMax
  });
}