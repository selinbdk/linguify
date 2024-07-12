import 'package:flutter/material.dart';
import 'package:linguify/core/components/text_box_widget.dart';
import 'package:linguify/theme/app_theme.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late final TextEditingController controller1;

  late final TextEditingController controller2;

  @override
  void initState() {
    controller1 = TextEditingController();
    controller2 = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: AppPadding.pagePadding,
          child: Column(
            children: [
              //* Logo
              SizedBox(
                height: 200,
                child: Image.asset(
                  "/Users/sedat/Desktop/selin/flutter_selin/linguify/lib/images/linguify_logo.jpeg",
                ),
              ),

              AppSpacing.smallVerticalSpace,

              //* Input Field
              SizedBox(
                height: 175,
                child: TextBoxWidget(
                  controller: controller1,
                  hintText: "Start translation",
                ),
              ),

              const Divider(
                height: 40,
                thickness: 1,
                color: AppColors.dividercolor,
              ),

              //* Input Field
              SizedBox(
                height: 175,
                child: TextBoxWidget(
                  controller: controller2,
                  hintText: "Output",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
