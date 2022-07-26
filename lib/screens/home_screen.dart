import 'package:flutter/material.dart';

import 'package:namozapp/screens/categoriesdarslik_screen.dart';
import 'package:namozapp/screens/quran_screen.dart';
import 'package:namozapp/screens/xayrehsonlar_screen.dart';
import 'package:namozapp/widgets/category_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const routeName = '/home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void openQuranBook(BuildContext context) {
    Navigator.of(context).pushNamed(QuranScreen.routeName);
  }

  void gotoNextPage(BuildContext context) {
    Navigator.of(context).pushNamed(CategoriesDarslikScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Mening Jannatim!'),
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(5),
        crossAxisCount: 3,
        children: <Widget>[
          InkWell(
            onTap: () {},
            child: const CategoryItem(
              title: 'Quran',
              imageURL: 'assets/images/quran.png',
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context)
                  .pushNamed(CategoriesDarslikScreen.routeName);
            },
            child: const CategoryItem(
              title: 'Darsliklar',
              imageURL: 'assets/images/books.png',
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(XayrEhsonlarScreen.routeName);
            },
            child: const CategoryItem(
              imageURL: 'assets/images/dua.png',
              title: 'XayrEhson',
            ),
          )
        ],
      ),
    );
  }
}
