import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo_app/features/todo/data/model/todo.dart';
import 'package:todo_app/features/todo/presentation/bloc/todo_bloc.dart';
import '../widget/custom_text_field.dart';

class TodoInputPage extends StatefulWidget {
  const TodoInputPage({Key? key}) : super(key: key);

  @override
  State<TodoInputPage> createState() => _TodoInputPageState();
}

class _TodoInputPageState extends State<TodoInputPage> {
  late TextEditingController _titleController;
  late TextEditingController _contentController;
  late DateTime _createdOnController;
  late bool _checkBoxController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _contentController = TextEditingController();
    _createdOnController = DateTime.now();
    _checkBoxController = false;
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _contentController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Create Todo',
          style: TextStyle(
              color: Color(0xff22B07E),
              fontWeight: FontWeight.bold,
              fontSize: 24),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Color(0xFF22B07E)),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 28, right: 28, bottom: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  CustomTextField(
                    titleController: _titleController,
                    hintText: "Add You're Task Name",
                  ),
                  CustomTextField(
                    titleController: _contentController,
                    hintText: "Add Task Description",
                    maxline: 6,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {
                          showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime(DateTime.now().year + 2))
                              .then((value) {
                            value != null
                                ? _createdOnController = value
                                : _createdOnController = _createdOnController;
                          });
                        },
                        child: const Text('Select Deadline'),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                width: double.infinity,
                child: BlocListener<TodoBloc, TodoState>(
                  listener: (context, state) {
                    if (state is TodoLoadedState) {
                      Fluttertoast.showToast(
                          msg: "Todo Added",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: const Color(0xFF22B07E),
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }
                  },
                  child: ElevatedButton(
                      onPressed: () {
                        if (_titleController.text.isNotEmpty) {
                          var todoItem = Todo(
                              title: _titleController.text,
                              content: _contentController.text,
                              createdOn: _createdOnController,
                              isFinished: _checkBoxController);
                          context
                              .read<TodoBloc>()
                              .add(TodoAddEvent(todo: todoItem));
                        }
                        Navigator.pop(context);
                      },
                      child: const Text('Save Todo')),
                ),
              )
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
