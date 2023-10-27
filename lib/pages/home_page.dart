// ignore_for_file: use_key_in_widget_constructors, prefer_const_declarations, prefer_const_constructors, avoid_unnecessary_containers
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/models/cart.dart';
import 'dart:convert';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:flutter_catalog/widgets/home_widget.dart/catalog_header.dart';
import 'package:flutter_catalog/widgets/home_widget.dart/catalog_list.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  final String name = "Codepur";

  final url = "https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";

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
    // final response = await http.get(Uri.parse(url));
    // final CatalogJson = response.body;
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
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      floatingActionButton: VxConsumer(
        mutations: {RemoveMutation, AddMutation},
        builder: (context, store, status) => FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
          child: Icon(CupertinoIcons.cart),
          backgroundColor: MyTheme.darkBluishColor,
        ).badge(
            color: Vx.pink200,
            size: 22,
            count: _cart.items.length,
            textStyle:
                TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      ),
      body: SafeArea(
        child: Container(
          padding: Vx.m16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatalogHeader(),
              if (CatalogModel.items != null)
                CatalogList().py16().expand()
              else
                CircularProgressIndicator().centered().expand(),
              BottomAppBar(
                shape: CircularNotchedRectangle(),
                color: MyTheme.creamColor,
              ).h1(context)
            ],
          ),
        ),
      ),
    );
  }
}
