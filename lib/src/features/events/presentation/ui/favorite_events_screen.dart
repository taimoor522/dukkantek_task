import 'package:dukkantek_task_taimoor/src/features/events/presentation/state/event_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/colors.dart';

class FavoriteEventScreen extends StatelessWidget {
  const FavoriteEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.armyGreen,
        title: const Text('Favorite Events'),
      ),
      body: ListView(
        children: context.read<EventCubit>().favoriteEvents.map((e) {
          return ListTile(
            leading: const Icon(Icons.event, color: AppColors.armyGreen),
            title: Text(e.title),
          );
        }).toList(),
      ),
    );
  }
}
