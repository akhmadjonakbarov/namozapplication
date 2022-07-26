import 'package:flutter/material.dart';
import 'package:namozapp/models/xayrehson.dart';
import 'package:namozapp/providers/xayrehsonlar_provider.dart';
import 'package:namozapp/screens/xayrehson_screen.dart';
import 'package:provider/provider.dart';

class XayrEhsonlarScreen extends StatefulWidget {
  const XayrEhsonlarScreen({Key? key}) : super(key: key);
  static const routeName = '/xayrehsonlar-screen';

  @override
  State<XayrEhsonlarScreen> createState() => _XayrEhsonlarScreenState();
}

class _XayrEhsonlarScreenState extends State<XayrEhsonlarScreen> {
  var _init = true;
  List<XayrEhson> _xayrEhsonlar = [];
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_init) {
      Provider.of<XayrEhsonlarProvider>(context)
          .getXayrEhsonlar()
          .then((xayrEhsonlar) {
        setState(() {
          _xayrEhsonlar = xayrEhsonlar;
        });
      });
    }
    _init = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'XayrEhson',
        ),
      ),
      body: ListView.builder(
          itemCount: _xayrEhsonlar.length,
          itemBuilder: (ctx, i) {
            var xayrehson = _xayrEhsonlar[i];
            return ChangeNotifierProvider<XayrEhson>.value(
              value: xayrehson,
              child: Card(
                child: ListTile(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      XayrEhsonScreen.routeName,
                      arguments: xayrehson.id,
                    );
                  },
                  title: Text(
                    xayrehson.title,
                  ),
                ),
              ),
            );
          }),
    );
  }
}
