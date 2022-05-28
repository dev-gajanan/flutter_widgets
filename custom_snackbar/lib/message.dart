import 'package:custom_snackbar/app_snacbar.dart';
import 'package:flutter/material.dart';

class Message extends StatefulWidget {
  const Message({ Key? key }) : super(key: key);

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Custom Snackbar")
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: AppSnackBar(
                  message: "Hey you have successfully created custom SnackBar!",
                  snackbarType: SnackBarType.success,
                  title: "Congratulation!",
                ),
                behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.transparent,
                elevation: 0.0,
              )
            );
          },
          child: const Text("Show Message"),
        ),
      ),
    );
  }
}