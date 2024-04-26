import 'package:flutter/material.dart';

class DonationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Donation'),
      ),
      body: Container(
        color: Colors.lightBlue[100],
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Create Donation Post',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // Navigate to create donation post page
                  _showCreateDonationDialog(context);
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                  child: Text(
                    'Create Post',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
              ),
              SizedBox(height: 32.0),
              Text(
                'Available Donation Posts',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 16.0),
              Expanded(
                child: ListView.builder(
                  itemCount: 3, // Number of available donation posts
                  itemBuilder: (context, index) {
                    // Replace with donation post data from database or API
                    return DonationPost(
                      organizationName: 'Organization $index',
                      details: 'Details about the donation post go here',
                      imageURL: 'https://as2.ftcdn.net/v2/jpg/00/80/83/19/1000_F_80831998_rQWiDRGbDaWJcyIE22G3ompmJDtnobWW.jpg', // Placeholder image URL
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showCreateDonationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Create Donation Post'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter pet name',
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter story',
                ),
                maxLines: 3,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                // Implement logic to create donation post
                Navigator.of(context).pop();
              },
              child: Text('Create'),
            ),
          ],
        );
      },
    );
  }
}

class DonationPost extends StatelessWidget {
  final String organizationName;
  final String details;
  final String imageURL;

  DonationPost({
    required this.organizationName,
    required this.details,
    required this.imageURL,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            imageURL,
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  organizationName,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  details,
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 8.0),
                ElevatedButton(
                  onPressed: () {
                    // Implement logic to make donation
                  },
                  child: Text('Make Donation'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
