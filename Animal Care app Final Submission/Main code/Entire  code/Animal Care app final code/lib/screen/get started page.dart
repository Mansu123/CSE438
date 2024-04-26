import 'package:flutter/material.dart';
import 'package:untitled/screen/loginpage.dart'; // Import the login page

class GetStartedPage extends StatelessWidget {
  final String imageUrl;

  GetStartedPage({this.imageUrl = 'https://as1.ftcdn.net/v2/jpg/00/48/20/82/1000_F_48208221_NDgF40bLZ1PxQJtEjHx1WyR8npUxaEbo.jpg'}); // Default image URL

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get Started'),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.lightBlue[50], // Light sky background color
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.6, // Set the image height to more than half the screen height
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Navigate to login page after clicking Get Started button
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 64.0),
                  child: Text(
                    'Get Started',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
