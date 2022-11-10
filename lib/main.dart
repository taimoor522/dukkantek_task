import 'package:dukkantek_task_taimoor/src/di.dart';
import 'package:dukkantek_task_taimoor/src/features/events/presentation/state/event_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/features/events/presentation/ui/events_screen.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EventCubit>(
      create: (_) => injector(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: EventScreen(),
      ),
    );
  }
}
