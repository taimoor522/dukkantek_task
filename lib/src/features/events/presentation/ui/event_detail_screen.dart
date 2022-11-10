import 'package:dukkantek_task_taimoor/src/core/constants/colors.dart';
import 'package:dukkantek_task_taimoor/src/core/constants/font_size.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/Widgets/spacing.dart';
import '../../domain/entities/event.dart';
import 'events_screen.dart';

class EventDetailScreen extends StatelessWidget {
  final Event event;
  const EventDetailScreen({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(event.title,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: AppFontSize.large, fontWeight: FontWeight.bold)),
            const VerticalSpacing(height: 10),
            Text('description : ${event.description}',
                style: const TextStyle(fontSize: AppFontSize.medium)),
            const VerticalSpacing(height: 10),
            Text('AddrssLine : ${event.address.addressLine}',
                style: const TextStyle(fontSize: AppFontSize.medium)),
            const VerticalSpacing(height: 10),
            Text('City : ${event.address.city}',
                style: const TextStyle(fontSize: AppFontSize.medium)),
            const VerticalSpacing(height: 10),
            Text('Country : ${event.address.country}',
                style: const TextStyle(fontSize: AppFontSize.medium)),
            const VerticalSpacing(height: 10),
            Text('Zip : ${event.address.zip}',
                style: const TextStyle(fontSize: AppFontSize.medium)),
            const VerticalSpacing(height: 10),
            Text('Event Type : ${event.type}',
                style: const TextStyle(fontSize: AppFontSize.medium)),
            const VerticalSpacing(height: 10),
            Text('Utc Date Time : ${DateFormat('yyyy-MM-dd – kk:mm a').format(event.dateTime)}',
                style: const TextStyle(fontSize: AppFontSize.medium)),
            const VerticalSpacing(height: 10),
            const Text('Performers',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: AppFontSize.large, fontWeight: FontWeight.bold)),
            const VerticalSpacing(height: 10),
            Expanded(
              child: ListView.builder(
                  itemBuilder: (c, index) {
                    return ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              event.performer[index].image,
                              fit: BoxFit.cover,
                              loadingBuilder: (context, child, loadingProgress) {
                                if (loadingProgress != null) return const LoadingIndicator();
                                return child;
                              },
                              errorBuilder: (c, o, s) => const Icon(
                                Icons.person,
                                color: AppColors.armyGreen,
                              ),
                            ),
                          ),
                        ),
                      ),
                      title: Text(event.performer[index].name,
                          style: const TextStyle(fontSize: AppFontSize.medium)),
                    );
                  },
                  itemCount: event.performer.length),
            ),
            ElevatedButton(
              onPressed: () {
                try {
                  launchUrl(Uri.parse(event.ticketUrl));
                } catch (_) {}
              },
              child: const Text('Book Now'),
            ),
          ],
        ),
      ),
    );
  }
}
