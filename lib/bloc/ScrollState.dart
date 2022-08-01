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
// class UpdatedScrollState extends ScrollState{
//   final bool modifier;
//   final bool loading;
//   final int currentMax;
//   UpdatedScrollState({
//     this.modifier = true,
//     this.loading = true,
//     required this.currentMax
//     });

// }