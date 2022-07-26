// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:namozapp/providers/categorydarsliklar_provider.dart';
import '../screens/categorydarslik/cdarslik_screen.dart';
import 'package:provider/provider.dart';

import '../models/categorydarsliklar.dart';

class CategoryDarsliklarScreen extends StatefulWidget {
  const CategoryDarsliklarScreen({Key? key}) : super(key: key);
  static const routeName = '/categorydarsliklar-screen';

  @override
  State<CategoryDarsliklarScreen> createState() =>
      _CategoryDarsliklarScreenState();
}

class _CategoryDarsliklarScreenState extends State<CategoryDarsliklarScreen> {
  late var _categoryId;
  var _init = true;
  List<CategoryDarsliklar> _categoryDarsliklar = [];
  @override
  void didChangeDependencies() {
    var categoryId = ModalRoute.of(context)!.settings.arguments;

    setState(() {
      _categoryId = categoryId.toString();
    });
    if (_init) {
      Provider.of<CategoryDarsliklarProvider>(context)
          .getCategoryDarsliklar(
        categoryId: categoryId.toString(),
      )
          .then((categoryDarsliklar) {
        setState(() {
          _categoryDarsliklar = categoryDarsliklar;
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
        title: const Text('Darsliklar'),
      ),
      body: ListView.builder(
        itemCount: _categoryDarsliklar.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              onTap: () {
                Navigator.of(context).pushNamed(
                  CDarslikScreen.routeName,
                  arguments: {
                    'categoryId': _categoryId,
                    'darslikId': _categoryDarsliklar[index].id,
                  },
                );
              },
              title: Text(_categoryDarsliklar[index].title),
            ),
          );
        },
      ),
    );
  }
}
