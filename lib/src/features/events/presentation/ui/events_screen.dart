import 'package:dukkantek_task_taimoor/src/core/Widgets/spacing.dart';
import 'package:dukkantek_task_taimoor/src/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/font_size.dart';
import '../state/event_cubit.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({super.key});

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  @override
  void initState() {
    super.initState();
    context.read<EventCubit>().loadEvents();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const MyTextFiels(
                hintText: 'Search Event',
              ),
              const VerticalSpacing(height: 10),
              Expanded(
                child: BlocBuilder<EventCubit, EventState>(
                  builder: (context, state) {
                    if (state is EventLoading) return const LoadingIndicator();
                    if (state is Eventloaded) {
                      return ListView.builder(
                        itemCount: state.events.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              leading: const Icon(Icons.event, color: AppColors.armyGreen),
                              title: Text(state.events[index].title),
                              trailing: GestureDetector(
                                onTap: () {
                                  if (context
                                      .read<EventCubit>()
                                      .favoriteEvents
                                      .any((event) => event.id == state.events[index].id)) {
                                    context
                                        .read<EventCubit>()
                                        .removeFromFavorite(state.events[index]);
                                  } else {
                                    context.read<EventCubit>().addToFavorite(state.events[index]);
                                  }
                                },
                                child: Icon(
                                  Icons.favorite,
                                  color: context
                                          .read<EventCubit>()
                                          .favoriteEvents
                                          .any((event) => event.id == state.events[index].id)
                                      ? Colors.red
                                      : Colors.grey,
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }
                    return const RetryButton();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyTextFiels extends StatelessWidget {
  const MyTextFiels({super.key, this.controller, required this.hintText});
  final TextEditingController? controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: const TextStyle(
        fontSize: 16,
        color: AppColors.white,
        fontWeight: FontWeight.w500,
        letterSpacing: 1,
      ),
      cursorColor: AppColors.white,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: AppColors.white,
          fontSize: AppFontSize.small,
          letterSpacing: 1,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        filled: true,
        fillColor: AppColors.armyGreen,
        enabledBorder: const OutlineInputBorder(borderSide: BorderSide.none),
        focusedBorder: const OutlineInputBorder(borderSide: BorderSide.none),
      ),
    );
  }
}

class RetryButton extends StatelessWidget {
  const RetryButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          onPressed: () => context.read<EventCubit>().loadEvents(),
          child: const Text(
            'Retry',
            style: TextStyle(),
          )),
    );
  }
}

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) => const Center(
        child: CircularProgressIndicator(
          color: AppColors.armyGreen,
        ),
      );
}
