import 'package:flutter/material.dart';
import '../viewmodels/cruise_booking_viewmodel.dart';
import 'widgets/header_image_widget.dart';
import 'widgets/title_section_widget.dart';
import 'widgets/action_bar_widget.dart';
import 'widgets/description_widget.dart';
import 'widgets/booking_controls_widget.dart';

class CruiseBookingScreen extends StatelessWidget {
  final CruiseBookingViewModel viewModel;

  const CruiseBookingScreen({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sibu River Cruise & Heritage'),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.landscape) {
            //Landscape mode
            return Row(
              children: [
                Expanded(
                  flex: 1,
                  child: SingleChildScrollView(
                    child: HeaderImageWidget(imageUrl: viewModel.destination.imageUrl),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        TitleSectionWidget(
                          name: viewModel.destination.name,
                          location: viewModel.destination.location,
                          ratingCount: viewModel.destination.ratingCount,
                          onStarPressed: viewModel.incrementRating,
                        ),
                        const ActionBarWidget(),
                        DescriptionWidget(description: viewModel.destination.description),
                        BookingControlsWidget(
                          selectedDate: viewModel.selectedDate,
                          selectedPackage: viewModel.selectedPackage,
                          isDarkMode: viewModel.isDarkMode,
                          onDateChanged: viewModel.updateDate,
                          onPackageChanged: viewModel.updatePackage,
                          onThemeToggled: viewModel.toggleTheme,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else {
            // Portrait mode
            return ListView(
              children: [
                HeaderImageWidget(imageUrl: viewModel.destination.imageUrl),
                TitleSectionWidget(
                  name: viewModel.destination.name,
                  location: viewModel.destination.location,
                  ratingCount: viewModel.destination.ratingCount,
                  onStarPressed: viewModel.incrementRating,
                ),
                const ActionBarWidget(),
                DescriptionWidget(description: viewModel.destination.description),
                BookingControlsWidget(
                  selectedDate: viewModel.selectedDate,
                  selectedPackage: viewModel.selectedPackage,
                  isDarkMode: viewModel.isDarkMode,
                  onDateChanged: viewModel.updateDate,
                  onPackageChanged: viewModel.updatePackage,
                  onThemeToggled: viewModel.toggleTheme,
                ),
              ],
            );
          }
        },
      ),
    );
  }
}