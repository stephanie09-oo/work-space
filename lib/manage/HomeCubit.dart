import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_space/manage/HomeState.dart';
import 'package:work_space/models/task_data_model.dart';
import 'package:work_space/services/firebase_services.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  final FirebaseServices firebase = FirebaseServices();

  Future<void> createTask({
    required TaskDataModel task,
  }) async {
    emit(InitialTaskCreationState());
    try {
      emit(LoadingTaskCreationState());
      await firebase.createTask(task);
      emit(SuccessCreationTaskState());
      getTasks();
    } catch (e) {
      emit(
        FailedToCreateTaskState(
          errorMessage: e.toString(),),);
    }
  }
  Stream<List<TaskDataModel>> getTasks() {
    emit(InitialTasksGettingState());
    try {
      emit(LoadingTasksGettingState());
      final Stream<List<TaskDataModel>> tasks =
      firebase.getTasks();
      emit(
        SuccessGettingTasksState(
          tasks: tasks,),);
      return tasks;
    } catch (e) {
      emit(
        FailedToGettingTasksState(
          errorMessage: e.toString(),),);
      return Stream.value([]);
    }
  }
  Future<void> updateTask({
    required TaskDataModel task,
  }) async {
    try {
      emit(LoadingTaskUpdateState());
      await firebase.updateTask(task);
      emit(SuccessTaskUpdateState());
      getTasks();
    } catch (e) {
      emit(
        FailedToUpdateTaskState(
          errorMessage: e.toString(),
        ),
      );
    }
  }

  Future<void> deleteTask({
    required String taskId,
  }) async {
    try {
      emit(LoadingTaskDeleteState());
      await firebase.deleteTask(taskId);
      emit(SuccessTaskDeleteState());
      getTasks();
    } catch (e) {
      emit(
        FailedToDeleteTaskState(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
