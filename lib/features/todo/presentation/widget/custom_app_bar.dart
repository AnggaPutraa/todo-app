import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/core/bases/cubit/theme_cubit.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, bool>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.only(
            right: 20, 
            left: 20, 
            top: 36, 
            bottom: 12
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Todo's",
                    style: TextStyle(
                        color: Color(0xff22B07E),
                        fontSize: 36,
                        fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    onPressed: () {
                      context.read<ThemeCubit>().toggleTheme();
                    },
                    icon: state 
                      ? const Icon(Icons.nightlight_round)
                      : const Icon(Icons.sunny),
                    color: const Color(0xff22B07E),
                    iconSize: 32,
                  )
                ],
              ),
              const SizedBox(height: 4),
              Text(
                DateFormat.yMMMMEEEEd().format(DateTime.now()),
                style: TextStyle(
                  color: state
                    ? Colors.black45
                    : Colors.white54,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
              ),
            ],
          ),
        );
      },
    );
  }
}
