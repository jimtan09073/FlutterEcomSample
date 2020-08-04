import 'package:dio/dio.dart';
import 'package:ecom/widgets/future.builder.widget.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../widgets/web.appbar.dart';
import '../models/product.model.dart';
import '../services/cart.service.dart';
import '../services/product.service.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List<Product> _productList;

  @override
  void initState() {
    super.initState();
    Provider.of<ProductService>(context, listen: false).getProductList().then(
      (Response resp) {
        Provider.of<ProductService>(context, listen: false)
            .addProduct(resp.data['data']);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1200) {
          return Scaffold(
            appBar: WebAppBar(title: 'Test shop'),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      alignment: Alignment.center,
                      child: RaisedButton(
                        child: Text('call API'),
                        onPressed: () {},
                      ),
                    ),
                    // Container(
                    //   width: 1600,
                    //   height: 800,
                    //   child: FutureBuilderWidget(
                    //     futureFn: ProductService.getProductList(),
                    //     builder: _buildGrid,
                    //   ),
                    // ),

                    // Container(
                    //   width: 1600,
                    //   height: 800,
                    //   child: GridView.builder(
                    //     gridDelegate:
                    //         new SliverGridDelegateWithFixedCrossAxisCount(
                    //       crossAxisCount: 5,
                    //       mainAxisSpacing: 5,
                    //       crossAxisSpacing: 5,
                    //     ),
                    //     itemCount:
                    //         context.watch<ProductService>().productList.length,
                    //     itemBuilder: (context, index) {
                    //       return Container(
                    //         decoration: BoxDecoration(
                    //           border: Border.all(
                    //             width: 1,
                    //             color: Colors.grey[300],
                    //           ),
                    //         ),
                    //         padding: EdgeInsets.only(top: 5, bottom: 5),
                    //         child: Column(
                    //           children: [
                    //             Expanded(
                    //               child: SizedBox(
                    //                 height: 200,
                    //                 child: Image.asset(
                    //                   'assets/images/alatreon.png',
                    //                   fit: BoxFit.contain,
                    //                 ),
                    //               ),
                    //             ),
                    //             ListTile(
                    //               leading: IconButton(
                    //                 icon: Icon(Icons.add_shopping_cart),
                    //                 onPressed: () {
                    //                   Provider.of<CartService>(context,
                    //                           listen: false)
                    //                       .addItem('ab', 'ba', 12, 12, 12);
                    //                 },
                    //               ),
                    //               trailing: IconButton(
                    //                 icon: Icon(Icons.favorite),
                    //                 onPressed: () {},
                    //               ),
                    //               title: Text(
                    //                 context
                    //                     .watch<ProductService>()
                    //                     .productList[index]
                    //                     .name,
                    //                 textAlign: TextAlign.center,
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //       );
                    //     },
                    //   ),
                    // ),

                    Container(
                      width: 1600,
                      height: 800,
                      child: Consumer<ProductService>(
                        builder: (context, product, widget) {
                          return GridView.builder(
                            gridDelegate:
                                new SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 5,
                                    mainAxisSpacing: 5,
                                    crossAxisSpacing: 5),
                            itemCount: context
                                .watch<ProductService>()
                                .productList
                                .length,
                            itemBuilder: (context, index) {
                              return Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1,
                                    color: Colors.grey[300],
                                  ),
                                ),
                                padding: EdgeInsets.only(top: 5, bottom: 5),
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: SizedBox(
                                        height: 200,
                                        child: Image.asset(
                                          'assets/images/alatreon.png',
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                    ListTile(
                                      leading: IconButton(
                                        icon: Icon(Icons.add_shopping_cart),
                                        onPressed: () {
                                          Provider.of<CartService>(context,
                                                  listen: false)
                                              .addItem(
                                            product.productList[index].id,
                                            product.productList[index].name,
                                            product.productList[index].price,
                                            1,
                                          );
                                        },
                                      ),
                                      trailing: IconButton(
                                        icon: Icon(Icons.favorite),
                                        onPressed: () {},
                                      ),
                                      title: Text(
                                        product.productList[index].name,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              title: Text('Test shop'),
            ),
          );
        }
      },
    );
  }

  // Widget _buildGrid(results) {
  //   _populateData(results);
  //   return GridView.builder(
  //     gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
  //         crossAxisCount: 5, mainAxisSpacing: 5, crossAxisSpacing: 5),
  //     itemCount: _productList.length,
  //     itemBuilder: (context, index) {
  //       return Container(
  //         decoration: BoxDecoration(
  //           border: Border.all(
  //             width: 1,
  //             color: Colors.grey[300],
  //           ),
  //         ),
  //         padding: EdgeInsets.only(top: 5, bottom: 5),
  //         child: Column(
  //           children: [
  //             Expanded(
  //               child: SizedBox(
  //                 height: 200,
  //                 child: Image.asset(
  //                   'assets/images/alatreon.png',
  //                   fit: BoxFit.contain,
  //                 ),
  //               ),
  //             ),
  //             ListTile(
  //               leading: IconButton(
  //                 icon: Icon(Icons.add_shopping_cart),
  //                 onPressed: () {
  //                   print(results);
  //                 },
  //               ),
  //               trailing: IconButton(
  //                 icon: Icon(Icons.favorite),
  //                 onPressed: () {},
  //               ),
  //               title: Text(
  //                 _productList[index].name,
  //                 textAlign: TextAlign.center,
  //               ),
  //             ),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }

  // List<Product> _populateData(List<dynamic> results) {
  //   return _productList =
  //       results.map((product) => Product.fromJson(product)).toList();
  // }
}
