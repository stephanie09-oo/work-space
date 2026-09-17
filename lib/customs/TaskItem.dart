import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:work_space/manage/HomeCubit.dart';
import 'package:work_space/models/task_data_model.dart';
import 'package:work_space/style/AppColors.dart';
import 'package:work_space/style/AssetsManager.dart';
import 'package:work_space/style/units.dart';

class Taskitem extends StatefulWidget {
  final TaskDataModel task;

  const Taskitem({super.key, required this.task});
  @override
  State<Taskitem> createState() => _TaskitemState();
}
class _TaskitemState extends State<Taskitem> {
  bool isChecked = false;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(40),
      child: Stack(
        children: [
          Container(
            height: Units.getHeight(context: context, widgetheight: 150),
            decoration: BoxDecoration(
              color: AppColors.PrimaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 40),
            child: SizedBox(
              height: Units.getHeight(context: context, widgetheight: 150),
              child: Card(
                margin: EdgeInsets.zero,
                shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.zero,
                    bottom: Radius.circular(10),
                  ),
                ),
                color: AppColors.whiteColor,
                child: Column(
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(AssetsManger.addIcon),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            widget.task.title,
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                          showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                             title: Text('Update Task'),
                              content: Column(
                               mainAxisSize: MainAxisSize.min,
                               children: [
                                TextField(
                                 controller: titleController,
                                 decoration: InputDecoration(
                                    hintText: 'Title',
                                  ),),
                                  SizedBox(height: 10),
                              TextField(
                                controller: descriptionController,
                                decoration: InputDecoration(
                                 hintText: 'Description'),),],),
                                  actions: [
                                  TextButton(
                                   onPressed: () {
                                   Navigator.pop(context);},
                                      child: Text('Cancel'),),
                              TextButton(
                                onPressed: () {widget.task.title = titleController.text.trim();
                                 widget.task.description =descriptionController.text.trim();
                                  context.read<HomeCubit>().updateTask(
                                  task: widget.task,);

                                   Navigator.pop(context);
                                   },
                                child: Text('Update')),],);},);},
                          icon: Icon(Icons.edit, color:AppColors.PrimaryColor),
                        ),
                        IconButton(
                          onPressed: () {
                            context.read<HomeCubit>().deleteTask(
                              taskId: widget.task.id!,
                            );
                          },
                          icon: Icon(Icons.delete, color: Colors.red),
                        ),
                      ],
                    ),
                    Divider(endIndent: 30, indent: 1),
                    Row(
                      children: [
                        Checkbox(
                          value: isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value ?? false;
                            });
                          },
                        ),
                        Expanded(
                          child: Text(
                            widget.task.description,
                            style: TextStyle(color: Colors.black54),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      _formatDate(widget.task.dateTime),
                      style: TextStyle(color: Colors.black38),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }
}
