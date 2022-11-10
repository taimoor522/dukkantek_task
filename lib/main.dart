import 'package:dukkantek_task_taimoor/src/core/Theme/my_theme.dart';
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
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: MyTheme.theme,
        home: const EventScreen(),
      ),
    );
  }
}
