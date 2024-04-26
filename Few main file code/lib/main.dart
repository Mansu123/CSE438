/* Animal Care App Overview:

  Features:
  1. Pet Shop Finder:
     - Users can find pet shops with product details.
     - Option to search for specific pet shops.
     - View available food shops with image URLs.
     - Navigate to specific pet shop pages (e.g., Pet Corner) to view product images and prices.

  2. Adoption:
     - Create adoption posts.
     - View available adoption posts with pet stories and images.
     - Contact owners through provided options.

  3. Foster Home Finder:
     - View nearby foster homes for pets.
     - Option to share location for personalized results.
     - View home details, services, and contact information.
     - Users can become foster parents by creating posts with service details.

  4. Pet Care Information:
     - Information on common diseases and symptoms.
     - First aid instructions for emergencies.
     - Vaccination schedules and information.

  5. Contact with Vet:
     - Find available online veterinarians.
     - Book appointments with various payment options.
     - Contact vets via video call, call, or text after approval.

  6. Search Animal Hospital:
     - Locate nearby animal hospitals based on user's location.

  7. Donation:
     - Create donation posts for non-profit organizations.
     - Verify details before donations are publicized.
     - Seek help for street animals through posts.

  Navigation:
  - Users log in to the app and are directed to a page with feature buttons.
  - Each feature button leads to a dedicated page for that feature.
  - Users can navigate back to the main page or explore other features from any feature page.

  Additional Notes:
  - Admin verification required for certain actions (e.g., donations).
  - Option for users to seek assistance for street animals.
now write code for the main page by keep this in mind we will have a
log in page containing email password and sing up option with google and apple .
then we will have a home page for the user whrere they can see  the features button
and for all features there will be separate
page so now just do the code for main.dart file that can connect all pages
 */

//now lets make main.dart file code there will be a Home page and log in page as base
// and then we will make separate pages for each feature
import 'package:flutter/material.dart';
import 'package:untitled/screen/get started page.dart'; // Import the get started page

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animal Care App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GetStartedPage(), // Change home to GetStartedPage
    );
  }
}
