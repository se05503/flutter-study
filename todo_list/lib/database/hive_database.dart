import 'package:hive/hive.dart';
import 'package:todo/constants.dart';

class HiveDatabase {
  List todoTask = [];
  final _dataBox = Hive.box(AppConstants.dbName);

  void initData() {
    todoTask = [
      ["첫 할일을 작성해보세요", false, DateTime.now()],
    ];
  }

  void readData() {
    todoTask = _dataBox.get(AppConstants.dbTodoKey);
  }

  void updateData() {
    _dataBox.put(AppConstants.dbTodoKey, todoTask);
  }
}
