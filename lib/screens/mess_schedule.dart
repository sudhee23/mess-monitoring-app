import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For date formatting

// The ScheduleScreen widget
class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the current date and time
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
                    context, '/profile'); // Navigate to Profile Page
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
                    '/notifications'); // Navigate to Notifications Page
              },
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(
                  "Mess Timings",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[800], // Dark blue color
                  ),
                ),
              ),
              // Container for Mess Timings and Important Notes
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10.0,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Meal Timings List with Breakfast and Lunch side by side
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Breakfast Section
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Breakfast",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue[800], // Dark blue text
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "Idli, Sambar",
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        // Lunch Section
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Lunch",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue[800], // Dark blue text
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "Rice, Dal, Curry",
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    // Snacks and Dinner Section side by side
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Snacks Section
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Snacks",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue[800], // Dark blue text
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "Tea, Biscuits",
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                        // Dinner Section
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Dinner",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue[800], // Dark blue text
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "Roti, Paneer Curry",
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Divider(
                      color: Colors.grey,
                      thickness: 1.0,
                    ),
                    // Important Notes Title
                    SizedBox(height: 20),
                    Text(
                      "Important Notes",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[800],
                      ),
                    ),
                    SizedBox(height: 8),
                    // Important Notes List with bullets
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.circle,
                                  size: 8, color: Colors.blue[800]),
                              SizedBox(width: 8),
                              Text("Please carry your ID card."),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.circle,
                                  size: 8, color: Colors.blue[800]),
                              SizedBox(width: 8),
                              Text("No food wastage allowed."),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.circle,
                                  size: 8, color: Colors.blue[800]),
                              SizedBox(width: 8),
                              Text("Maintain cleanliness."),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    Divider(),
                    // Contact Information Title
                    Text(
                      "Contact Information",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[800],
                      ),
                    ),
                    SizedBox(height: 8),
                    // Contact Info
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              "For any issues, please contact the Mess Manager at:"),
                          SizedBox(height: 8),
                          Text("Phone: 123-456-7890"),
                          Text("Email: messmanager@example.com"),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home , color:Colors.blue),
              label: 'Home',),
          BottomNavigationBarItem(
              icon: Icon(Icons.menu_book, color: Colors.blue), label: 'Menu',),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today , color:Colors.blue),
              label: 'Schedule',),
          BottomNavigationBarItem(
              icon: Icon(Icons.feedback , color:Colors.blue),
              label: 'Feedback',),
          BottomNavigationBarItem(
              icon: Icon(Icons.error_outline , color:Colors.blue),
              label: 'Complaint',),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/home');
              break;
            case 1:
              // Navigate to meals page (you can create this page)
              Navigator.pushNamed(context, '/meals');
              break;
            case 2:
              Navigator.pushNamed(context, '/schedule');
              break;
            case 3:
              Navigator.pushNamed(context, '/feedback');
              break;
            case 4:
              Navigator.pushNamed(context, '/complaint');
              break;
          }
        },
      ),
    );
  }
}
