import 'package:ecom/services/cart.service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../models/shopping.cart.model.dart';
import '../widgets/cart.widget.dart';

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

  @override
  void dispose() {
    super.dispose();
    bloc.dispose();
  }

  Widget build(BuildContext context) {
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
                    // StreamBuilder<Object>(
                    //   stream: bloc.hasUpdate,
                    //   builder: (context, snapshot) {
                    //     if (snapshot.hasData) {
                    //       return Stack(
                    //         children: [
                    //           Positioned(
                    //             top: 2,
                    //             right: 5,
                    //             child: Text('${snapshot.data}'),
                    //           ),
                    //           IconButton(
                    //             icon: Icon(
                    //               FontAwesomeIcons.shoppingCart,
                    //             ),
                    //             hoverColor: Colors.white,
                    //             splashColor: Colors.white,
                    //             onPressed: () {
                    //               // Navigator.of(context).push(MaterialPageRoute(
                    //               //   builder: (_) => ShoppingCartPage(),
                    //               // ));
                    //             },
                    //           ),
                    //         ],
                    //       );
                    //     } else {
                    //       return IconButton(
                    //         icon: Icon(
                    //           FontAwesomeIcons.shoppingCart,
                    //           // color: Colors.white,
                    //         ),
                    //         hoverColor: Colors.white,
                    //         splashColor: Colors.white,
                    //         onPressed: () {
                    //           // Navigator.of(context).push(MaterialPageRoute(
                    //           //   builder: (_) => ShoppingCartPage(),
                    //           // ));
                    //         },
                    //       );
                    //     }
                    //   },
                    // ),

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
                          onPressed: () {},
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
