import 'package:flutter/material.dart';
import 'package:sample/screens/favorite_screen.dart';
import 'package:sample/screens/home_screen.dart';

enum BottomType { home, favorite }

extension BottomTypeExt on BottomType {
  String get title {
    switch (this) {
      case BottomType.home:
        return 'Home';
      case BottomType.favorite:
        return 'Favorite';
      default:
        return '';
    }
  }

  IconData get icon {
    switch (this) {
      case BottomType.home:
        return Icons.home;
      case BottomType.favorite:
        return Icons.favorite;
      default:
        return Icons.home;
    }
  }

  int get index {
    switch (this) {
      case BottomType.home:
        return 0;
      case BottomType.favorite:
        return 1;
      default:
        return 0;
    }
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  BottomType bottomType = BottomType.home;
  List<Widget> widgets = const [
    HomeScreen(),
    FavoriteScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgets[bottomType.index],
      bottomNavigationBar: BottomNavigationBar(
        items: BottomType.values.map(_buildBottomItem).toList(),
        currentIndex: bottomType.index,
        onTap: (index) {
          switch (index) {
            case 0:
              setState(() {
                bottomType = BottomType.home;
              });
              break;
            case 1:
              setState(() {
                bottomType = BottomType.favorite;
              });
              break;
            default:
          }
        },
      ),
    );
  }

  BottomNavigationBarItem _buildBottomItem(BottomType type) {
    return BottomNavigationBarItem(
      icon: Icon(type.icon),
      label: type.title,
    );
  }
}
