import 'package:flutter/material.dart';

class BMIScreen extends StatefulWidget {
  const BMIScreen({super.key});

  @override
  _BMIScreenState createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  String bmiResult = '';
  String bmiCategory = '';

  void calculateBMI() {
    double height =
        double.parse(heightController.text) / 100; // convert cm to meters
    double weight = double.parse(weightController.text);
    double bmi = weight / (height * height);

    setState(() {
      bmiResult = bmi.toStringAsFixed(2);
      if (bmi < 18.5) {
        bmiCategory = 'Underweight < 18.5';
      } else if (bmi >= 18.5 && bmi <= 24.9) {
        bmiCategory = 'Normal 18.5 - 24.9';
      } else if (bmi >= 25 && bmi <= 29.9) {
        bmiCategory = 'Overweight 25 - 29.9';
      } else {
        bmiCategory = 'Obesity >= 30';
      }
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0), // Set margin around the content
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Centered Heading for "Calculate Your BMI"
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Text(
                    'Calculate Your BMI',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black, // Blue color for heading
                    ),
                  ),
                ),
              ),
              // Heading Text for BMI Calculator
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Text(
                  'BMI Calculator',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[800], // Blue color for heading
                  ),
                ),
              ),
              // Height TextField
              TextField(
                controller: heightController,
                decoration: InputDecoration(
                  labelText: "Enter height (cm)",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide(color: Colors.grey, width: 1), // Normal border
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0), // Focused border
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 10),
              // Weight TextField
              TextField(
                controller: weightController,
                decoration: InputDecoration(
                  labelText: "Enter weight (kg)",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide(color: Colors.grey, width: 1), // Normal border
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0), // Focused border
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              // Calculate BMI Button (Full Width)
              ElevatedButton(
                onPressed: calculateBMI,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  backgroundColor: Colors.blue[800],
                  minimumSize: Size(double.infinity, 50), // Full width button
                ),
                child: Text(
                  "Calculate BMI",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              SizedBox(height: 20),
              // BMI Result and Category (Box Increased and Centered)
              bmiResult.isEmpty
                  ? Container()
                  : Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue.withOpacity(0.5),
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center, // Center content vertically
                        crossAxisAlignment: CrossAxisAlignment.center, // Center content horizontally
                        children: [
                          Text(
                            "Your BMI: $bmiResult",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Roboto', // Beautiful font
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Category: $bmiCategory",
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'Roboto', // Beautiful font
                            ),
                          ),
                        ],
                      ),
                    ),
              SizedBox(height: 20),
              // BMI Category Ranges with Width Set
              Container(
                padding: EdgeInsets.all(16),
                width: double.infinity, // Make the box occupy full width
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.5),
                      blurRadius: 10,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "BMI Categories:",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto', // Beautiful font
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Underweight: < 18.5",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Roboto', // Beautiful font
                      ),
                    ),
                    Text(
                      "Normal: 18.5 - 24.9",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Roboto', // Beautiful font
                      ),
                    ),
                    Text(
                      "Overweight: 25 - 29.9",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Roboto', // Beautiful font
                      ),
                    ),
                    Text(
                      "Obesity: >= 30",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Roboto', // Beautiful font
                      ),
                    ),
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
