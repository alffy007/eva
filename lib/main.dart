import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Progress Dashboard',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
      ),
      home: const MyHomePage(title: 'EVA-01 Student Progress'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xfff4f4f4),
      appBar: AppBar(
        backgroundColor: const Color(0xfff4f4f4),
        elevation: 2,
        title: Text(
          widget.title,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left Sidebar (Terminal)
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Activities",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    height: screenHeight * 0.75,
                    width: 400,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ListView(children: [
                        buildListCard(
                          "Studying ASIC Design Flow",
                          Icons.design_services,
                          Colors.blue,
                        ),
                        buildListCard(
                          "Studying ASIC Design Flow",
                          Icons.design_services,
                          Colors.blue,
                        ),
                        buildListCard(
                          "Studying ASIC Design Flow",
                          Icons.design_services,
                          Colors.blue,
                        ),
                        buildListCard(
                          "Studying ASIC Design Flow",
                          Icons.design_services,
                          Colors.blue,
                        ),
                        buildListCard(
                          "Studying ASIC Design Flow",
                          Icons.design_services,
                          Colors.blue,
                        ),
                        buildListCard(
                          "Studying ASIC Design Flow",
                          Icons.design_services,
                          Colors.blue,
                        ),
                        buildListCard(
                          "Studying ASIC Design Flow",
                          Icons.design_services,
                          Colors.blue,
                        ),
                      ]),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            // Right Content (Cards)
            Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Metrics Overview",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: screenWidth > 800
                          ? 3
                          : 2, // Adjust grid for screen size
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 1.2,
                      children: [
                        _buildMetricCard(
                          title: "Attention Span",
                          value: "85%",
                          icon: Icons.visibility,
                          color: Colors.blueAccent,
                        ),
                        _buildMetricCard(
                          title: "Activity Levels",
                          value: "Moderate",
                          icon: Icons.directions_run,
                          color: Colors.green,
                        ),
                        _buildMetricCard(
                          title: "Emotion Detection",
                          value: "Happy",
                          icon: Icons.emoji_emotions,
                          color: Colors.orange,
                        ),
                        _buildMetricCard(
                          title: "Focus Time",
                          value: "3h 45m",
                          icon: Icons.access_time,
                          color: Colors.purple,
                        ),
                        _buildMetricCard(
                          title: "Break Time",
                          value: "1h 15m",
                          icon: Icons.coffee,
                          color: Colors.brown,
                        ),
                        _buildMetricCard(
                          title: "Distractions",
                          value: "Low",
                          icon: Icons.block,
                          color: Colors.redAccent,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildListCard(String text, IconData icon, Color color) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: color.withOpacity(0.2),
            child: Icon(
              icon,
              size: 24,
              color: color,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.poppins(
                color: Colors.black87,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMetricCard({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 10,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: color.withOpacity(0.2),
              child: Icon(icon, color: color),
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.grey.shade800,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
