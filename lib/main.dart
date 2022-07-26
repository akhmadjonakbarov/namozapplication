import 'package:flutter/material.dart';
import 'package:namozapp/providers/categoriesdarslik_provider.dart';
import 'package:namozapp/providers/categorydarslik_provider.dart';
import 'package:namozapp/providers/categorydarsliklar_provider.dart';
import 'package:namozapp/providers/xayrehson_provider.dart';
import 'package:namozapp/providers/xayrehsonlar_provider.dart';
import 'package:namozapp/screens/categoriesdarslik_screen.dart';
import 'package:namozapp/screens/home_screen.dart';
import 'package:namozapp/screens/quran_screen.dart';
import 'package:namozapp/screens/xayrehson_screen.dart';
import 'package:namozapp/screens/xayrehsonlar_screen.dart';
import 'package:namozapp/styles/namozapp_theme.dart';
import 'package:provider/provider.dart';

import './screens/categorydarsliklar_screen.dart';
import './screens/categorydarslik/cdarslik_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final NamozAppTheme _namozAppTheme = NamozAppTheme();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: CategoriesDarslikProvider(),
        ),
        ChangeNotifierProvider.value(
          value: CategoryDarsliklarProvider(),
        ),
        ChangeNotifierProvider.value(
          value: CategoryDarslikProvider(),
        ),
        ChangeNotifierProvider.value(
          value: XayrEhsonlarProvider(),
        ),
        ChangeNotifierProvider.value(
          value: XayrEhsonProvider(),
        )
      ],
      child: MaterialApp(
        theme: _namozAppTheme.getTheme(),
        title: 'Namoz App',
        initialRoute: HomeScreen.routeName,
        routes: {
          HomeScreen.routeName: (ctx) => const HomeScreen(),
          QuranScreen.routeName: (ctx) => const QuranScreen(),
          CategoriesDarslikScreen.routeName: (ctx) =>
              const CategoriesDarslikScreen(),
          CategoryDarsliklarScreen.routeName: (ctx) =>
              const CategoryDarsliklarScreen(),
          CDarslikScreen.routeName: (ctx) => const CDarslikScreen(),
          XayrEhsonlarScreen.routeName: (ctx) => const XayrEhsonlarScreen(),
          XayrEhsonScreen.routeName: (ctx) => const XayrEhsonScreen()
        },
      ),
    );
  }
}
