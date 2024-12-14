// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// class MessrepComplaintsPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // Get current date and day
//     String currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
//     String currentDay = DateFormat('EEEE').format(DateTime.now());

//     return Scaffold(
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         title: Row(
//           children: [
//             // Profile icon with border
//             Container(
//               width: 40,
//               height: 40,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 border: Border.all(color: Colors.blue[800]!, width: 2),
//                 image: DecorationImage(
//                   image: NetworkImage('https://example.com/profile.jpg'),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             // Centered Greeting
//             Expanded(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     "Hi Dheeraj",
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.blue[800],
//                     ),
//                   ),
//                   SizedBox(height: 4),
//                   Text(
//                     "$currentDay, $currentDate",
//                     style: TextStyle(fontSize: 16, color: Colors.blue[300]),
//                   ),
//                 ],
//               ),
//             ),
//             IconButton(
//               icon: Icon(Icons.notifications, color: Colors.blue[800]),
//               onPressed: () {},
//             ),
//           ],
//         ),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(left: 8.0),
//             child: Text(
//               "Complaints List",
//               style: TextStyle(
//                 color: Color(0xFF1434A4), // Specified color
//                 fontWeight: FontWeight.bold,
//                 fontSize: 18,
//               ),
//             ),
//           ),
//           SizedBox(height: 16),
//           // Row with two boxes for text fields and dropdown
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16.0),
//             child: Row(
//               children: [
//                 // Box 1: "All Status" Dropdown
//                 Expanded(
//                   child: DropdownButtonFormField<String>(
//                     decoration: InputDecoration(
//                       labelText: 'All Status',
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                     items: [
//                       DropdownMenuItem(
//                         value: 'Pending',
//                         child: Text('Pending'),
//                       ),
//                       DropdownMenuItem(
//                         value: 'In Progress',
//                         child: Text('In Progress'),
//                       ),
//                       DropdownMenuItem(
//                         value: 'Resolved',
//                         child: Text('Resolved'),
//                       ),
//                     ],
//                     onChanged: (value) {},
//                     isExpanded: true,
//                   ),
//                 ),
//                 SizedBox(width: 8),
//                 // Box 2: "Search Complaints"
//                 Expanded(
//                   child: TextField(
//                     decoration: InputDecoration(
//                       labelText: 'Search Complaints',
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 16),
//           Expanded(
//             child: ListView(
//               children: [
//                 ComplaintCard(
//                   id: "12345",
//                   name: "John Doe",
//                   title: "Food Quality Issue",
//                   description:
//                       "Issue with food temperature and taste in lunch meal",
//                   date: "July 1, 2024",
//                   status: "In Progress",
//                 ),
//                 ComplaintCard(
//                   id: "12346",
//                   name: "Jane Smith",
//                   title: "Hygiene Concern",
//                   description: "Utensils not properly cleaned",
//                   date: "July 1, 2024",
//                   status: "Pending",
//                 ),
//                 ComplaintCard(
//                   id: "12347",
//                   name: "Mike Johnson",
//                   title: "Portion Size",
//                   description: "",
//                   date: "July 1, 2024",
//                   status: "Resolved",
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: 1,
//         selectedItemColor: Colors.blue,
//         unselectedItemColor: Colors.grey,
//         items: [
//           BottomNavigationBarItem(
//               icon: Icon(Icons.dashboard), label: "Dashboard"),
//           BottomNavigationBarItem(icon: Icon(Icons.list), label: "Complaints"),
//           BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Menu"),
//           BottomNavigationBarItem(icon: Icon(Icons.people), label: "Staff"),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.settings), label: "Settings"),
//         ],
//       ),
//     );
//   }
// }

// class ComplaintCard extends StatefulWidget {
//   final String id;
//   final String name;
//   final String title;
//   final String description;
//   final String date;
//   final String status;

//   const ComplaintCard({
//     required this.id,
//     required this.name,
//     required this.title,
//     required this.description,
//     required this.date,
//     required this.status,
//   });

//   @override
//   _ComplaintCardState createState() => _ComplaintCardState();
// }

// class _ComplaintCardState extends State<ComplaintCard> {
//   String? selectedStatus;

//   @override
//   void initState() {
//     super.initState();
//     selectedStatus = widget.status;
//   }

//   @override
//   Widget build(BuildContext context) {
//     Color statusColor;
//     switch (selectedStatus) {
//       case 'Pending':
//         statusColor = Color(0xffec1010); // Red
//         break;
//       case 'Resolved':
//         statusColor = Color(0xffc1f18b); // Green
//         break;
//       case 'In Progress':
//         statusColor = Color(0xffd4997c); // Yellow
//         break;
//       default:
//         statusColor = Colors.grey;
//     }

