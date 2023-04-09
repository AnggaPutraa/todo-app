import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import '../../data/model/todo.dart';
import '../widget/custom_vertical_divider.dart';
import '../bloc/todo_bloc.dart';

class TodoCard extends StatelessWidget {
  final Todo todoItem;

  const TodoCard({Key? key, required this.todoItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: InkWell(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color(0xff53C29B),
            ),
            child: Row(
              children: [
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      todoItem.title,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(Icons.access_time_rounded,
                            size: 18, color: Colors.white),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          DateFormat.yMMMMEEEEd().format(todoItem.createdOn),
                          style: const TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    todoItem.content.isNotEmpty
                        ? Text(
                            todoItem.content,
                            style: const TextStyle(color: Colors.white),
                          )
                        : const SizedBox(),
                  ],
                )),
                const CustomVerticalDivider(),
                RotatedBox(
                  quarterTurns: 3,
                  child: Text(
                    todoItem.isFinished ? 'DONE' : 'TODO',
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
        ),
        onTap: () => showModalBottomSheet(
            context: context,
            builder: (context) => SizedBox(
                height: MediaQuery.of(context).size.height * 0.25,
                child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: BlocListener<TodoBloc, TodoState>(
                      listener: (context, state) {
                        if (state is TodoLoadedState) {
                          Fluttertoast.showToast(
                            msg: "Task Updated!",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: const Color(0xFF22B07E),
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );
                        }
                      },
                      child: Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                todoItem.isFinished = !todoItem.isFinished;
                                context
                                    .read<TodoBloc>()
                                    .add(TodoToggleEvent(todo: todoItem));
                                Navigator.pop(context);
                              },
                              child: const Text('Toggle Todo Status'),
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                context
                                    .read<TodoBloc>()
                                    .add(TodoDeleteEvent(todo: todoItem));
                                Navigator.pop(context);
                              },
                              child: const Text('Delete Todo'),
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: OutlinedButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Cancel'),
                            ),
                          ),
                        ],
                      ),
                    )))),
      ),
    );
  }
}
