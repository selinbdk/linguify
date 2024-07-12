import 'package:flutter/material.dart';
import 'package:linguify/theme/app_colors.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundcolor,
      body: Column(
        children: [
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(width: 90,
              ),
              const Text(
                "LINGUIFY",
                style: TextStyle(
                  fontSize: 30,
                  color: AppColors.text,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(
                child: Image.asset(
                  "/Users/sedat/Desktop/selin/flutter_selin/linguify/lib/images/linguify_logo.jpeg",
                  scale: 10,
                ),
              ),
            ],
          ),

            

          



          
        ],
      ),
    );
  }
}
