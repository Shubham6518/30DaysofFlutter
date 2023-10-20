import "package:flutter/material.dart";
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/home_widget.dart/add_to_cart.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      backgroundColor: MyTheme.creamColor,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: EdgeInsets.zero,
                children: [
                  "\$${catalog.price}".text.bold.xl4.make(),
                  AddToCart(catalog: catalog).wh(120, 50)
                ],
              ).p24(),
      )
,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image)
            ).h32(context),
            Expanded(
              child: VxArc(
                height: 30.0,
                arcType: VxArcType.convey,
                edge: VxEdge.top,
                child: Container(
                  color: Colors.white,
                  width: context.screenWidth,
                  child:Column(
                    children: [
                      catalog.name.text.xl4.bold.color(MyTheme.darkBluishColor).make(),
                      catalog.desc.text.xl.textStyle(context.captionStyle).make(),
                      10.heightBox,
                      "Modi explicabo totam voluptatem omnis impedit inventore itaque. Provident soluta tenetur non numquam possimus aut.".text.textStyle(context.captionStyle).make().p16(),
                    ],
                  ).py64()
                ),
              )
            )
          ],
        )
      )
    );
  }
}
