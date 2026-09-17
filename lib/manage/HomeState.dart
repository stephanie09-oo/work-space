import 'package:work_space/models/task_data_model.dart';

abstract class HomeState {}

class HomeInitialState extends HomeState {}

class InitialTaskCreationState extends HomeState {}

class LoadingTaskCreationState extends HomeState {}

class SuccessCreationTaskState extends HomeState {}

class FailedToCreateTaskState extends HomeState {
  final String errorMessage;

  FailedToCreateTaskState({required this.errorMessage});
}

class InitialTasksGettingState extends HomeState {}

class LoadingTasksGettingState extends HomeState {}

class SuccessGettingTasksState extends HomeState {
  final Stream<List<TaskDataModel>> tasks;

  SuccessGettingTasksState({required this.tasks});
}

class FailedToGettingTasksState extends HomeState {
  final String errorMessage;

  FailedToGettingTasksState({required this.errorMessage});
}

class LoadingTaskUpdateState extends HomeState {}

class SuccessTaskUpdateState extends HomeState {}

class FailedToUpdateTaskState extends HomeState {
  final String errorMessage;

  FailedToUpdateTaskState({required this.errorMessage});
}

class LoadingTaskDeleteState extends HomeState {}

class SuccessTaskDeleteState extends HomeState {}

class FailedToDeleteTaskState extends HomeState {
  final String errorMessage;

  FailedToDeleteTaskState({required this.errorMessage});
}
