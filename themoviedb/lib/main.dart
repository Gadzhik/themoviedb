import 'package:flutter/material.dart';
import 'package:themoviedb/Theme/app_colors.dart';
import 'package:themoviedb/widgets/auth/auth_widget.dart';
import 'package:themoviedb/widgets/auth/main_screen/main_screen_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.mainDarkBlue,
        ),
        // Add AppBar color
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: AppColors.mainDarkBlue,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
        ),
      ),

      // Указываем маршруты которые есть в приложении, ниже перечисляем все существующие экраны(routes) с именами
      routes: {
        '/auth': (context) => AuthWidget(),
        '/main_screen': (context) => MainScreenWidget(),
      },
      // При запуске приложения ищет марштуры в routes, если не нашли, то идем в onGenerateRoute (см. ниже)
      initialRoute: '/auth',

      // Замыкание, которое получает в себя некий RouteSettings (настройки роута) и возвращает MaterialPageRoute (даже если роут не задан в routes (см. выше))
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute<void>(builder: (context) {
          // Возвращается новый экран с текстом
          return Scaffold(
            body: Center(
              child: Text('Navigation Error!'),
            ),
          );
        });
      },
    );
  }
}