//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 8.0),
//       width: double.infinity,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(8.0),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.1),
//             blurRadius: 8.0,
//             spreadRadius: 2.0,
//             offset: Offset(0, 3),
//           ),
//         ],
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Left column: Complaint details
//             Expanded(
//               flex: 3,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "#${widget.id}",
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(height: 8.0),
//                   Text("Submitted by: ${widget.name}",
//                       style: TextStyle(color: Color(0xff130707))),
//                   SizedBox(height: 8.0),
//                   Text(
//                     widget.title,
//                     style:
//                         TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
//                   ),
//                   SizedBox(height: 8.0),
//                   Text(
//                     widget.description,
//                     style: TextStyle(color: Color(0xff130707)),
//                   ),
//                   SizedBox(height: 8.0),
//                   Text(
//                     widget.date,
//                     style: TextStyle(color: Color(0xff1d1414), fontSize: 12.0),
//                   ),
//                 ],
//               ),
//             ),
//             // Right column: Status dropdown and button
//             Expanded(
//               flex: 2,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   // Dropdown to change the status
//                   DropdownButton<String>(
//                     value: selectedStatus,
//                     onChanged: (String? newValue) {
//                       setState(() {
//                         selectedStatus = newValue;
//                       });
//                     },
//                     items: <String>['Pending', 'In Progress', 'Resolved']
//                         .map<DropdownMenuItem<String>>((String value) {
//                       return DropdownMenuItem<String>(
//                         value: value,
//                         child: Text(value),
//                       );
//                     }).toList(),
//                   ),
//                   SizedBox(height: 8.0),
//                   // Status button
//                   ElevatedButton(
//                     onPressed: () {},
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: statusColor,
//                       side: BorderSide(color: Colors.black),
//                       padding:
//                           EdgeInsets.symmetric(horizontal: 15, vertical: 8),
//                     ),
//                     child: Text(
//                       selectedStatus ?? 'Status',
//                       style: TextStyle(color: Colors.black),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MessrepComplaintsPage extends StatefulWidget {
  @override
  _ComplaintsPageState createState() => _ComplaintsPageState();
}

class _ComplaintsPageState extends State<MessrepComplaintsPage> {
  String? selectedStatus;
  String searchQuery = "";
  final List<Complaint> allComplaints = [
    Complaint(
        id: "12345",
        name: "John Doe",
        title: "Food Quality Issue",
        description: "Issue with food temperature and taste in lunch meal",
        date: "July 1, 2024",
        status: "In Progress"),
    Complaint(
        id: "12346",
        name: "Jane Smith",
        title: "Hygiene Concern",
        description: "Utensils not properly cleaned",
        date: "July 1, 2024",
        status: "Pending"),
    Complaint(
        id: "12347",
        name: "Mike Johnson",
        title: "Portion Size",
        description: "Portion size is too small",
        date: "July 1, 2024",
        status: "Resolved"),
  ];

  List<Complaint> get filteredComplaints {
    // Filter complaints based on selected status and search query
    return allComplaints.where((complaint) {
      final matchesStatus =
          selectedStatus == null || complaint.status == selectedStatus;
      final matchesSearchQuery = complaint.id.contains(searchQuery);
      return matchesStatus && matchesSearchQuery;
    }).toList();
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              "Complaints List",
              style: TextStyle(
                color: Color(0xFF1434A4), // Specified color
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          SizedBox(height: 16),
          // Row with two boxes for text fields and dropdown
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                // Box 1: "All Status" Dropdown
                Expanded(
                  child: DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      labelText: 'All Status',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    value: selectedStatus,
                    items: [
                      DropdownMenuItem(
                        value: null,
                        child: Text('All Status'),
                      ),
                      DropdownMenuItem(
                        value: 'Pending',
                        child: Text('Pending'),
                      ),
                      DropdownMenuItem(
                        value: 'In Progress',
                        child: Text('In Progress'),
                      ),
                      DropdownMenuItem(
                        value: 'Resolved',
                        child: Text('Resolved'),
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        selectedStatus = value;
                      });
                    },
                    isExpanded: true,
                  ),
                ),
                SizedBox(width: 8),
                // Box 2: "Search Complaints"
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Search Complaints',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        searchQuery = value;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: ListView(
              children: filteredComplaints.map((complaint) {
                return ComplaintCard(
                  id: complaint.id,
                  name: complaint.name,
                  title: complaint.title,
                  description: complaint.description,
                  date: complaint.date,
                  status: complaint.status,
                );
              }).toList(),
            ),
          ),
        ],
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

class ComplaintCard extends StatelessWidget {
  final String id;
  final String name;
  final String title;
  final String description;
  final String date;
  final String status;

  const ComplaintCard({
    required this.id,
    required this.name,
    required this.title,
    required this.description,
    required this.date,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    Color statusColor;
    switch (status) {
      case 'Pending':
        statusColor = Color(0xffec1010); // Red
        break;
      case 'Resolved':
        statusColor = Color(0xffc1f18b); // Green
        break;
      case 'In Progress':
        statusColor = Color(0xffd4997c); // Yellow
        break;
      default:
        statusColor = Colors.grey;
    }

    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8.0,
            spreadRadius: 2.0,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left column: Complaint details
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "#$id",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8.0),
                  Text("Submitted by: $name",
                      style: TextStyle(color: Color(0xff130707))),
                  SizedBox(height: 8.0),
                  Text(
                    title,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                  ),
                  SizedBox(height: 8.0),
                  Text(description, style: TextStyle(color: Color(0xff130707))),
                  SizedBox(height: 8.0),
                  Text(
                    date,
                    style: TextStyle(color: Color(0xff1d1414), fontSize: 12.0),
                  ),
                ],
              ),
            ),
            // Right column: Status button
            Expanded(
              flex: 2,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: statusColor,
                  side: BorderSide(color: Colors.black),
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                ),
                child: Text(
                  status,
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Complaint {
  final String id;
  final String name;
  final String title;
  final String description;
  final String date;
  final String status;

  Complaint({
    required this.id,
    required this.name,
    required this.title,
    required this.description,
    required this.date,
    required this.status,
  });
}