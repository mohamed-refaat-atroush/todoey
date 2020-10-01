import 'package:flutter/material.dart';
import 'package:task_list/modules/Product.dart';
import 'package:task_list/widget/floatingButtonShopping.dart';
import 'package:task_list/widget/listView.dart';
import 'package:provider/provider.dart';

// ignore: camel_case_types
class Product_Screen extends StatefulWidget {
  @override
  _Product_ScreenState createState() => _Product_ScreenState();
}

// ignore: camel_case_types
class _Product_ScreenState extends State<Product_Screen> {
  final _nameController = TextEditingController();

  final _amountController = TextEditingController();

  List<Product> _productList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Provider.of<Fbloating>(context)
          .buildFloatingActionButton(context,
              fsName: 'product',
              fsControll: _nameController,
              scName: 'amount',
              scControll: _amountController,
              listy: _productList),
      body: Provider.of<BodyBuilder>(context).listViewShopping(_productList),
    );
  }
}
