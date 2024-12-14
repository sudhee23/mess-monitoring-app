import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Add this import to use DateFormat

class MessrepAdminSettingsScreen extends StatelessWidget {
  const MessrepAdminSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get current date and day
    String currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    String currentDay = DateFormat('EEEE').format(DateTime.now());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Remove default back button
        title: Row(
          children: [
            // Profile Icon (left side)
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                    context, '/adminprofile'); // Navigate to Profile Page
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 20, // Profile icon size
                  backgroundColor: Colors.transparent,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.blue[800]!, width: 2),
                    ),
                  ),
                ),
              ),
            ),
            // Centered text with greeting, date, and day
            Expanded(
              child: Column(
                children: [
                  Text(
                    "Hi Dheeraj",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[800], // Dark blue color
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "$currentDay, $currentDate", // Show day and date only
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black, // Light blue color
                    ),
                  ),
                ],
              ),
            ),
            // Notification Icon (right side)
            IconButton(
              icon: Icon(Icons.notifications, color: Colors.blue[800]),
              onPressed: () {
                Navigator.pushNamed(context,
                    '/notification'); // Navigate to Notifications Page
              },
            ),
          ],
        ),
        centerTitle: true,
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
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
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
              Navigator.pushNamed(context, '/messrephomescreen');
              break;
            case 1:
              // Navigate to meals page (you can create this page)
              Navigator.pushNamed(context, '/messrepcomplaints');
              break;
            case 2:
              Navigator.pushNamed(context, '/messrepmenu');
              break;
            case 3:
              Navigator.pushNamed(context, '/messrepmanage');
              break;
            case 4:
              Navigator.pushNamed(context, '/messrepsetting');
              break;
          }
        },
      ),
    );
  }
}