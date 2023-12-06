import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Shuffle Images in GridView Example'),
        ),
        body: ShuffledImageGrid(),
      ),
    );
  }
}

class ShuffledImageGrid extends StatefulWidget {
  @override
  _ShuffledImageGridState createState() => _ShuffledImageGridState();
}

class _ShuffledImageGridState extends State<ShuffledImageGrid> {
  final List<String> jacketImages = [
    'https://i.pinimg.com/236x/c9/08/14/c908146a692388352057a170f1e960f1.jpg',
    'https://i.pinimg.com/236x/c9/08/14/c908146a692388352057a170f1e960f1.jpg',
    'https://i.pinimg.com/236x/93/68/a7/9368a7920e12067340554e056f736fb2.jpg',
    'https://i.pinimg.com/236x/d6/39/99/d639997c8e26c2e738a012b552dea5fd.jpg',
    'https://i.pinimg.com/236x/f9/68/b9/f968b94c755f444dbbddad3ef04b24e8.jpg'
    // Add more jacket image URLs as needed
  ];

  final List<String> shoeImages = [
    'https://i.pinimg.com/236x/5d/46/d6/5d46d6deed3b06ffa69ea4abe825c8da.jpg',
    'https://i.pinimg.com/236x/e9/ba/cf/e9bacfd5803bcee4088cbbb353783f33.jpg',
    'https://i.pinimg.com/236x/a8/3c/7a/a83c7ac1ca5a595f696b408ad8fceebe.jpg',
    // Add more shirt image URLs as needed
  ];

  final List<String> shirtImages = [
    'https://i.pinimg.com/236x/8d/15/65/8d1565e65ef2487790744508a4a3bfe5.jpg',
    'https://i.pinimg.com/236x/7f/30/54/7f305481b8a9c80ae88bfa7bbecc4af2.jpg',
    'https://i.pinimg.com/236x/76/3c/b5/763cb5c95b24efb566390bc25237e05c.jpg',
    // Add more shoe image URLs as needed
  ];

  List<String> shuffledImages = [];
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _shuffleImages();
    // Start a timer to change the image every 5 seconds
    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      _changeImage();
    });
  }

  void _shuffleImages() {
    setState(() {
      jacketImages.shuffle();
      shirtImages.shuffle();
      shoeImages.shuffle();

      // Combine shuffled images from different categories
      shuffledImages = [
        ...jacketImages,
        ...shirtImages,
        ...shoeImages,
      ];

      currentIndex = 0;
    });
  }

  void _changeImage() {
    setState(() {
      currentIndex = (currentIndex + 1) % shuffledImages.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: shuffledImages.length,
      itemBuilder: (context, index) {
        return Image.network(
          shuffledImages[index],
          width: 150.0,
          height: 150.0,
          fit: BoxFit.cover,
        );
      },
    );
  }
}
