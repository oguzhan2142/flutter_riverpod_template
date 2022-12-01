import 'package:flutter/material.dart';

class Or extends StatelessWidget {
  const Or({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            endIndent: 20,
          ),
        ),
        Text(
          'veya',
          style: Theme.of(context).textTheme.button,
        ),
        const Expanded(
            child: Divider(
          indent: 20,
        )),
      ],
    );
  }
}
