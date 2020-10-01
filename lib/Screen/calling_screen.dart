import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_list/modules/calling.dart';
import 'package:task_list/widget/listView.dart';

// ignore: must_be_immutable
class Calls extends StatefulWidget {
  @override
  _CallsState createState() => _CallsState();
}

class _CallsState extends State<Calls> {
  final _nameController = TextEditingController();
  final _tellHimController = TextEditingController();
  final _timeController = TextEditingController();

  List<CallPerson> _callingList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return SingleChildScrollView(
                  child: Container(
                    // height: (MediaQuery.of(context).viewInsets.bottom) * .3,
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom + 10),
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TextField(
                          decoration: InputDecoration(labelText: 'Name'),
                          textAlign: TextAlign.center,
                          controller: _nameController,
                        ),
                        TextField(
                          decoration: InputDecoration(labelText: 'Tell him'),
                          controller: _tellHimController,
                          textAlign: TextAlign.center,
                        ),
                        TextField(
                          decoration: InputDecoration(labelText: ' time'),
                          controller: _timeController,
                          textAlign: TextAlign.center,
                        ),
                        Container(
                          height: 10,
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: (MediaQuery.of(context).size.width) * 0.6),
                          child: FlatButton(
                            onPressed: () {
                              setState(() {
                                if (_nameController.text.isEmpty) {
                                  return;
                                } else {
                                  _callingList.add(CallPerson(
                                    name: _nameController.text,
                                    description: _tellHimController.text,
                                    time: _timeController.text,
                                  ));

                                  _timeController.clear();
                                  _tellHimController.clear();
                                  _nameController.clear();
                                  Navigator.of(context).pop();
                                }
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.all(13),
                              width: 100,
                              height: 50,
                              color: Colors.green,
                              child: Text(
                                'Add',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              });
        },
        child: Icon(
          Icons.add,
          color: Colors.white70,
        ),
      ),
      body: Provider.of<BodyBuilder>(context)
          .buildListView(_callingList, 'Tell him'),
    );
  }
}
