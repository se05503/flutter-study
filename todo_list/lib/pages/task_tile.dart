import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.taskName,
    required this.isCompleted,
    required this.taskTime,
    required this.onChanged,
    required this.onDelete,
  });

  final String taskName;
  final bool isCompleted;
  final DateTime? taskTime;
  final void Function(bool?)? onChanged;
  final void Function(BuildContext)? onDelete;

  @override
  Widget build(BuildContext context) {
    String formatTime = taskTime != null
        ? DateFormat("yyyy년 MM월 dd일 HH시 mm분").format(taskTime!)
        : "날짜 없음";

    return Padding(
      padding: const EdgeInsets.only(
        left: 24.0,
        right: 24.0,
        top: 20.0,
        bottom: 0,
      ),
      child: Slidable(
        key: Key(taskName),
        endActionPane: ActionPane(
          motion: StretchMotion(),
          dismissible: DismissiblePane(onDismissed: () => onDelete!(context)),
          children: [
            SlidableAction(
              onPressed: onDelete,
              icon: Icons.delete,
              backgroundColor: Colors.red,
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: Colors.deepPurple,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Row(
            children: [
              Checkbox(
                value: isCompleted,
                onChanged: onChanged,
                activeColor: Colors.deepPurple,
                side: BorderSide(color: Colors.white, width: 1),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    taskName,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      decoration: isCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      decorationThickness: 3.0,
                      decorationColor: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(formatTime, style: TextStyle(color: Colors.white)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
