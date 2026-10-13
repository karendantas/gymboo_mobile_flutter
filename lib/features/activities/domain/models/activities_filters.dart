import 'activity_category.dart';

class ActivitiesFilter {
  const ActivitiesFilter({this.category, this.from, this.to});

  final ActivityCategory? category;
  final DateTime? from;
  final DateTime? to;

  bool get isEmpty => category == null && from == null && to == null;

  @override
  bool operator ==(Object other) =>
      other is ActivitiesFilter &&
      other.category == category &&
      other.from == from &&
      other.to == to;

  @override
  int get hashCode => Object.hash(category, from, to);
}

class PageResult<T> {
  const PageResult({
    required this.items,
    required this.page,
    required this.last,
  });

  final List<T> items;
  final int page;
  final bool last;
}
