import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('pt_BR', null);
    final _mediaQuery = MediaQuery.of(context);
    final _isPortrait = _mediaQuery.orientation == Orientation.portrait;
    final _landscapeHeight = _mediaQuery.size.height * 0.15;
    final _portraitHeight = _mediaQuery.size.height * 0.2;

    final _appBarHeight = _isPortrait ? _portraitHeight : _landscapeHeight;

    return Platform.isIOS
        ? CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              middle: Text('Task App'),
              trailing: FlatButton(
                onPressed: null,
                child: Text('Adicionar'),
              ),
            ),
            child: Text('Home Page'),
          )
        : Scaffold(
            appBar: AppBar(
              bottom: PreferredSize(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              'Task App',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontFamily: 'Playfair Display',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              DateFormat.yMMMMEEEEd('pt_BR')
                                  .format(DateTime.now()),
                              style: TextStyle(
                                fontFamily: 'Playfair Display',
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  preferredSize: Size.fromHeight(_appBarHeight)),
              actions: <Widget>[
                IconButton(icon: Icon(Icons.add), onPressed: null)
              ],
              flexibleSpace: Image(
                image: AssetImage('assets/images/task.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: null,
              child: Icon(Icons.add),
            ),
            body: Text('Home Page'),
          );
  }
}
