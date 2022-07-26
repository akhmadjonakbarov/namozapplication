import 'package:flutter/material.dart';
import 'package:namozapp/models/categoriesdarslik.dart';
import 'package:provider/provider.dart';

import '../providers/categoriesdarslik_provider.dart';
import './categorydarsliklar_screen.dart';

class CategoriesDarslikScreen extends StatefulWidget {
  const CategoriesDarslikScreen({Key? key}) : super(key: key);
  static const routeName = '/categorydarslik-screen';

  @override
  State<CategoriesDarslikScreen> createState() =>
      _CategoriesDarslikScreenState();
}

class _CategoriesDarslikScreenState extends State<CategoriesDarslikScreen> {
  List<CategoriesDarslik> _categoriesDarslik = [];
  var _init = true;
  @override
  void didChangeDependencies() {
    if (_init) {
      Provider.of<CategoriesDarslikProvider>(context, listen: false)
          .getCategoriesDarslik()
          .then((categoriesDarslik) {
        setState(() {
          _categoriesDarslik = categoriesDarslik;
        });
      });
    }
    _init = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Darsliklar'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(0),
        itemBuilder: (ctx, i) {
          var category = _categoriesDarslik[i];
          return ChangeNotifierProvider<CategoriesDarslik>.value(
            value: category,
            child: const CategoriesDarslikItem(),
          );
        },
        itemCount: _categoriesDarslik.length,
      ),
    );
  }
}

class CategoriesDarslikItem extends StatelessWidget {
  const CategoriesDarslikItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var categoryDarsliklar = Provider.of<CategoriesDarslik>(context);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2),
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 2),
        child: InkWell(
          splashColor: Theme.of(context).primaryColor.withOpacity(0.5),
          onTap: () {
            Navigator.of(context).pushNamed(
              CategoryDarsliklarScreen.routeName,
              arguments: categoryDarsliklar.id,
            );
          },
          child: ListTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.red,
            ),
            title: Text(
              categoryDarsliklar.name,
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
