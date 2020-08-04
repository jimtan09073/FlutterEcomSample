import 'package:ecom/services/cart.service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../widgets/cart.widget.dart';
import '../services/cart.service.dart';

class WebAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;

  @override
  final Size preferredSize;

  WebAppBar({Key key, @required this.title})
      : preferredSize = Size.fromHeight(200);

  @override
  _WebAppBarState createState() => _WebAppBarState();
}

class _WebAppBarState extends State<WebAppBar> {
  final _searchBoxController = TextEditingController();

  Widget build(BuildContext context) {
    var cart = context.watch<CartService>().cartList;
    return SafeArea(
      child: Container(
        height: 100,
        padding: EdgeInsets.all(10),
        color: Colors.blue[300],
        child: Row(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Image.asset('assets/images/alatreon.png'),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Text(
                      this.widget.title,
                      style: TextStyle(color: Colors.black, fontSize: 25),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: _searchBoxController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white54,
                      hintText: 'Search a way to beat me',
                      suffixIcon: Icon(FontAwesomeIcons.search),
                    ),
                    onEditingComplete: () {
                      print(_searchBoxController.text);
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Consumer<CartService>(
                    //   builder: (context, cart, widget) => CartWidget(
                    //     widget: widget,
                    //     counter: cart.cartListTotalCount,
                    //   ),
                    //   child: IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {}),
                    // ),
                    Stack(
                      children: [
                        Positioned(
                          top: 1,
                          right: 1,
                          child: Container(
                            padding: EdgeInsets.all(2.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.red),
                            constraints: BoxConstraints(
                              minWidth: 16,
                              minHeight: 16,
                            ),
                            child: Text(
                              '${context.watch<CartService>().cartListTotalCount.toString()}',
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            FontAwesomeIcons.shoppingCart,
                          ),
                          hoverColor: Colors.white,
                          splashColor: Colors.white,
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (_) => new AlertDialog(
                                title: ListTile(
                                  leading: Text('Cart'),
                                  trailing: IconButton(
                                    icon: Icon(Icons.close),
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
                                  ),
                                ),
                                content: Container(
                                  width: 500,
                                  height: 300,
                                  child: Consumer<CartService>(
                                    builder: (ctx, cart, widget) {
                                      return ListView.builder(
                                        // scrollDirection: Axis.vertical,
                                        shrinkWrap: true,
                                        itemBuilder: (ctx, index) => Container(
                                          child: ListTile(
                                            title: Text(cart.cartList.values.toList()[index].name),
                                            subtitle: Text(cart.cartList.values.toList()[index].price.toString()),
                                            trailing: Text('QTY: ${cart.cartList.values.toList()[index].quantity}'),
                                          ),
                                        ),
                                        itemCount: context.read<CartService>().cartLength
                                      );
                                    },
                                  ),
                                ),
                                actions: [
                                  FlatButton(
                                    child: Text('CLEAR CART'),
                                    onPressed: () {
                                      context.read<CartService>().clearCart();
                                    },
                                  ),
                                  FlatButton(
                                    child: Text('CHECK OUT'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
