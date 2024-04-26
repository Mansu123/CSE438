import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class FosterHomeFinderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Foster Home Finder'),
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
                'Create Foster Home Post',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  _createFosterHomePost(context);
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
                'Available Foster Home Posts',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 16.0),
              Expanded(
                child: ListView.builder(
                  itemCount: 3, // Number of available foster home posts
                  itemBuilder: (context, index) {
                    // Replace with foster home post data from database or API
                    return FosterHomePost(
                      fosterHomeName: 'Foster Home $index',
                      location: 'City, Country',
                      services: 'Service details here',
                      price: '\$XX.XX per day',
                      food: 'Type of food provided',
                      imageURL: 'https://as2.ftcdn.net/v2/jpg/03/72/34/75/1000_F_372347566_X8kOj84u51oTyGzxga9Vh68k8Elwqv3D.jpg', // Different image URL for each foster home
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

  void _createFosterHomePost(BuildContext context) async {
    TextEditingController _houseNameController = TextEditingController();
    TextEditingController _storyController = TextEditingController();

    File? _image;

    final picker = ImagePicker();

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text('Create Foster Home Post'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: _houseNameController,
                    decoration: InputDecoration(
                      hintText: 'Enter house name',
                    ),
                  ),
                  SizedBox(height: 16.0),
                  TextField(
                    controller: _storyController,
                    decoration: InputDecoration(
                      hintText: 'Enter story',
                    ),
                    maxLines: 3,
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () async {
                      final pickedFile = await picker.getImage(source: ImageSource.gallery);
                      setState(() {
                        if (pickedFile != null) {
                          _image = File(pickedFile.path);
                        }
                      });
                    },
                    child: Text('Upload Image'),
                  ),
                  if (_image != null) Image.file(_image!),
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
                    // Add functionality to submit the foster home post
                    Navigator.of(context).pop();
                  },
                  child: Text('Submit'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}

class FosterHomePost extends StatelessWidget {
  final String fosterHomeName;
  final String location;
  final String services;
  final String price;
  final String food;
  final String imageURL;

  FosterHomePost({
    required this.fosterHomeName,
    required this.location,
    required this.services,
    required this.price,
    required this.food,
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
                  fosterHomeName,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Location: $location',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Services: $services',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Price: $price',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Food: $food',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
