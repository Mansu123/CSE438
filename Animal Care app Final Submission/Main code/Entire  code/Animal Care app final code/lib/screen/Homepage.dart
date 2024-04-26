import 'package:flutter/material.dart';
import 'package:untitled/screen/pet_shop_finder_page.dart';
import 'package:untitled/screen/adoption_page.dart';
import 'package:untitled/screen/foster_home_finder_page.dart';
import 'package:untitled/screen/pet_care_information_page.dart';
import 'package:untitled/screen/contact_with_vet_page.dart';
import 'package:untitled/screen/search_animal_hospital_page.dart';
import 'package:untitled/screen/donation_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 75,
              backgroundImage: NetworkImage(
                'https://hips.hearstapps.com/hmg-prod/images/dog-puppy-on-garden-royalty-free-image-1586966191.jpg?crop=1xw:0.74975xh;center,top&resize=1200:*', // Placeholder image URL
              ),
            ),
            SizedBox(height: 40),
            FeatureButton(
              title: 'Pet Shop Finder',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PetShopFinderPage()),
                );
              },
            ),
            SizedBox(height: 10),
            FeatureButton(
              title: 'Adoption',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AdoptionPage()),
                );
              },
            ),
            SizedBox(height: 10),
            FeatureButton(
              title: 'Foster Home Finder',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FosterHomeFinderPage()),
                );
              },
            ),
            SizedBox(height: 10),
            FeatureButton(
              title: 'Pet Care Information',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PetCareInformationPage()),
                );
              },
            ),
            SizedBox(height: 10),
            FeatureButton(
              title: 'Contact with Vet',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ContactWithVetPage()),
                );
              },
            ),
            SizedBox(height: 10),
            FeatureButton(
              title: 'Search Animal Hospital',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchAnimalHospitalPage()),
                );
              },
            ),
            SizedBox(height: 10),
            FeatureButton(
              title: 'Donation',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DonationPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class FeatureButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const FeatureButton({
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.all(12), // Reduced padding
          child: Text(
            title,
            style: TextStyle(
              color: Colors.black, // Black text color
              fontSize: 16,
              fontWeight: FontWeight.bold, // Bold text
            ),
          ),
        ),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0), // Rounded rectangular shape
          ),
          backgroundColor: Colors.pink[50], // Baby pink background color
        ),
      ),
    );
  }
}
