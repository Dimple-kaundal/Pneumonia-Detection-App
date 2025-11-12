import 'package:flutter/material.dart';
import 'package:flutter_application_1/AppBar/app_bar_widget.dart';
import 'package:flutter_application_1/Colors/colors.dart';
import 'package:flutter_application_1/utils/responsive.dart';

class StartAusculation extends StatefulWidget {
  const StartAusculation({super.key});

  @override
  State<StartAusculation> createState() => _StartAusculationState();
}

class _StartAusculationState extends State<StartAusculation> {
  @override
  Widget build(BuildContext context) {
    final width = ResponsiveLayout.screenWidth(context);
    final height = ResponsiveLayout.screenHeight(context);

    double cardWidth = ResponsiveLayout.isDesktop(context)
        ? width * 0.5
        : ResponsiveLayout.isTablet(context)
            ? width * 0.7
            : width * 0.9;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const MyAppBar(),
      body: SingleChildScrollView(
        child: Container(
          width: width,
          height: height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.iconColor, Color(0xFFE6EBF0)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 16),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // ---------- INSTRUCTIONS CARD ----------
                Container(
                  width: cardWidth,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12.withOpacity(0.1),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                  child: Column(
                    children: [
                      Text(
                        "Instructions to Use",
                        style: TextStyle(
                          fontSize: ResponsiveLayout.isDesktop(context)
                              ? 26
                              : ResponsiveLayout.isTablet(context)
                                  ? 22
                                  : 18,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF0A2A47),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Divider(thickness: 1, color: Colors.black12),
                      const SizedBox(height: 10),
                      _buildStepItem("Click 'Start Auscultation'."),
                      _buildStepItem(
                          "Choose multiple sound files recorded and named properly."),
                      _buildStepItem("Click Upload > Diagnose."),
                      _buildStepItem(
                          "For next Auscultation, go back to Step 1."),
                          Text(
                            "Sound file should be name as: 'Patient Id_Location.wav' example '10_ALL.wav'",style: TextStyle(color: Colors.red ),
                          )

                    ],
                  ),
                ),

                const SizedBox(height: 10),
                  ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    elevation: 4,
                  ),
                  child: const Text(
                    "Start Ausculation",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
const SizedBox(height: 45),
                // ---------- UPLOAD SECTION ----------
                Container(
                  width: cardWidth,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0A2A47),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26.withOpacity(0.2),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Upload lung auscultation sound files:",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.buttonColor,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4)
                                )
                              ),
                              child: const Text("Choose Files"),
                            ),
                            const SizedBox(width: 10),
                            const Expanded(
                              child: Text(
                                "No file chosen",
                                style: TextStyle(color: Colors.black54),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blueAccent,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4)
                                )
                              ),
                              child: const Text("Submit"),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

        

                // ---------- OUTSIDE BUTTON ----------
             
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStepItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          const Icon(Icons.check_circle_rounded,
              color: Colors.green, size: 22),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
