// ignore_for_file: use_key_in_widget_constructors, prefer_const_declarations, prefer_const_constructors, avoid_unnecessary_containers
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/drawer.dart';
import 'package:flutter_catalog/widgets/item_widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  final String name = "Codepur";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final CatalogJson =
        await rootBundle.loadString('assets/files/catalog.json');
    print(CatalogJson);
    final decodedData = jsonDecode(CatalogJson);
    print(decodedData);
    var productData = decodedData["products"];
    CatalogModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
  }

  Widget build(BuildContext context) {
    // final dummyList = List.generate(20, (index) => CatalogModel.items[0]);
    return Scaffold(
        appBar: AppBar(
          title: Text("Catalog App"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: (CatalogModel.items!=null && CatalogModel.items!.isNotEmpty) 
          ? ListView.builder(
            itemCount: CatalogModel.items?.length,
            itemBuilder: (context, index) {
              return ItemWidget(item: CatalogModel.items![index]);
            },
          )
          :
          Center(
            child: CircularProgressIndicator(),
          ),
        ),
        drawer: MyDrawer());
  }
}
