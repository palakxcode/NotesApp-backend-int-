import 'package:crud_app/constants/pallete.dart';
import 'package:crud_app/services/firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final firestoreService = FirestoreService();
  final TextEditingController textController = TextEditingController();

  void openNotesBox() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: TextField(
                controller: textController,
              ),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      firestoreService.addNote(textController.text);
                      textController.clear();
                      Navigator.pop(context);
                    },
                    child: const Text('Add Note'))
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Notes',
          style: TextStyle(color: Pallete.text, fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: Pallete.appbarcolor,
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        backgroundColor: Pallete.appbarcolor,
        onPressed: () {
          openNotesBox();
        },
        child: const Icon(
          Icons.add,
          color: Pallete.text,
        ),
      ),
    );
  }
}
