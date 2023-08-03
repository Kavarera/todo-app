import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_app/model/todoModel.dart';

class ListTodoController extends GetxController {
  final listTodo = <TodoModel>[].obs;
  final box = GetStorage();

  void addItem(TodoModel item) {
    listTodo.add(item);
    _saveListTodoToStorage();
  }

  void removeItem(TodoModel item) {
    listTodo.remove(item);
    _saveListTodoToStorage();
  }

  void _saveListTodoToStorage() {
    box.write("listtodo", listTodo.map((element) => element.toJson()).toList());
  }

  @override
  void onInit() {
    super.onInit();
    _loadListTodoFromStorage();
  }

  void _loadListTodoFromStorage() {
    final data = box.read<List<dynamic>>("listtodo");
    if (data != null) {
      listTodo.addAll(data.map((e) => TodoModel.fromJson(e)));
    }
  }
}
