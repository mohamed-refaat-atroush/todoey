import 'package:flutter/material.dart';

class BodyBuilder with ChangeNotifier {
  ListView buildListView(List listname, String tillORemember) {
    return ListView.builder(
        itemCount: listname.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: ValueKey(listname[index]),
            background: Container(
              color: Color(0xFFFFD600),
              child: Icon(Icons.delete),
            ),
            direction: DismissDirection.endToStart,
            onDismissed: (_) {
              listname.remove(listname[index]);
            },
            child: Card(
              child: ListTile(
                leading: Text(
                  listname[index].name,
                  style: TextStyle(
                      fontSize: 20,
                      decoration: listname[index].isDone
                          ? TextDecoration.lineThrough
                          : null),
                ),
                title: Row(
                  children: [
                    Text(
                      '${listname[index].time} ',
                      style: TextStyle(color: Colors.black),
                    ),
                    Icon(Icons.watch_later)
                  ],
                ),
                subtitle: Text('$tillORemember:${listname[index].description}'),
                trailing: Checkbox(
                  value: listname[index].isDone,
                  onChanged: (bool val) {
                    listname[index].isDone = val;
                    notifyListeners();
                  },
                ),
              ),
            ),
          );
        });
  }

  ListView buildListViewPlaces(List lisName) {
    return ListView.builder(
        itemCount: lisName.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: ValueKey(lisName[index]),
            background: Container(
              color: Color(0xFFFFD600),
              child: Icon(Icons.delete),
            ),
            direction: DismissDirection.endToStart,
            onDismissed: (_) {
              lisName.remove(lisName[index]);
            },
            child: Card(
              child: ListTile(
                leading: Text(
                  lisName[index].name,
                  style: TextStyle(
                      fontSize: 20,
                      decoration: lisName[index].isDone
                          ? TextDecoration.lineThrough
                          : null),
                ),
                title: Row(
                  children: [
                    Text(
                      lisName[index].time,
                      style: TextStyle(
                          decoration: lisName[index].isDone
                              ? TextDecoration.lineThrough
                              : null),
                    ),
                    Icon(Icons.watch_later)
                  ],
                ),
                trailing: Checkbox(
                  value: lisName[index].isDone,
                  onChanged: (bool val) {
                    lisName[index].isDone = val;
                    notifyListeners();
                  },
                ),
              ),
            ),
          );
        });
  }

  ListView listViewShopping(List shoppingList) {
    return ListView.builder(
        itemCount: shoppingList.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: ValueKey(shoppingList[index]),
            background: Container(
              color: Color(0xFFFFD600),
              child: Icon(Icons.delete),
            ),
            direction: DismissDirection.endToStart,
            onDismissed: (_) {
              shoppingList.remove(shoppingList[index]);
            },
            child: Card(
              child: ListTile(
                title: Text(
                  shoppingList[index].name,
                  style: TextStyle(
                      fontSize: 20,
                      decoration: shoppingList[index].isDone
                          ? TextDecoration.lineThrough
                          : null),
                ),
                leading: Text(
                  shoppingList[index].amount,
                  style: TextStyle(
                      decoration: shoppingList[index].isDone
                          ? TextDecoration.lineThrough
                          : null),
                ),
                trailing: Checkbox(
                  value: shoppingList[index].isDone,
                  onChanged: (bool val) {
                    shoppingList[index].isDone = val;
                    notifyListeners();
                  },
                ),
              ),
            ),
          );
        });
  }
}
