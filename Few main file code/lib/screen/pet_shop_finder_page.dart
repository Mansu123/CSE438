import 'package:flutter/material.dart';

class PetShopFinderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pet Shop Finder'),
      ),
      backgroundColor: Colors.pink[50], // Set background color to baby pink
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          PetShopItem(
            shopName: 'Pet Corner',
            productImageURL: 'https://as1.ftcdn.net/v2/jpg/02/72/92/40/1000_F_272924092_IhPcJtGqD3cHcomwtGqAsZ34GgNENkYW.jpg',
            productDetails: 'Product Details: Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            location: '1234 Main St, City, Country', // Location details
            phoneNumber: '+1234567890', // Phone number
          ),
          SizedBox(height: 16.0),
          PetShopItem(
            shopName: 'Pet Haven',
            productImageURL: 'https://as1.ftcdn.net/v2/jpg/06/00/98/62/1000_F_600986226_vZqxpraF9mTn0RZdOD8TgDOVMtAR21uZ.jpg',
            productDetails: 'Product Details: Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
            location: '5678 Elm St, City, Country', // Location details
            phoneNumber: '+0987654321', // Phone number
          ),
          SizedBox(height: 16.0),
          PetShopItem(
            shopName: 'Pet Paradise',
            productImageURL: 'https://as2.ftcdn.net/v2/jpg/03/12/84/89/1000_F_312848906_cxG09JQbnzeJgQqx6wEpV0I6BLPrDftg.jpg',
            productDetails: 'Product Details: Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
            location: '2468 Pine St, City, Country', // Location details
            phoneNumber: '+1357924680', // Phone number
          ),
        ],
      ),
    );
  }
}

class PetShopItem extends StatelessWidget {
  final String shopName;
  final String productImageURL;
  final String productDetails;
  final String location;
  final String phoneNumber;

  const PetShopItem({
    required this.shopName,
    required this.productImageURL,
    required this.productDetails,
    required this.location,
    required this.phoneNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: ListTile(
        leading: SizedBox(
          width: 100.0,
          height: 100.0,
          child: Image.network(
            productImageURL,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(shopName),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(productDetails),
            SizedBox(height: 8.0),
            Text('Location: $location'),
            Text('Phone: $phoneNumber'),
          ],
        ),
        onTap: () {
          // Navigate to specific pet shop page
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PetShopDetailPage(shopName: shopName)),
          );
        },
      ),
    );
  }
}

class PetShopDetailPage extends StatelessWidget {
  final String shopName;

  const PetShopDetailPage({
    required this.shopName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(shopName),
      ),
      backgroundColor: Colors.pink[50], // Set background color to baby pink
      body: PetShopProductList(),
    );
  }
}

class PetShopProductList extends StatefulWidget {
  @override
  _PetShopProductListState createState() => _PetShopProductListState();
}

class _PetShopProductListState extends State<PetShopProductList> {
  final List<ProductItem> _products = [
    ProductItem(
      productName: 'Dog Food',
      productImageURL: 'https://m.media-amazon.com/images/I/41vlTxXQD7L._SX300_SY300_QL70_FMwebp_.jpg',
      price: '\$10.99',
      discount: '15%', // Discount details
    ),
    ProductItem(
      productName: 'Cat Toys',
      productImageURL: 'https://m.media-amazon.com/images/I/41UAyK8Z3OL._SX300_SY300_QL70_FMwebp_.jpg',
      price: '\$5.99',
      discount: '10%', // Discount details
    ),
    ProductItem(
      productName: 'Cat Food',
      productImageURL: 'https://m.media-amazon.com/images/I/41Zi5kqjxvL._SX300_SY300_QL70_FMwebp_.jpg',
      price: '\$8.99',
      discount: '20%', // Discount details
    ),
    ProductItem(
      productName: 'Dog Toy',
      productImageURL: 'https://m.media-amazon.com/images/I/31+VGx6aOML._SY300_SX300_.jpg',
      price: '\$7.99',
      discount: '12%', // Discount details
    ),
    ProductItem(
      productName: 'Cat Belt',
      productImageURL: 'https://m.media-amazon.com/images/I/51tKS5G1O4L._SX300_SY300_QL70_FMwebp_.jpg',
      price: '\$3.99',
      discount: '8%', // Discount details
    ),
    // Add more ProductItems as needed
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _products.length,
      itemBuilder: (context, index) {
        return _products[index];
      },
    );
  }
}

class ProductItem extends StatelessWidget {
  final String productName;
  final String productImageURL;
  final String price;
  final String discount;

  const ProductItem({
    required this.productName,
    required this.productImageURL,
    required this.price,
    required this.discount,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: ListTile(
        leading: SizedBox(
          width: 80.0,
          height: 80.0,
          child: Image.network(
            productImageURL,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(productName),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Price: $price'),
            Text('Discount: $discount'),
          ],
        ),
        onTap: () {
          // Add functionality for tapping on a product
        },
      ),
    );
  }
}
