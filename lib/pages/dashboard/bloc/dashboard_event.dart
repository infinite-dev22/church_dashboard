part of 'dashboard_bloc.dart';

@immutable
abstract class DashboardEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetCountAll extends DashboardEvent {}

class GetCountAllByDateJoined extends DashboardEvent {}

class GetCountAllInactive extends DashboardEvent {}

class GetCountAllNew extends DashboardEvent {}
