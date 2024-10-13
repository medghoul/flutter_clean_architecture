import 'package:clean_architecture/features/home_page/presentation/cubits/home_page_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home_page')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.read<HomePageCubit>().someAction();
          },
          child: const Text('Perform Action'),
        ),
      ),
    );
  }
}