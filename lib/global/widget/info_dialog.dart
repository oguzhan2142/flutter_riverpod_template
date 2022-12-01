import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../enum/info_dialog_type.dart';

class InfoDialog extends StatelessWidget {
  final String message;
  final InfoDialogType infoDialogType;
  const InfoDialog({
    super.key,
    required this.message,
    this.infoDialogType = InfoDialogType.ERROR,
  });

  static void show(
    BuildContext context,
    String message,
    InfoDialogType infoDialogType,
  ) {
    showDialog(
      context: context,
      builder: (context) => InfoDialog(message: message, infoDialogType: infoDialogType),
    );
  }

  String _getSvgPath() {
    if (infoDialogType == InfoDialogType.ERROR) {
      return 'assets/svg/feeling_blue.svg';
    }

    return 'assets/svg/order_confirmed.svg';
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(30),
        width: 200,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              _getSvgPath(),
              width: 150,
            ),
            const SizedBox(height: 20),
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Tamam'),
            ),
          ],
        ),
      ),
    );
  }
}
