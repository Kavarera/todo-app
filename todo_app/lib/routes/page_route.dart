import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:todo_app/routes/route_name.dart';

import '../page/list_todo_page.dart';

class ListPageRoute {
  static final pages = [
    GetPage(
      name: RouteName.home,
      page: () => ListTodoPage(),
    ),
  ];
}
