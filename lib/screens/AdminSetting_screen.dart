import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Add this import to use DateFormat

class AdminSettingsScreen extends StatelessWidget {
  const AdminSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get current date and day
    String currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    String currentDay = DateFormat('EEEE').format(DateTime.now());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            // Profile icon with border
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.blue[800]!, width: 2),
                image: DecorationImage(
                  image: NetworkImage('https://example.com/profile.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Centered Greeting
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Hi Dheeraj",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[800],
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "$currentDay, $currentDate",
                    style: TextStyle(fontSize: 16, color: Colors.blue[300]),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(Icons.notifications, color: Colors.blue[800]),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 8.0, bottom: 16.0),
                child: Text(
                  "Profile Name",
                  style: TextStyle(
                      fontSize: 14,
                      fontStyle: FontStyle.italic,
                      color: Colors.grey),
                ),
              ),
              // Updated Container with white background for Warden
              Container(
                decoration: BoxDecoration(
                  color: Colors.white, // White background for Warden details
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.grey.shade300,
                      child: Icon(Icons.person,
                          color: Color(0xFF1434A4), size: 30),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Dr. Ramesh Kumar",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Text("Chief Warden"),
                        Text("Contact: +91 9876543210"),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white, // Keep white shadow for consistency
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Admin Settings",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1434A4)),
                    ),
                    SizedBox(height: 10),
                    ListTile(
                      leading: Icon(Icons.settings, color: Color(0xFF1434A4)),
                      title: Text("Profile Settings"),
                      trailing: Icon(Icons.arrow_forward_ios,
                          color: Color(0xFF1434A4)),
                    ),
                    ListTile(
                      leading:
                          Icon(Icons.notifications, color: Color(0xFF1434A4)),
                      title: Text("Notifications"),
                      trailing: Icon(Icons.arrow_forward_ios,
                          color: Color(0xFF1434A4)),
                    ),
                    ListTile(
                      leading: Icon(Icons.security, color: Color(0xFF1434A4)),
                      title: Text("Security"),
                      trailing: Icon(Icons.arrow_forward_ios,
                          color: Color(0xFF1434A4)),
                    ),
                    ListTile(
                      leading: Icon(Icons.color_lens, color: Color(0xFF1434A4)),
                      title: Text("Appearance"),
                      trailing: Icon(Icons.arrow_forward_ios,
                          color: Color(0xFF1434A4)),
                    ),
                    ListTile(
                      leading: Icon(Icons.language, color: Color(0xFF1434A4)),
                      title: Text("Language"),
                      trailing: Icon(Icons.arrow_forward_ios,
                          color: Color(0xFF1434A4)),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Logout",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard, color: Color(0xFF9CA3AF)),
            label: "Dashboard",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.report, color: Color(0xFF143A4A)),
            label: "Complaints",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu, color: Color(0xFF143A4A)),
            label: "Menu",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people, color: Color(0xFF143A4A)),
            label: "Staff",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, color: Color(0xFF143A4A)),
            label: "Settings",
          ),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/adminhome');
              break;
            case 1:
              // Navigate to meals page (you can create this page)
              Navigator.pushNamed(context, '/complaints');
              break;
            case 2:
              Navigator.pushNamed(context, '/adminmenu');
              break;
            case 3:
              Navigator.pushNamed(context, '/messmanagement');
              break;
            case 4:
              Navigator.pushNamed(context, '/adminsettings');
              break;
          }
        },
      ),
    );
  }
}