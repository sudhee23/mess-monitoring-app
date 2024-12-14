import 'package:flutter/material.dart';

class FeedbackScreen extends StatefulWidget {
  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  // To track ratings for each question
  List<int> ratings = List.filled(10, 0);

  // Method to handle rating changes
  void _onRatingChanged(int questionIndex, int rating) {
    setState(() {
      ratings[questionIndex] = rating;
    });
  }

  // Method to check if all feedbacks have been rated (not necessarily 5 stars)
  bool _canSubmitFeedback() {
    return ratings.every((rating) =>
        rating != 0); // Ensure no feedback is left unrated (rating != 0)
  }

  // Method to reset ratings after submission
  void _resetRatings() {
    setState(() {
      ratings = List.filled(10, 0); // Reset all ratings to 0
    });
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate = "${DateTime.now().toLocal()}".split(' ')[0]; // Date
    String formattedDay = DateTime.now().weekday == 1
        ? "Monday"
        : DateTime.now().weekday == 2
            ? "Tuesday"
            : DateTime.now().weekday == 3
                ? "Wednesday"
                : DateTime.now().weekday == 4
                    ? "Thursday"
                    : DateTime.now().weekday == 5
                        ? "Friday"
                        : DateTime.now().weekday == 6
                            ? "Saturday"
                            : "Sunday"; // Day
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
                    "$formattedDay, $formattedDate", // Show day and date only
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
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          SizedBox(height: 10),
          // Title for the Feedback Form with blue color
          Text(
            "Feedback Form",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.blue[800], // Blue color for the title
            ),
          ),
          SizedBox(height: 20),
          // Add left padding to feedback questions
          for (int i = 0; i < 10; i++)
            Padding(
              padding: const EdgeInsets.only(
                  left: 16.0), // Left padding for the questions
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${i + 1}. Feedback Question ${i + 1}",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: List.generate(
                      5,
                      (index) => IconButton(
                        icon: Icon(
                          Icons.star,
                          color: index < ratings[i]
                              ? Colors.yellow
                              : Colors.blue[
                                  800], // Change color based on rating (dark blue for unselected)
                        ),
                        onPressed: () => _onRatingChanged(i, index + 1),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _canSubmitFeedback()
                ? () {
                    // Handle feedback submission
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text("Feedback Submitted"),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.check_circle,
                              color: Colors.green,
                              size: 50,
                            ),
                            SizedBox(height: 10),
                            Text("Thank you for your feedback!"),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              _resetRatings(); // Reset feedback ratings after submission
                              Navigator.pop(context); // Close the dialog
                            },
                            child: Text("Close"),
                          ),
                        ],
                      ),
                    );
                  }
                : null, // Enable button when all ratings are filled
            child: Text("Submit Feedback"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue[800], // Dark blue button
              foregroundColor: Colors.white, // White text color
            ),
          ),
        ],
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