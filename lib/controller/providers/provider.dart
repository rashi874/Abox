import 'package:abox/view/widgets/featured_screen/featured_screen.dart';
import 'package:flutter/material.dart';
import '../../view/widgets/horizontal_view/horizontal_temp.dart';
import '../../view/widgets/screehome/mainscreen.dart';
import '../../view/widgets/vertical_view/vertical_temp.dart';

class AppProvider with ChangeNotifier {
  int index = 0;
  indexfunction(indexs) {
    index = indexs;
    notifyListeners();
  }

  final screens = [
    const ScreenHome(),
    const NewModel(),
    const VerticleTemplates(),
    const FeaturedScreen(),
  ];
}
