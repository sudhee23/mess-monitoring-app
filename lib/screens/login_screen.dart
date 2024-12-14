//login
import 'package:flutter/material.dart';

class LoginSignUpPage extends StatefulWidget {
  const LoginSignUpPage({super.key});

  @override
  _LoginSignUpPageState createState() => _LoginSignUpPageState();
}

class _LoginSignUpPageState extends State<LoginSignUpPage> {
  bool isLogin = true;
  String? selectedCategory = 'Student';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'RGUKT MESS MANAGEMENT',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 4, 33, 176),
                  ),
                ),
                SizedBox(height: 20,),
                Text(
                  'Welcome Back!',
                  style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 3, 3, 3),
                  ),
                ),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          isLogin = true;
                        });
                      },
                      child: Text('Login',
                          style: TextStyle(fontSize: 20, color: Colors.grey.shade600)),
                    ),
                    SizedBox(width: 20),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          isLogin = false;
                        });
                      },
                      child: Text('Sign Up',
                          style: TextStyle(fontSize: 20, color: Colors.grey.shade600)),
                    ),
                  ],
                ),
                SizedBox(height: 40),
                if (isLogin) _buildLoginForm(context) else _buildSignUpForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginForm(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            fillColor: Colors.amber,
            labelText: 'Email Address',
            suffixIcon: Icon(Icons.email,color: Colors.grey,),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            
          ),
        ),
        SizedBox(height: 20),
        TextField(
          obscureText: true,
          decoration: InputDecoration(
            suffixIcon: Icon(Icons.remove_red_eye,color: Colors.grey,),
            labelText: 'Password',
            border: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
            ),
          ),
        ),
        SizedBox(height: 20),
        // Updated Dropdown without decoration
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue),
            borderRadius: BorderRadius.circular(5),
          ),
          child: DropdownButton<String>(
            value: selectedCategory,
            onChanged: (String? newValue) {
              setState(() {
                selectedCategory = newValue!;
              });
            },
            items: <String>['Student', 'Mess Representative', 'Administrator']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            isExpanded: true, // Ensures full-width dropdown
            underline: SizedBox(), // Removes default underline
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            if (selectedCategory == 'Student') {
              Navigator.pushNamed(context, '/home');
            }
            else if (selectedCategory == 'Administrator'){
              Navigator.pushNamed(context, '/adminhome');
            }
            else if(selectedCategory == 'Mess Representative'){
              Navigator.pushNamed(context, '/messrephomescreen');
          }
          },
          style: ElevatedButton.styleFrom(
            minimumSize: Size(double.infinity, 50),
            backgroundColor: Colors.blue,
          ),
          child: Text('Login', style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }

  Widget _buildSignUpForm() {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            labelText: 'Full Name',
            border: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
            ),
          ),
        ),
        SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            labelText: 'Email Address',
            border: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
            ),
          ),
        ),
        SizedBox(height: 20),
        TextField(
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Password',
            border: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
            ),
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/home');
          },
          style: ElevatedButton.styleFrom(
            minimumSize: Size(double.infinity, 50),
            backgroundColor: Colors.blue,
          ),
          child: Text('Sign Up', style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}




