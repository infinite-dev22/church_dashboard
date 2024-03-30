part of 'dashboard_bloc.dart';

enum DashboardStatus {
  initial,
  success,
  error,
  loading,
  selected,
  noData,
}

extension DashboardStatusX on DashboardStatus {
  bool get isInitial => this == DashboardStatus.initial;

  bool get isSuccess => this == DashboardStatus.success;

  bool get isError => this == DashboardStatus.error;

  bool get isLoading => this == DashboardStatus.loading;

  bool get isSelected => this == DashboardStatus.selected;
}

@immutable
class DashboardState extends Equatable {
  final List<CountModel>? groupedCount;
  final int? count;
  final int? newCount;
  final int? inactiveCount;
  final DashboardStatus status;
  final int? idSelected;

  const DashboardState({
    List<CountModel>? groupedCount,
    this.count,
    this.newCount,
    this.inactiveCount,
    this.status = DashboardStatus.initial,
    this.idSelected = 0,
  }) : groupedCount = groupedCount ?? const [];

  @override
  List<Object?> get props => [
        groupedCount,
        count,
        newCount,
        inactiveCount,
        status,
        idSelected,
      ];

  DashboardState copyWith({
    List<CountModel>? groupedCount,
    int? count,
    int? newCount,
    int? inactiveCount,
    DashboardStatus? status,
    int? idSelected,
  }) {
    return DashboardState(
      groupedCount: groupedCount ?? this.groupedCount,
      count: count ?? this.count,
      newCount: newCount ?? this.newCount,
      inactiveCount: inactiveCount ?? this.inactiveCount,
      status: status ?? this.status,
      idSelected: idSelected ?? this.idSelected,
    );
  }
}
