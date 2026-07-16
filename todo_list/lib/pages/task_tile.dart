import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.taskName,
    required this.isCompleted,
    required this.onChanged,
  });

  final String taskName;
  final bool isCompleted;
  final void Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 24.0,
        right: 24.0,
        top: 20.0,
        bottom: 0,
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
          ],
        ),
      ),
    );
  }
}
