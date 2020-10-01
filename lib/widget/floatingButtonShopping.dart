import 'package:flutter/material.dart';
import 'package:task_list/modules/Product.dart';

class Fbloating with ChangeNotifier {
  FloatingActionButton buildFloatingActionButton(
    BuildContext context, {
    String fsName,
    fsControll,
    String scName,
    scControll,
    List listy,
  }) {
    return FloatingActionButton(
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
                        decoration: InputDecoration(labelText: '$fsName'),
                        textAlign: TextAlign.center,
                        controller: fsControll,
                      ),
                      TextField(
                        decoration: InputDecoration(labelText: ' $scName'),
                        controller: scControll,
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
                            if (fsControll.text.isEmpty) {
                              return;
                            } else {
                              final newProduct = Product(
                                  name: fsControll.text,
                                  amount: fsControll.text);
                              listy.add(newProduct);

                              fsControll.clear();

                              scControll.clear();
                              Navigator.of(context).pop();
                              notifyListeners();
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.all(13),
                            width: 100,
                            height: 50,
                            color: Colors.green,
                            child: Text(
                              'Add',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
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
    );
  }
}
