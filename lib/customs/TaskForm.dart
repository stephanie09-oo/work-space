import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_space/functions/show_success_dialog.dart';
import 'package:work_space/manage/HomeCubit.dart';
import 'package:work_space/manage/HomeState.dart';

import 'package:work_space/models/task_data_model.dart';

class TaskForm extends StatefulWidget {
  const TaskForm({super.key});

  @override
  State<TaskForm> createState() => _TaskFormState();
}
class _TaskFormState extends State<TaskForm> {
  final TextEditingController _titleController =
  TextEditingController();

  final TextEditingController _descriptionController =
  TextEditingController();
  DateTime selectedDate = DateTime.now();
  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is LoadingTaskCreationState) {
        }
        if (state is SuccessCreationTaskState) {
          Navigator.pop(context);
          WidgetsBinding.instance.addPostFrameCallback((_) {
            showSuccessDialog(
              context: context,
              successMessage: 'Task Created Successfully',
            );
          });
        }
        if (state is FailedToCreateTaskState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),),);
        }
      },
      builder: (context, state) {
        return Form(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _titleController,
                decoration:InputDecoration(
                  hintText: 'eg: Meeting with client',
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  hintText: 'Description',
                ),),
               SizedBox(height: 10),
              CalendarDatePicker(
                initialDate: selectedDate,
                firstDate: DateTime.now(),
                lastDate: DateTime(2030, DateTime.august),
                onDateChanged: (dateTime) {
                  setState(() {
                    selectedDate = dateTime;
                  });
                },
              ),
               SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  if (_titleController.text.trim().isEmpty) {
                    return;
                  }
                  final task = TaskDataModel(
                    title: _titleController.text.trim(),
                    description: _descriptionController.text.trim(),
                    dateTime: selectedDate,
                  );
                  context.read<HomeCubit>().createTask(
                    task: task,
                  );
                },
                child:  Text('Create Task'),
              ),
            ],
          ),
        );
      },
    );
  }
}
