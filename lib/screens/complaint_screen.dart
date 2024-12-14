import 'package:flutter/material.dart';
import 'dart:math';

class ComplaintScreen extends StatefulWidget {
  @override
  _ComplaintScreenState createState() => _ComplaintScreenState();
}

class _ComplaintScreenState extends State<ComplaintScreen> {
  String complaintId = "12345"; // Sample Complaint ID
  String complaintDescription =
      "The food was cold and not fresh."; // Sample complaint description

  // Variables to track the state of the form
  String? selectedComplaintType;
  TextEditingController complaintDescriptionController =
      TextEditingController();
  bool isButtonYellow = false; // To track whether the button should be yellow

  // To store the complaint details once submitted
  String? generatedComplaintId;
  String? storedComplaintType;
  String? storedComplaintDescription;
  List<Map<String, String>> complaints = [];
  TextEditingController trackComplaintController =
      TextEditingController(); // Controller for tracking complaints
  List<Map<String, String>> filteredComplaints =
      []; // Store complaints filtered by the track complaint ID
  String noMatchesFound = ""; // Message for no matches found

  // Function to generate a unique 5-digit ID
  String generateUniqueId() {
    Random random = Random();
    return (10000 + random.nextInt(90000)).toString(); // Generates a 5-digit ID
  }

  // Check if the Submit button should be enabled
  bool isSubmitEnabled() {
    return selectedComplaintType != null &&
        complaintDescriptionController.text.isNotEmpty;
  }

  // Store the complaint details and generate a unique ID when submitted
  void storeComplaintDetails() {
    setState(() {
      generatedComplaintId = generateUniqueId();
      storedComplaintType = selectedComplaintType;
      storedComplaintDescription = complaintDescriptionController.text;
      complaints.add({
        'id': generatedComplaintId!,
        'type': storedComplaintType!,
        'description': storedComplaintDescription!,
        'status': 'Pending', // Status is now added correctly
      });
      // Reset the complaint description after submission
      complaintDescriptionController.clear();
      selectedComplaintType = null;
    });
  }

  // Track the complaint based on the entered complaint ID
  void trackComplaint() {
    String trackId = trackComplaintController.text.trim();
    if (trackId.isNotEmpty) {
      setState(() {
        filteredComplaints = complaints
            .where((complaint) => complaint['id']!
                .contains(trackId)) // Match based on Complaint ID
            .toList();

        if (filteredComplaints.isEmpty) {
          noMatchesFound =
              "No matches found"; // Display message if no matches are found
        } else {
          noMatchesFound = ""; // Clear the message if matches are found
        }
      });
    } else {
      setState(() {
        filteredComplaints = []; // Clear if input is empty
        noMatchesFound = ""; // Clear the message
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Format the current date
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Complaint Form",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[800],
                ),
              ),
              SizedBox(height: 10),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: "Select Complaint Type",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide(
                        color: Colors.grey, width: 1), // Normal border
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide(
                        color: Colors.blueAccent, width: 2.0), // Focused border
                  ),
                ),
                items: ["Taste", "Hygiene", "Other"]
                    .map((type) =>
                        DropdownMenuItem(value: type, child: Text(type)))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedComplaintType = value;
                    isButtonYellow = value != null;
                  });
                },
                value: selectedComplaintType,
              ),
              SizedBox(height: 10),
              selectedComplaintType != null
                  ? Text(
                      'You have selected "$selectedComplaintType" as the complaint type. Please describe your issue below.',
                      style: TextStyle(fontSize: 14, color: Colors.blue[600]),
                    )
                  : Container(),
              SizedBox(height: 10),
              selectedComplaintType != null
                  ? TextField(
                      controller: complaintDescriptionController,
                      decoration: InputDecoration(
                        labelText: "Describe your complaint",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(
                              color: Colors.grey, width: 1), // Normal border
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(
                              color: Colors.blueAccent,
                              width: 2.0), // Focused border
                        ),
                      ),
                      maxLines: 4,
                      onChanged: (text) {
                        setState(() {
                          if (selectedComplaintType != null &&
                              complaintDescriptionController.text.isNotEmpty) {
                            isButtonYellow = true;
                          } else {
                            isButtonYellow = false;
                          }
                        });
                      },
                    )
                  : Container(),
              SizedBox(height: 10),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: ElevatedButton(
                  onPressed: isSubmitEnabled() ? storeComplaintDetails : null,
                  child: Text(
                    "Submit Complaint",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: isSubmitEnabled() ? Colors.white : Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    backgroundColor: isButtonYellow
                        ? Colors.blue
                        : Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
              ),
              Divider(),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: trackComplaintController,
                      decoration: InputDecoration(
                        labelText: "Enter Complaint ID",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(
                              color: Colors.grey, width: 1), // Normal border
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: BorderSide(
                              color: Colors.blueAccent,
                              width: 2.0), // Focused border
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: trackComplaint,
                    child: Text(
                      "Track",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      backgroundColor: Colors.blue[800],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              // Show filtered complaints or all complaints based on tracking
              filteredComplaints.isEmpty && noMatchesFound.isEmpty
                  ? complaints.isEmpty
                      ? Text("No complaints submitted yet.")
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          itemCount: complaints.length,
                          itemBuilder: (context, index) {
                            var complaint = complaints[index];
                            return Container(
                              padding: EdgeInsets.all(16.0),
                              margin: EdgeInsets.only(bottom: 16.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                border: Border.all(color: Colors.blue),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Complaint ID: ${complaint['id']}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "Description: ${complaint['description']}",
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  SizedBox(height: 10),
                                  ElevatedButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Pending",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors
                                          .red[400], // Pending status color
                                      padding: EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 20),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        )
                  : Text(noMatchesFound),
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
