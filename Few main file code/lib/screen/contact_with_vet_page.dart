import 'package:flutter/material.dart';

class ContactWithVetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact with Vet'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Implement search functionality
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Available Online Veterinarians',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.lightBlue[100],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                'Find the best veterinarians available online. Book appointments with various payment options.',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            SizedBox(height: 16.0),
            _buildDoctorList(context),
          ],
        ),
      ),
    );
  }

  Widget _buildDoctorList(BuildContext context) {
    return Column(
      children: [
        _buildDoctorItem(
          context,
          vetName: 'Dr. John Doe',
          image: 'https://as1.ftcdn.net/v2/jpg/02/01/41/98/1000_F_201419808_mCqd8ndCLuzUpZe91KImLGURhJyv22oe.jpg',
          details: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
        ),
        SizedBox(height: 16.0),
        _buildDoctorItem(
          context,
          vetName: 'Dr. Maria',
          image: 'https://as2.ftcdn.net/v2/jpg/06/32/51/69/1000_F_632516921_FuyFavolkc5xwdXnC16WPcPoQGX2aob9.jpg',
          details: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
        ),
        SizedBox(height: 16.0),
        _buildDoctorItem(
          context,
          vetName: 'Dr. Michael Johnson',
          image: 'https://as2.ftcdn.net/v2/jpg/06/32/51/69/1000_F_632516929_J0FmJ0WLaf0KNCRhp1hp75az14dcn9GW.jpg',
          details: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
        ),
      ],
    );
  }

  Widget _buildDoctorItem(BuildContext context, {required String vetName, required String image, required String details}) {
    return Card(
      elevation: 4.0,
      child: ListTile(
        leading: CircleAvatar(
          radius: 60.0, // Increased radius for larger image
          backgroundImage: NetworkImage(image),
        ),
        title: Text(vetName, style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
        subtitle: Text(details),
        trailing: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => PaymentPage()),
            );
          },
          child: Text('Book Appointment'),
        ),
      ),
    );
  }
}

class PaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
      ),
      body: Container(
        color: Colors.lightBlue[100],
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Choose Payment Method',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Implement PayPal payment
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                child: Text(
                  'Pay with PayPal',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Implement Credit Card payment
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                child: Text(
                  'Pay with Credit Card',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
