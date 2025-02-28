import 'package:flutter/material.dart';
import 'recycler_form_page.dart';
import 'color.dart';

class RecyclerCollaborationPage extends StatefulWidget {
  const RecyclerCollaborationPage({Key? key}) : super(key: key);

  @override
  _RecyclerCollaborationPageState createState() => _RecyclerCollaborationPageState();
}

class _RecyclerCollaborationPageState extends State<RecyclerCollaborationPage> {
  List<Map<String, String>> recyclers = [
    {"name": "Eco Recyclers", "location": "Mumbai", "services": "E-Waste, Metal, Batteries"},
    {"name": "GreenCycle Pvt Ltd", "location": "Delhi", "services": "Plastics, Electronics"},
    {"name": "Waste Warriors", "location": "Bangalore", "services": "Paper, Cardboard, Glass"},
    {"name": "CleanTech Solutions", "location": "Chennai", "services": "Industrial Waste, Chemicals"},
  ];

  void _addNewRecycler(Map<String, String> recycler) {
    setState(() {
      recyclers.add(recycler);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.primary,
        title: const Text(
          "Recycler Collaboration Network",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline, color: Colors.white),
            onPressed: () {
              _showInfoDialog(context);
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            color: AppColors.primaryContainer,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Local Recycler Partners",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textDark,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Connect with certified recyclers in your area for sustainable waste management",
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.textLight,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12.0),
              itemCount: recyclers.length,
              itemBuilder: (context, index) {
                final recycler = recyclers[index];
                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.only(bottom: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  color: AppColors.surfaceColor,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: AppColors.primaryLight,
                              child: Icon(
                                Icons.recycling,
                                color: AppColors.surfaceColor,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    recycler["name"]!,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.textDark,
                                    ),
                                  ),
                                  Text(
                                    "Location: ${recycler["location"]}",
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: AppColors.textMuted,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.message_outlined,
                                color: AppColors.primary,
                              ),
                              onPressed: () {
                                // Contact functionality
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.backgroundLight,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Services Offered:",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.textDark,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Wrap(
                                spacing: 6,
                                children: (recycler["services"] ?? "")
                                    .split(", ")
                                    .map((service) => Chip(
                                          label: Text(
                                            service,
                                            style: const TextStyle(fontSize: 12),
                                          ),
                                          backgroundColor: AppColors.accentContainer,
                                          labelStyle: const TextStyle(color: AppColors.textDark),
                                          padding: const EdgeInsets.all(0),
                                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                        ))
                                    .toList(),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton.icon(
                              icon: const Icon(Icons.calendar_today, size: 16),
                              label: const Text("Schedule Pickup"),
                              style: TextButton.styleFrom(
                                foregroundColor: AppColors.primary,
                              ),
                              onPressed: () {
                                // Schedule functionality
                              },
                            ),
                            const SizedBox(width: 8),
                            TextButton.icon(
                              icon: const Icon(Icons.star_outline, size: 16),
                              label: const Text("Rate"),
                              style: TextButton.styleFrom(
                                foregroundColor: AppColors.primary,
                              ),
                              onPressed: () {
                                // Rating functionality
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RecyclerFormPage(),
            ),
          );
          
          if (result != null && result is Map<String, String>) {
            _addNewRecycler(result);
          }
        },
        backgroundColor: AppColors.primary,
        label: const Text("Add Recycler"),
        icon: const Icon(Icons.add),
      ),
    );
  }

  void _showInfoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("About Recycler Collaboration"),
        content: const SingleChildScrollView(
          child: Text(
            "This platform connects individuals and organizations with certified recyclers to promote sustainable waste management practices. "
            "You can collaborate with existing recyclers or register as a new recycler partner to contribute to environmental conservation efforts.",
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Close"),
            style: TextButton.styleFrom(
              foregroundColor: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}