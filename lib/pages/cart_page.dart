import "package:flutter/material.dart";
import "package:flutter_catalog/core/store.dart";
import "package:flutter_catalog/models/cart.dart";
import "package:flutter_catalog/widgets/themes.dart";
import "package:velocity_x/velocity_x.dart";

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.make(),
      ),
      body: Column(children: [
        _CartList().p32().expand(),
        Divider(),
        CartTotal(),
      ]),
    );
  }
}

class CartTotal extends StatelessWidget {
    final CartModel _cart = (VxState.store as MyStore).cart;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$${_cart.totalPrice}"
              .text
              .xl5
              .color(MyTheme.darkBluishColor)
              .make(),
          20.widthBox,
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: "Buying not supported yet.".text.make()));
            },
            style: ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll(MyTheme.darkBluishColor),
            ),
            child: "Buy".text.bold.white.make(),
          ).w32(context)
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  final CartModel _cart = (VxState.store as MyStore).cart;
  @override
  Widget build(BuildContext context) {
    return _cart.items.isEmpty
        ? "Nothing to show"
            .text
            .xl3
            .bold
            .color(MyTheme.darkBluishColor)
            .makeCentered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
              leading: Icon(Icons.done),
              trailing: IconButton(
                onPressed: () {
                  _cart.remove(_cart.items[index]);
                },
                icon: Icon(Icons.remove_circle_outline),
              ),
              title: _cart.items[index].name.text.make(),
            ),
          );
  }
}
