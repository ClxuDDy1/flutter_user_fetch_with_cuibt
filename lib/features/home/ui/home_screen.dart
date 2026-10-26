import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_fetch_with_cubit/features/home/logic/home_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random User - Home'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return Center(
              child: CircularProgressIndicator(color: Colors.deepPurple),
            );
          }
          if (state is HomeFailure) {
            return Center(child: Text('ERROR: ${state.message}'));
          }
          if (state is HomeSuccess) {
            final user = state.data;
            return ListView.separated(
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(child: Text('${user[index].id}')),
                  title: Text(user[index].name),
                  subtitle: Text(user[index].email),
                );
              },
              separatorBuilder: (_, _) => Divider(),
              itemCount: user.length,
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
