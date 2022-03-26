import 'package:flutter/material.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({Key? key}) : super(key: key);

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  // Переменная для хранения элементов BottomNavigationBar
  int _selectedTab = 0;
  // Widgets array
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'News',
    ),
    Text(
      'Movies',
    ),
    Text(
      'Serials',
    ),
  ];

  // Функция вызывается в момент выбора вкладки
  void onSelectTab(int index) {
    // Обрабатываем уже выделенную вкладку
    if (_selectedTab == index) return;
    // Обновляем состояние
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TMDB'),
      ),
      // Отображается на экране
      body: Center(
        child: _widgetOptions[_selectedTab],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: 'Movies',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tv),
            label: 'Serials',
          ),
        ],
        // Метод для отслеживания нажатий элементов BottomNavigationBar
        onTap: onSelectTab,
      ),
    );
  }
}
