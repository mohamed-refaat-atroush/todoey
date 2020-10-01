import 'package:flutter/material.dart';
import 'package:task_list/Screen/calling_screen.dart';
import 'shopping_screen.dart';
import 'places_screen.dart';
import 'meatings_screen.dart';

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Tasks List'),
          bottom: TabBar(
            tabs: [
              Tab(
                text: 'shopping',
              ),
              Tab(
                text: 'calls',
              ),
              Tab(
                text: 'places',
              ),
              Tab(
                text: 'meetings',
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [Product_Screen(), Calls(), Places(), Meatings()],
        ),
      ),
    );
  }
}
