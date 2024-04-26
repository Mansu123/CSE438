import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart'; // Import Google Maps library

class SearchAnimalHospitalPage extends StatefulWidget {
  @override
  _SearchAnimalHospitalPageState createState() => _SearchAnimalHospitalPageState();
}

class _SearchAnimalHospitalPageState extends State<SearchAnimalHospitalPage> {
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(37.7749, -122.4194); // Default center coordinates (San Francisco)
  Set<Marker> _markers = {};

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId('AnimalHospital'),
          position: _center,
          infoWindow: InfoWindow(
            title: 'Animal Hospital',
            snippet: '123 Street, City, Country', // Example address
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Animal Hospital'),
      ),
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 14.0,
            ),
            markers: _markers,
          ),
          Positioned(
            top: 16.0,
            left: 16.0,
            right: 16.0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Enter location',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      // Implement search functionality
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
