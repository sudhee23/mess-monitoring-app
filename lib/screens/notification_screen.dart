import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notifications')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.update, color: Colors.blue),
                title: Text('Menu Update'),
                subtitle: Text("Special items for tomorrow's lunch."),
                trailing: Text('3 hours ago'),
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.access_time, color: Colors.green),
                title: Text('Timing Change'),
                subtitle: Text("Breakfast timing changed to 7:30 AM."),
                trailing: Text('5 hours ago'),
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.warning, color: Colors.yellow),
                title: Text('Important Notice'),
                subtitle: Text("Mess will be closed on Sunday."),
                trailing: Text('1 day ago'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}