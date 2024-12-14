import 'package:flutter/material.dart';

// ProfilePage widget as you provided
class AdminProfilePage extends StatelessWidget {
  const AdminProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            // Navigate to the Home page when back button is pressed
            Navigator.pushNamed(context, '/adminhome');
          },
        ),
        title: Text(
          'Administrator Profile',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue[800],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Profile Image Section
              CircleAvatar(
                radius: 70,
                backgroundColor: Colors.grey.shade300,
                child: Image.asset(
                    'assets/images/profile.png'), // Your profile image
              ),

              SizedBox(height: 10),

              // "Student Name" Text with dark blue color
              Text(
                'Admin Name',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[800]), // Dark blue color
              ),
              SizedBox(height: 20),

              // Container to wrap the student details (with white box shadow)
              Container(
                padding: EdgeInsets.all(16),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.5),
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // College ID (Blue Color for Label, Value on Right)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'College ID: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[800]),
                        ),
                        Text('N200800'),
                      ],
                    ),
                    SizedBox(height: 10),

                    // Year & Branch
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Year & Branch: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[800]),
                        ),
                        Text('3rd Year, CSE'),
                      ],
                    ),
                    SizedBox(height: 10),

                    // Date of Birth
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Date of Birth: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[800]),
                        ),
                        Text('01 Jan 2000'),
                      ],
                    ),
                    SizedBox(height: 10),

                    // Phone Number
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Phone Number: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[800]),
                        ),
                        Text('+91 9876543210'),
                      ],
                    ),
                    SizedBox(height: 10),

                    // University Mail
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'University Mail: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[800]),
                        ),
                        Text('student@rgukt.ac.in'),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),

              // Logout Button
              ElevatedButton(
                onPressed: () {
                  // Action for logout can be added here, like navigating to login screen
                  Navigator.pushNamed(context, '/login');
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  backgroundColor:
                      Colors.red, // Red background for Logout button
                  minimumSize: Size(double.infinity, 50), // Full width button
                ),
                child: Text(
                  "Logout",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.blue),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book, color: Colors.blue),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today, color: Colors.blue),
            label: 'Schedule',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.feedback, color: Colors.blue),
            label: 'Feedback',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.error_outline, color: Colors.blue),
            label: 'Complaint',
          ),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/home');
              break;
            case 1:
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
