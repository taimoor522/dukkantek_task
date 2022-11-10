import 'package:dukkantek_task_taimoor/src/core/Widgets/spacing.dart';
import 'package:dukkantek_task_taimoor/src/core/constants/colors.dart';
import 'package:dukkantek_task_taimoor/src/features/events/presentation/ui/event_detail_screen.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/font_size.dart';
import '../state/event_cubit.dart';
import 'favorite_events_screen.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({super.key});

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  late final TextEditingController _searchController;
  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    context.read<EventCubit>().loadEvents();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const FavoriteEventScreen();
            }));
          },
          child: const Icon(Icons.favorite_border_rounded, color: Colors.white),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              MyTextFiels(
                hintText: 'Search Event',
                controller: _searchController,
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
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) {
                                    return EventDetailScreen(
                                      event: state.events[index],
                                    );
                                  }),
                                );
                              },
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

  @override
  dispose() {
    _searchController.dispose();
    super.dispose();
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
      onChanged: (String query) {
        EasyDebounce.cancel('search');
        EasyDebounce.debounce(
          'search',
          const Duration(milliseconds: 500),
          () => context.read<EventCubit>().searchEvents(query),
        );
      },
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
          onPressed: () => context.read<EventCubit>().loadEvents(), child: const Text('Retry')),
    );
  }
}

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) => const Center(
        child: CircularProgressIndicator(),
      );
}
