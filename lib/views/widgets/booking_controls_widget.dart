import 'package:flutter/material.dart';

class BookingControlsWidget extends StatelessWidget {
  final DateTime selectedDate;
  final String selectedPackage;
  final bool isDarkMode;
  final ValueChanged<DateTime> onDateChanged;
  final ValueChanged<String?> onPackageChanged;
  final ValueChanged<bool> onThemeToggled;

  const BookingControlsWidget({
    Key? key,
    required this.selectedDate,
    required this.selectedPackage,
    required this.isDarkMode,
    required this.onDateChanged,
    required this.onPackageChanged,
    required this.onThemeToggled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Trip Preferences', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              const Divider(),
              ListTile(
                title: const Text('Cruise Date'),
                subtitle: Text("${selectedDate.day}/${selectedDate.month}/${selectedDate.year}"),
                trailing: const Icon(Icons.calendar_today),
                onTap: () async {
                  DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: selectedDate,
                    firstDate: DateTime(2025),
                    lastDate: DateTime(2030),
                  );
                  if (picked != null) onDateChanged(picked);
                },
              ),
              ListTile(
                title: const Text('Transport Mode'),
                trailing: DropdownButton<String>(
                  value: selectedPackage,
                  items: ['Express Boat', 'Private River Cruise', 'Sunset Cruise', 'Sunrise Cruise', 'SMI Park Cruise']
                      .map((pkg) => DropdownMenuItem(value: pkg, child: Text(pkg)))
                      .toList(),
                  onChanged: onPackageChanged,
                ),
              ),
              SwitchListTile(
                title: const Text('Dark Mode Theme'),
                value: isDarkMode,
                onChanged: onThemeToggled,
              ),
            ],
          ),
        ),
      ),
    );
  }
}