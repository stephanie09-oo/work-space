import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_space/customs/TaskItem.dart';
import 'package:work_space/manage/HomeCubit.dart';
import 'package:work_space/manage/HomeState.dart';
import 'package:work_space/models/task_data_model.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  void initState() {
    super.initState();

    context.read<HomeCubit>().getTasks();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state is LoadingTasksGettingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is SuccessGettingTasksState) {
          return StreamBuilder<List<TaskDataModel>>(
            stream: state.tasks,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    '${snapshot.error}',),
                );
              }
              if (snapshot.connectionState ==
                  ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              final tasks = snapshot.data ?? [];

              if (tasks.isEmpty) {
                return Center(
                  child: Text('No tasks found'),
                );
              }
              return ListView.separated(
                itemCount: tasks.length,
                separatorBuilder: (context, index) {
                  return SizedBox(height: 10);
                },
                itemBuilder: (context, index) {
                  return Taskitem(
                    task: tasks[index],);},);
            },
          );
        }
        if (state is FailedToGettingTasksState) {
          return Center(
            child: Text(
              state.errorMessage,
            ),
          );
        }
        return SizedBox();
      },
    );
  }
}
