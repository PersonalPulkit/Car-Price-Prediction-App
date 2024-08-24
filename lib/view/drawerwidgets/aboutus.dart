import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'About Us',
            style: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.0),
          Text(
            'We are a team of passionate individuals who love t o create amazing applications. Our mission is to deliver high-quality, reliable, and efficient solutions that meet our customers\' needs.',
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          SizedBox(height: 16.0),
          Text(
            'Our Team',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.0),
          Text(
            'Our team consists of talented developers, designers, and project managers who work together to bring innovative ideas to life.',
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          Expanded(child: Text("Made in India by _______"))
        ],
      ),
    );
  }
}
