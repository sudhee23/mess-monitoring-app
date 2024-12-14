import 'package:flutter/material.dart';
import 'package:mess/screens/AdminSetting_screen.dart';
import 'package:mess/screens/Admincomplaints_screen.dart';
import 'package:mess/screens/Adminhome_screen.dart';
import 'package:mess/screens/Adminmenu_screen.dart';
import 'package:mess/screens/Messmanage_screen.dart';
import 'package:mess/screens/complaint_screen.dart';
import 'package:mess/screens/feedback_screen.dart';
import 'package:mess/screens/login_screen.dart';
import 'package:mess/screens/mess_schedule.dart';
import 'package:mess/screens/bmi_screen.dart';

import 'package:mess/screens/messmenu_screen.dart';
import 'package:mess/screens/messrepcomplaints_screen.dart';
import 'package:mess/screens/messrephome_screen.dart';
import 'package:mess/screens/profile_page.dart';
import 'package:mess/screens/student_home_page.dart';

import 'screens/notification_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue, // Set blue as the primary color
        colorScheme:
            ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(
          secondary: Colors.blueAccent, // Changed to blueAccent for consistency
        
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginSignUpPage(),
      routes: {
        '/profile': (context) => ProfilePage(),
        '/home': (context) => HomePage(),
        '/notification': (context) => NotificationPage(),
        '/meals':(context) => MenuScreen(),
        '/schedule':(context) => ScheduleScreen(),
        '/feedback':(context) => FeedbackScreen(),
        '/adminhome':(context) => AdminHomePage(),
        '/complaint': (context) => ComplaintScreen(),
        '/bmi':(context) => BMIScreen(),
        '/login':(context) => LoginSignUpPage(),
        '/complaints':(context) => ComplaintsPage(),
        '/adminmenu': (context) => AdminMenuPage(),
        '/messmanagement':(context) => MessManagementScreen(),
        '/adminsettings': (context) => AdminSettingsScreen(),
        '/messrephomescreen':(context) => MessrepHomePage(),
        '/messrepcomplaints':(context) => MessrepComplaintsPage(),
      },
    );
  }
}

