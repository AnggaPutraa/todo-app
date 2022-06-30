import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/input%20section/presentation/page/input_todo_page.dart';
import 'package:todo_app/features/todo/presentation/bloc/todo_bloc.dart';
import 'package:todo_app/features/todo/presentation/widget/todo_card.dart';
import '../widget/custom_app_bar.dart';

class TodoMainPage extends StatelessWidget {
  const TodoMainPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(),
          BlocBuilder<TodoBloc, TodoState>(
            builder: (context, state) {
              if (state is TodoLoadedState) {
                return Expanded(
                  child: ListView.builder(
                  itemCount: state.todos.length,
                  itemBuilder: (context, index) {
                    if (index == state.todos.length - 1) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height * 0.08);
                    }
                    return TodoCard(
                      todoItem: state.todos[index]
                    );
                    },
                  )
                );
              }
              return const Expanded(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (context) => const TodoInputPage()
            )
          );
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}