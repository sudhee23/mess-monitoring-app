# Mess-Monitor

A university-based application designed to streamline mess management by enhancing transparency between mess administration and students. It provides features to track complaints, reviews, menu options, crowd management, and inventory status, offering a comprehensive solution to address existing issues in mess operations.

---

## *Description*

Mess-Monitor is a powerful mobile application that resolves key challenges faced in university mess management. It helps improve communication, optimize resources, and ensure a seamless dining experience for students while providing administrative tools for mess staff.

---

## *Features*

- *Menu Management*: View updated menus for breakfast, lunch, snacks, and dinner.
- *Complaint Tracking*: Submit, track, and resolve complaints efficiently.
- *Reviews and Feedback*: Students can submit reviews for meals and services.
- *Crowd Management*: Real-time status of crowd levels to plan meal timings effectively.
- *Inventory Status*: Mess staff can monitor and update inventory levels.
- *Notifications*: Receive important updates regarding meal schedules or announcements.
- *User-Friendly Navigation*: Intuitive bottom navigation for easy access to different sections.

---

## *Tech Stack*

- *Framework*: Flutter
- *Language*: Dart
- *State Management*: Provider / Bloc (optional based on project needs)
- *Dependencies*:
  - intl: For date formatting
  - flutter/material: UI components
  - *Firebase* (optional for backend integration)

---

## *Setup and Installation*

Follow the steps below to set up the project on your local machine:

### Prerequisites

- Install [Flutter SDK](https://flutter.dev/docs/get-started/install)
- Install Dart
- Ensure Android Studio or Visual Studio Code is set up for Flutter development.

### Steps:

1. Clone the repository:
   bash
   git clone https://github.com/yourusername/mess-monitor.git
   
2. Navigate to the project directory:
   bash
   cd mess-monitor
   
3. Install dependencies:
   bash
   flutter pub get
   
4. Run the application:
   bash
   flutter run
   
   The app will launch on the connected emulator or device.

---

## *Project Structure*


mess-monitor/
├── lib/
│   ├── screens/
│   │   ├── Admincomplaints_screen.dart
│   │   ├── Adminhome_screen.dart
│   │   ├── Adminmenu_screen.dart
│   │   ├── Adminprofile_screen.dart
│   │   ├── Adminsetting_screen.dart
│   │   ├── bmi_screen.dart
│   │   ├── complaint_screen.dart
│   │   ├── feedback_screen.dart
│   │   ├── login_screen.dart
│   │   ├── mess_schedule.dart
│   │   ├── Messmanage_screen.dart
│   │   ├── messrepadmin_screen.dart
│   │   ├── messrepcomplaints_screen.dart
│   │   ├── messrephome_screen.dart
│   │   ├── messrepmanage_screen.dart
│   │   ├── messrepmenu_screen.dart
│   │   ├── messrepprofile_screen.dart
│   │   ├── notification_screen.dart
│   │   ├── profile_page.dart
│   │   ├── student_home_page.dart
│   ├── main.dart              # Entry point of the app
├── assets/
│   ├── images/                # Images for meals and UI
│   ├── screenshots/           # Screenshots of the app
├── pubspec.yaml               # Dependencies and assets declaration
├── README.md                  # Project documentation
└── LICENSE                    # License file


---

## *Contributing*

Contributions are welcome! Follow these steps to contribute:

1. Fork the repository.
2. Create a new branch:
   bash
   git checkout -b feature/your-feature-name
   
3. Make changes and commit:
   bash
   git commit -m "Add a descriptive message for your changes"
   
4. Push the changes:
   bash
   git push origin feature/your-feature-name
   
5. Open a Pull Request.

---

## *License*

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

---

## *Acknowledgements*

- [Flutter](https://flutter.dev) for the amazing framework.
- [Dart](https://dart.dev) for the programming language.
- University support and feedback during app development.
- Free image sources like [Unsplash](https://unsplash.com) for placeholders.

---

## *Contact*

For queries or collaborations, contact:

- *Developers Name*: Mande Dheeraj, Tippabattina Phanindra Babu,Kalyanam Mohan Sai Sudheer,nandam Keerthi
- *Email*: [dheerajamande@gmail.com](mailto\:dheerajamande@gmail.com)


---

*Let's make mess management efficient, transparent, and student-friendly with Mess-Monitor!* 🚀
