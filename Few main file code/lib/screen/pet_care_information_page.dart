import 'package:flutter/material.dart';

class PetCareInformationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pet Care Information'),
      ),
      body: Container(
        color: Colors.lightBlue[100],
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            _buildCategoryCard(
              context,
              category: 'Common Diseases and Symptoms',
              description: 'Information on common diseases and their symptoms for pets.',
              icon: Icons.healing,
              onTap: () {
                // Navigate to symptoms page
                Navigator.push(context, MaterialPageRoute(builder: (context) => SymptomsPage()));
              },
            ),
            SizedBox(height: 16.0),
            _buildCategoryCard(
              context,
              category: 'First Aid for Emergencies',
              description: 'First aid instructions for emergencies related to various diseases.',
              icon: Icons.medical_services,
              onTap: () {
                // Navigate to first aid page
                Navigator.push(context, MaterialPageRoute(builder: (context) => FirstAidPage()));
              },
            ),
            SizedBox(height: 16.0),
            _buildCategoryCard(
              context,
              category: 'Vaccination Schedules',
              description: 'Vaccination schedules and information for dogs and cats.',
              icon: Icons.local_hospital,
              onTap: () {
                // Navigate to vaccination page
                Navigator.push(context, MaterialPageRoute(builder: (context) => VaccinationPage()));
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCard(BuildContext context, {required String category, required String description, required IconData icon, required VoidCallback onTap}) {
    return Card(
      elevation: 4.0,
      child: ListTile(
        leading: Icon(
          icon,
          size: 48.0,
          color: Theme.of(context).primaryColor,
        ),
        title: Text(category, style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
        subtitle: Text(description),
        onTap: onTap,
      ),
    );
  }
}

class SymptomsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Symptoms'),
      ),
      body: Container(
        color: Colors.pink[50],
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            _buildSymptomItem(context, disease: 'Fever', symptom: 'High body temperature, lethargy, loss of appetite'),
            _buildSymptomItem(context, disease: 'Cough', symptom: 'Persistent coughing, difficulty breathing'),
            _buildSymptomItem(context, disease: 'Diarrhea', symptom: 'Watery stools, vomiting, dehydration'),
            // Add more symptom items as needed
          ],
        ),
      ),
    );
  }

  Widget _buildSymptomItem(BuildContext context, {required String disease, required String symptom}) {
    return Card(
      elevation: 4.0,
      child: ListTile(
        title: Text(disease),
        subtitle: Text(symptom),
      ),
    );
  }
}

class FirstAidPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Aid'),
      ),
      body: Container(
        color: Colors.pink[50],
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            _buildFirstAidItem(context, disease: 'Burns', firstAid: 'Cool the affected area with water, cover with sterile bandage'),
            _buildFirstAidItem(context, disease: 'Bleeding', firstAid: 'Apply pressure to stop bleeding, elevate wound if possible'),
            _buildFirstAidItem(context, disease: 'Choking', firstAid: 'Perform Heimlich maneuver, check airway for obstruction'),
            // Add more first aid items as needed
          ],
        ),
      ),
    );
  }

  Widget _buildFirstAidItem(BuildContext context, {required String disease, required String firstAid}) {
    return Card(
      elevation: 4.0,
      child: ListTile(
        title: Text(disease),
        subtitle: Text(firstAid),
      ),
    );
  }
}

class VaccinationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vaccination Schedule'),
      ),
      body: Container(
        color: Colors.pink[50],
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            _buildVaccinationItem(context, pet: 'Dog', vaccine: 'Rabies Vaccine', schedule: 'Every 1-3 years'),
            _buildVaccinationItem(context, pet: 'Dog', vaccine: 'Distemper Vaccine', schedule: 'Every 1-3 years'),
            _buildVaccinationItem(context, pet: 'Cat', vaccine: 'Rabies Vaccine', schedule: 'Every 1-3 years'),
            _buildVaccinationItem(context, pet: 'Cat', vaccine: 'Feline Leukemia Vaccine', schedule: 'Every 1-3 years'),
            // Add more vaccination items as needed
          ],
        ),
      ),
    );
  }

  Widget _buildVaccinationItem(BuildContext context, {required String pet, required String vaccine, required String schedule}) {
    return Card(
      elevation: 4.0,
      child: ListTile(
        title: Text('$pet - $vaccine'),
        subtitle: Text('Schedule: $schedule'),
      ),
    );
  }
}
