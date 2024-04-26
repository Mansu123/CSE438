import 'package:flutter/material.dart';

class AdoptionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adoption'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Add functionality for search
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.lightBlue[100],
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Create Adoption Post',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  _createAdoptionPost(context);
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
                'Available Adoption Posts',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 16.0),
              Expanded(
                child: ListView.builder(
                  itemCount: 3, // Number of available adoption posts
                  itemBuilder: (context, index) {
                    // Replace with adoption post data from database or API
                    return AdoptionPost(
                      petName: 'Buddy',
                      petImageURL: 'https://t3.ftcdn.net/jpg/01/93/17/72/240_F_193177287_MoePmN9oepxLTvycGQiVLQ3W68KLrm73.jpg',
                      petStory: 'Buddy is a friendly and playful dog looking for a loving home.',
                      foodHabit: 'Buddy loves chicken and rice.',
                      pottyTrained: true,
                      contactEmail: 'example@example.com',
                      contactPhone: '+1234567890',
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

  void _createAdoptionPost(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Create Adoption Post'),
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
                  hintText: 'Enter pet story',
                ),
                maxLines: 3,
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  // Add functionality to upload image
                },
                child: Text('Upload Image'),
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
                // Add functionality to submit the post
                Navigator.of(context).pop();
              },
              child: Text('Submit'),
            ),
          ],
        );
      },
    );
  }
}

class AdoptionPost extends StatelessWidget {
  final String petName;
  final String petImageURL;
  final String petStory;
  final String foodHabit;
  final bool pottyTrained;
  final String contactEmail;
  final String contactPhone;

  const AdoptionPost({
    required this.petName,
    required this.petImageURL,
    required this.petStory,
    required this.foodHabit,
    required this.pottyTrained,
    required this.contactEmail,
    required this.contactPhone,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            petImageURL,
            width: double.infinity,
            height: 200.0,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pet Name: $petName',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                Text('Story: $petStory'),
                SizedBox(height: 8.0),
                Text('Food Habit: $foodHabit'),
                SizedBox(height: 8.0),
                Text('Potty Trained: ${pottyTrained ? 'Yes' : 'No'}'),
                SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        // Add functionality to contact via email
                      },
                      child: Text('Contact via Email'),
                    ),
                    TextButton(
                      onPressed: () {
                        // Add functionality to contact via phone
                      },
                      child: Text('Contact via Phone'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
