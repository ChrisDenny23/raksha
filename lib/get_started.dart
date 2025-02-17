import 'package:flutter/material.dart';
import 'package:raksha/login.dart';
import 'package:raksha/mybutton.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/bg1.jpg"), // Background image
            fit: BoxFit.fill,
          ),
        ),
        child: Stack(
          children: [
            // Centered content
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Logo Image
                  Image.asset(
                    "images/rakshalogo.png",
                    height: 150,
                    width: 150,
                  ),
                  const SizedBox(height: 10),

                  // Slogan and App Name
                  const Text(
                    "RAKSHA",
                    style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'quickie'),
                  ),
                  const Text(
                    "CONNECTING HELP WITH HOPE",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'quickie'),
                  ),
                ],
              ),
            ),
            // Bottom-centered buttonz
            Positioned(
              bottom: 120, // Distance from the bottom
              left: 0,
              right: 0,
              child: Center(
                child: Mybutton(
                  text: "Get Started",
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (context) => LoginSignupModal(),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
