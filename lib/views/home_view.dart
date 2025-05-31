import 'package:balanced_meal_app/views/details_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/home.jpg',
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 48,
            left: 24,
            right: 24,
            child: Center(
              child: Text(
                'Balanced Meal',
                textAlign: TextAlign.center,
                style: GoogleFonts.abhayaLibre(
                  fontWeight: FontWeight.w800,
                  fontSize: 48,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Positioned(
            top: 559,
            left: 24,
            right: 24, // Add this to give it horizontal space
            child: Container(
              child: Text(
                'Craft your ideal meal effortlessly with our app. Select nutritious ingredients tailored to your taste and well-being.',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w300,
                  fontSize: 20,
                  color: Colors.white,
                ),
                maxLines: null, // Remove line limit
                overflow: TextOverflow.visible, // Show all content
              ),
            ),
          ),

          Positioned(
            top: 709,
            left: 24,
            right: 24,
            child: Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(12),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 18),
                  fixedSize: Size(327, 60),
                  backgroundColor: Colors.deepOrangeAccent,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DetailsView()),
                  );
                },
                child: Text(
                  'Order food',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
