import 'dart:io';

import '../adaptative/adaptative_button.dart';
import '../widgets/list_task.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import '../models/task.dart';
import './new_task_dialog.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  final List<Task> _listTask = [
    Task('Compras', 'Ir ao supermercado e comprar mantimentos', false),
    Task('Outra Tarefa 1', 'Descrição que detalha a tarefa Outra Tarefa 1',
        false),
    Task('Outra Tarefa 2', 'Descrição que detalha a tarefa Outra Tarefa 1',
        false),
    Task('Outra Tarefa 3', 'Descrição que detalha a tarefa Outra Tarefa 1',
        false),
    Task('Outra Tarefa 4', 'Descrição que detalha a tarefa Outra Tarefa 1',
        false),
    Task('Outra Tarefa 5', 'Descrição que detalha a tarefa Outra Tarefa 1',
        false),
    Task('Outra Tarefa 6', 'Descrição que detalha a tarefa Outra Tarefa 1',
        false),
    Task('Outra Tarefa 7', 'Descrição que detalha a tarefa Outra Tarefa 1',
        false),
    Task('Outra Tarefa 8', 'Descrição que detalha a tarefa Outra Tarefa 1',
        false),
    Task('Outra Tarefa 9', 'Descrição que detalha a tarefa Outra Tarefa 1',
        false),
  ];

  void _handleSwtichChange(int index, bool value) {
    setState(() {
      _listTask[index].finished = value;
    });
  }

  void _saveTask(Task task) {
    setState(() {
      _listTask.add(task);
    });
  }

  void _removeItem(int index) {
    setState(() {
      _listTask.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('pt_BR', null);
    final _mediaQuery = MediaQuery.of(context);
    final _isPortrait = _mediaQuery.orientation == Orientation.portrait;
    final _landscapeHeight = _mediaQuery.size.height * 0.15;
    final _portraitHeight = _mediaQuery.size.height * 0.2;

    final _appBarHeight = _isPortrait ? _portraitHeight : _landscapeHeight;

    _handleAddPress() {
      showDialog(
          context: context,
          builder: (_) {
            return NewTaskDialog(_saveTask);
          });
    }

    return Platform.isIOS
        ? CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              middle: Text('Task App'),
              trailing: AdaptativeButton(
                text: 'Adicionar',
                callback: _handleAddPress,
                padding: 0.0,
              ),
              // trailing: CupertinoButton(
              //   onPressed: _handleAddPress,
              //   child: Text('Adicionar'),
              //   padding: EdgeInsets.all(0),
              // ),
            ),
            child: ListTask(
              _listTask,
              _handleSwtichChange,
              _isPortrait,
              _removeItem,
            ),
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
                IconButton(icon: Icon(Icons.add), onPressed: _handleAddPress)
              ],
              flexibleSpace: Image(
                image: AssetImage('assets/images/task.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: _handleAddPress,
              child: Icon(Icons.add),
            ),
            body: ListTask(
              _listTask,
              _handleSwtichChange,
              _isPortrait,
              _removeItem,
            ),
          );
  }
}
