import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/bloc/count/count_bloc.dart';

class CountHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext ctx) => CountBloc(),
      child: CountPage(),
    );
  }
}

class CountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bloc')),
      body: CountPageBody(),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
              child: Icon(
                Icons.add,
              ),
              onPressed: () {
                //获取CountBloc
                context.read<CountBloc>().add(AddEvent());
              }),
          SizedBox(
            height: 8,
          ),
          FloatingActionButton(
              child: Icon(
                Icons.remove,
              ),
              onPressed: () {
                context.read<CountBloc>().add(SubtractEvent());
              }),
        ],
      ),
    );
  }
}

class CountPageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<CountBloc, CountState>(
        builder: (BuildContext context, CountState state) {
          return Center(
            child: Text(
              "${state.count}",
              style: TextStyle(fontSize: 24, color: Colors.blueAccent),
            ),
          );
        },
      ),
    );
  }
}
