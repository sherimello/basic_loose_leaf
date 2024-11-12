import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loose_leaf/classes/db_helper.dart';
import 'package:loose_leaf/pages/all_notes.dart';
import 'package:sqflite/sqflite.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController titleController = TextEditingController(),
      noteController = TextEditingController();
  DbHelper dbHelper = DbHelper();
  Database? database;

  init() async {
    await dbHelper.initDB();
    database = dbHelper.database;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          if(noteController.text.isEmpty || titleController.text.isEmpty) {
            return;
          }
          await dbHelper.insertNote(
              database!, titleController.text, noteController.text);
          titleController.clear();
          noteController.clear();
        },
        backgroundColor: Colors.black,
        child: const Icon(
          Icons.save_as,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 17.0),
            child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (builder) => const AllNotes()));
                },
                child: Icon(CupertinoIcons.list_bullet_indent, color: Colors.white,)),
          )
        ],
        backgroundColor: Colors.black,
        title: Text(
          "loose leaf",
          style: TextStyle(
              fontWeight: FontWeight.w900,
              color: Colors.white,
              fontSize: size.width * .055),
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(17.0),
              child: Container(
                width: size.width,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(100)),
                child: TextField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Colors.transparent,
                    hintText: "leaf title...",
                  ),
                  cursorColor: Colors.white,
                  maxLines: 1,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(17, 0, 17, 17),
                child: Container(
                  width: size.width,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(55)),
                  child: Padding(
                    padding: const EdgeInsets.all(17.0),
                    child: TextField(
                      controller: noteController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Colors.transparent,
                        hintText: "let's note down some bhugi sugis...",
                      ),
                      cursorColor: Colors.white,
                      maxLines: 1000000,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
