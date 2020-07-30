import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class FutureBuilderWidget extends StatefulWidget {
  final Future<dynamic> futureFn;
  final dynamic builder;
  final Text notFoundMsg;

  FutureBuilderWidget({this.futureFn, this.builder, this.notFoundMsg});

  @override
  _FutureBuilderWidgetState createState() => _FutureBuilderWidgetState();
}

class _FutureBuilderWidgetState extends State<FutureBuilderWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.futureFn,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.active:
          case ConnectionState.waiting:
            return Scaffold(
              body: Center(
                child: Container(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).primaryColor,
                    ),
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  ),
                ),
              ),
            );
          case ConnectionState.done:
            if (snapshot.hasError) {
              DioError error = snapshot.error;
              if (error.response != null && error.response.statusCode == 404) {
                return Center(
                  child: widget.notFoundMsg,
                );
              } else if (error.type == DioErrorType.CONNECT_TIMEOUT) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.error,
                        color: Color.fromRGBO(255, 255, 255, .5),
                        size: 50,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Unable to fetch your data due to some issue,\nPlease try again later',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.signal_wifi_off,
                        color: Color.fromRGBO(255, 255, 255, .5),
                        size: 50,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'No Network Connection',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                );
              }
            } else {
              return widget.builder(snapshot.data.data['data']);
            }
            break;
          default:
            return Scaffold(body: Center(child: Container()));
        }
      },
    );
  }
}
