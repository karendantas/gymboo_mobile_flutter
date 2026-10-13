import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gymboo_app/features/activities/data/activity_repository.dart';
import 'package:gymboo_app/features/activities/domain/models/activities_filters.dart';
import 'package:gymboo_app/features/activities/domain/models/activity.dart';

import 'activities_filter_controller.dart';

class ActivitiesListState {
  const ActivitiesListState({
    required this.items,
    required this.filter,
    required this.page,
    required this.hasMore,
    this.isLoadingMore = false,
  });

  final List<Activity> items;
  final ActivitiesFilter filter;
  final int page;
  final bool hasMore;
  final bool isLoadingMore;

  ActivitiesListState copyWith({
    List<Activity>? items,
    int? page,
    bool? hasMore,
    bool? isLoadingMore,
  }) => ActivitiesListState(
    items: items ?? this.items,
    filter: filter,
    page: page ?? this.page,
    hasMore: hasMore ?? this.hasMore,
    isLoadingMore: isLoadingMore ?? this.isLoadingMore,
  );
}

class ActivitiesListController extends AsyncNotifier<ActivitiesListState> {
  static const _pageSize = 10;

  @override
  Future<ActivitiesListState> build() async {
    final filter = ref.watch(activitiesFilterProvider);
    final result = await ref
        .read(activityRepositoryProvider)
        .search(filter: filter, page: 0, size: _pageSize);

    return ActivitiesListState(
      items: result.items,
      filter: filter,
      page: 0,
      hasMore: !result.last,
    );
  }

  Future<void> loadMore() async {
    final current = state.value;
    if (current == null || !current.hasMore || current.isLoadingMore) return;

    state = AsyncData(current.copyWith(isLoadingMore: true));

    try {
      final next = await ref
          .read(activityRepositoryProvider)
          .search(
            filter: current.filter,
            page: current.page + 1,
            size: _pageSize,
          );
      if (ref.read(activitiesFilterProvider) != current.filter) return;

      state = AsyncData(
        current.copyWith(
          items: [...current.items, ...next.items],
          page: current.page + 1,
          hasMore: !next.last,
          isLoadingMore: false,
        ),
      );
    } catch (_) {
      state = AsyncData(current.copyWith(isLoadingMore: false));
    }
  }
}

final activitiesListControllerProvider =
    AsyncNotifierProvider<ActivitiesListController, ActivitiesListState>(
      ActivitiesListController.new,
    );
