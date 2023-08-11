import 'package:flutter/material.dart';

class NotificationSettings extends StatefulWidget {
  @override
  _NotificationSettingsState createState() => _NotificationSettingsState();
}

class _NotificationSettingsState extends State<NotificationSettings> {
  bool _notificationsEnabled = true;

  void _toggleNotifications(bool newValue) {
    setState(() {
      _notificationsEnabled = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification Settings'),
        backgroundColor: Colors.green,
      ),
      body: ListView(
        padding: EdgeInsets.all(12),
        children: [
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Receive Notifications'),
            trailing: Switch(
              value: _notificationsEnabled,
              onChanged: (newValue) {
                _toggleNotifications(newValue);
              },
            ),
          ),
          ListTile(
            title: Text('Manage Notifications'),
            onTap: () {
              // Navigate to another screen for managing notifications
              // For example: Navigator.push(context, MaterialPageRoute(builder: (context) => ManageNotificationsScreen()));
            },
          ),
        ],
      ),
    );
  }
}
