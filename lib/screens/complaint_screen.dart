import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class ComplaintScreen extends StatefulWidget {
  const ComplaintScreen({super.key});

  @override
  _ComplaintScreenState createState() => _ComplaintScreenState();
}

class _ComplaintScreenState extends State<ComplaintScreen> {
  final String _status = 'Pending';
  String complaintId = "12345"; // Sample Complaint ID
  String complaintDescription =
      "The food was cold and not fresh."; // Sample complaint description
  File? _selectedImage; // File to store the selected image

  // Function to pick an image
  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Heading for the complaint form
            Center(
              child: Text(
                'Submit a new complaint or track an existing one',
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Complaint Form",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.blue[800],
              ),
            ),
            SizedBox(height: 20),
            // Dropdown with border radius
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: "Select Complaint Type",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide:
                      BorderSide(color: Colors.grey, width: 1), // Normal border
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
              onChanged: (value) {},
            ),
            SizedBox(height: 20),
            // TextField with border radius
            TextField(
              decoration: InputDecoration(
                labelText: "Describe your complaint",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide:
                      BorderSide(color: Colors.grey, width: 1), // Normal border
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: BorderSide(
                      color: Colors.blueAccent, width: 2.0), // Focused border
                ),
              ),
              maxLines: 4,
            ),
            SizedBox(height: 20),
            // Submit button with border radius
            GestureDetector(
              onTap: _pickImage,
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(color: Colors.blue[200]!),
                ),
                child: Row(
                  children: [
                    Icon(Icons.add_photo_alternate, color: Colors.blue),
                    SizedBox(width: 10),
                    Text(
                      _selectedImage == null
                          ? "Add an image (Optional)"
                          : "Image Selected",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
              ),
            ),
            // Display selected image preview
            if (_selectedImage != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: Image.file(
                    _selectedImage!,
                    height: 150,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            // Submit button with border radius
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: Colors.blue,
              ),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  backgroundColor: Colors.blue[800],
                ),
                child: Text(
                  "Submit Complaint",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            Divider(),
            // Track Your Complaint title text color changed to white and added background for visibility
            SizedBox(height: 20),
            // Complaint ID text field
            Row(
              children: [
                Expanded(
                  child: TextField(
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
                SizedBox(width: 20),
                // Track button beside the Complaint ID
                // Image Picker Section
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    backgroundColor: Colors.blue[800],
                  ),
                  child: Text(
                    "Track",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            // Track progress section with card displaying complaint ID and description
            _status == 'Pending'
                ? Card(
                    color: Colors.white, // Set card color to white
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Complaint ID: $complaintId",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              Text(
                                "Pending", // Show the status next to the complaint ID
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.orange),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Description: $complaintDescription",
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  )
                : Container(),
          ],
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
