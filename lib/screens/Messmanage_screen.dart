import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MessManagementScreen extends StatelessWidget {
  const MessManagementScreen({Key? key}) : super(key: key);

  Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1434A4)),
        ),
      ),
    );
  }

  Widget buildCard(String name, String role, String contact, [IconData? icon]) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.grey.shade300, Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(3.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey.shade300,
              child: Icon(icon ?? Icons.person, color: Color(0xFF1434A4)),
            ),
            title: Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(role),
                if (contact.isNotEmpty) Text(contact),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildGridItem(String name, String role, [IconData? icon]) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.grey.shade300, Colors.white],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(3.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.grey.shade300,
              child: Icon(icon ?? Icons.person,
                  color: Color(0xFF1434A4), size: 30),
            ),
            const SizedBox(height: 5),
            Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(role,
                style: const TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        ),
      ),
    );
  }

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
              const Center(
                child: Text(
                  "View and manage mess committee members",
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
              ),
              const SizedBox(height: 20),
              buildSectionTitle("Committee Heads"),
              buildCard("Dr. Ramesh Kumar", "Chief Warden",
                  "Contact: +91 9876543210"),
              buildCard("Mrs. Priya Sharma", "Mess Committee Head",
                  "Contact: +91 9876543211"),
              buildCard("Mr. Suresh Reddy", "Quality Control Head",
                  "Contact: +91 9876543212"),
              const SizedBox(height: 20),
              buildSectionTitle("Kitchen Staff"),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  buildGridItem("Ravi Kumar", "Head Chef"),
                  buildGridItem("Lakshmi", "Assistant Chef"),
                  buildGridItem("Venkat", "Kitchen Staff"),
                  buildGridItem("Anjali", "Kitchen Staff"),
                ],
              ),
              const SizedBox(height: 20),
              buildSectionTitle("Mess Representatives"),
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  buildGridItem("Ramesh", "MR E1"),
                  buildGridItem("Sita", "MR E2"),
                  buildGridItem("Rizwan", "MR E3"),
                  buildGridItem("Reshma", "MR E3"),
                ],
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