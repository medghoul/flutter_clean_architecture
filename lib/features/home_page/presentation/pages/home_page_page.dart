import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/home_page_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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