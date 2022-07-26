import 'package:flutter/material.dart';
import 'package:namozapp/models/xayrehson.dart';
import 'package:namozapp/providers/xayrehsonlar_provider.dart';
import 'package:provider/provider.dart';

import '../providers/xayrehson_provider.dart';

class XayrEhsonScreen extends StatefulWidget {
  const XayrEhsonScreen({Key? key}) : super(key: key);
  static const routeName = '/xayrehson-screen';

  @override
  State<XayrEhsonScreen> createState() => _XayrEhsonScreenState();
}

class _XayrEhsonScreenState extends State<XayrEhsonScreen> {
  var _init = true;
  XayrEhson _xayrEhson = XayrEhson(
      id: 'id',
      title: 'title',
      body: 'body',
      cardNumber: 'cardNumber',
      phoneNumber: 'phoneNumber',
      address: 'address',
      imageUrl: 'imageUrl');
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var xayrEhsonId = ModalRoute.of(context)!.settings.arguments;
    if (_init) {
      Provider.of<XayrEhsonProvider>(context)
          .getXayrEhson(xayrEhsonId: xayrEhsonId.toString())
          .then((xayrEhson) {
        setState(() {
          _xayrEhson = xayrEhson;
        });
      });
    }
    _init = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            _xayrEhson.title,
          ),
        ),
        body: Column(
          children: [
            Text(_xayrEhson.body),
            Text(_xayrEhson.cardNumber),
            Text(_xayrEhson.phoneNumber),
            Text(_xayrEhson.address),
            Image.network(_xayrEhson.imageUrl),
          ],
        ));
  }
}
