import 'package:flutter/material.dart';

import '../../data/donor_data.dart';
import '../../widgets/blood_group_chip.dart';
import '../../widgets/donor_card.dart';

class FindDonorScreen extends StatefulWidget {
  const FindDonorScreen({super.key});

  @override
  State<FindDonorScreen> createState() => _FindDonorScreenState();
}

class _FindDonorScreenState extends State<FindDonorScreen> {
  String searchText = "";
  String selectedGroup = "All";

  @override
  Widget build(BuildContext context) {
    final filteredDonors = donorList.where((donor) {
      final bloodGroup = donor["bloodGroup"]!;
      final name = donor["name"]!;
      final location = donor["location"]!;

      final matchesSearch =
          bloodGroup.toLowerCase().contains(searchText.toLowerCase()) ||
          name.toLowerCase().contains(searchText.toLowerCase()) ||
          location.toLowerCase().contains(searchText.toLowerCase());

      final matchesGroup =
          selectedGroup == "All" || bloodGroup == selectedGroup;

      return matchesSearch && matchesGroup;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Find Blood Donor"),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Search blood group or location",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  searchText = value;
                });
              },
            ),

            const SizedBox(height: 15),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  BloodGroupChip(
                    label: "All",
                    isSelected: selectedGroup == "All",
                    onTap: () {
                      setState(() {
                        selectedGroup = "All";
                      });
                    },
                  ),
                  BloodGroupChip(
                    label: "A+",
                    isSelected: selectedGroup == "A+",
                    onTap: () {
                      setState(() {
                        selectedGroup = "A+";
                      });
                    },
                  ),
                  BloodGroupChip(
                    label: "B+",
                    isSelected: selectedGroup == "B+",
                    onTap: () {
                      setState(() {
                        selectedGroup = "B+";
                      });
                    },
                  ),
                  BloodGroupChip(
                    label: "O+",
                    isSelected: selectedGroup == "O+",
                    onTap: () {
                      setState(() {
                        selectedGroup = "O+";
                      });
                    },
                  ),
                  BloodGroupChip(
                    label: "AB+",
                    isSelected: selectedGroup == "AB+",
                    onTap: () {
                      setState(() {
                        selectedGroup = "AB+";
                      });
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: filteredDonors.length,
                itemBuilder: (context, index) {
                  final donor = filteredDonors[index];

                  return DonorCard(
                    bloodGroup: donor["bloodGroup"]!,
                    name: donor["name"]!,
                    location: donor["location"]!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
