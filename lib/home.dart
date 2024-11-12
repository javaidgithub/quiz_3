import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TabBar Example'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(icon: Icon(Icons.list), text: 'ListView'),
            Tab(icon: Icon(Icons.grid_on), text: 'GridView'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // ListView Tab
          ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Icon(Icons.label),
                title: Text('Item ${index + 1}'),
                subtitle: Text('Subtitle ${index + 1}'),
                onTap: () {
                  _showSnackbar(context, 'Tapped on Item ${index + 1}');
                },
              );
            },
          ),
          // GridView Tab
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
            ),
            itemCount: 20,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  _showSnackbar(context, 'Tapped on Grid Item ${index + 1}');
                },
                child: Card(
                  margin: EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.grid_view),
                      SizedBox(height: 8),
                      Text('Grid Item ${index + 1}'),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
