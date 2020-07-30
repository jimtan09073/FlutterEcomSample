import 'package:flutter/material.dart';

class CartWidget extends StatelessWidget {
  final Widget widget;
  final int counter;

  CartWidget({
    this.widget,
    @required this.counter
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        this.widget,
        Positioned(
          top: 2,
          right: 2,
          child: Container(
            padding: EdgeInsets.all(2.0),
            // color: Theme.of(context).accentColor,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
            ),
            constraints: BoxConstraints(
              minWidth: 16,
              minHeight: 16,
            ),
            child: Text(
              this.counter.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 10,
              ),
            ),
          ),
        ),
      ],      
    );
  }
}