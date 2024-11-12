import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loose_leaf/classes/db_helper.dart';
import 'package:sqflite/sqflite.dart';

class AllNotes extends StatefulWidget {
  const AllNotes({super.key});

  @override
  State<AllNotes> createState() => _AllNotesState();
}

class _AllNotesState extends State<AllNotes> {
  DbHelper dbHelper = DbHelper();
  Database? database;
  List<Map<String, Object?>>? data;
  bool shouldShowDeletionUi = false, shouldShowLoadingUI = false;
  int deletionIndex = 0;

  init() async {
    await dbHelper.initDB();
    database = dbHelper.database;
    data = await dbHelper.fetchNotes(database!);
    setState(() {
      data = data;
    });
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
        onPressed: () async {
          setState(() {
            shouldShowLoadingUI = true;
          });
          await FirebaseDatabase.instance.ref("notes").set(data).then((value) {
            setState(() {
              shouldShowLoadingUI = false;
            });
          }).onError((e, f) {
            setState(() {
              shouldShowLoadingUI = false;
            });
          });
        },
        backgroundColor: Colors.black,
        child: Icon(
          CupertinoIcons.upload_circle,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: true,
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
        child: Stack(
          alignment: Alignment.center,
          children: [
            ListView.builder(
              itemCount: data?.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: index == 0
                      ? const EdgeInsets.fromLTRB(11, 11, 11, 5.5)
                      : const EdgeInsets.symmetric(
                          horizontal: 11, vertical: 5.5),
                  child: GestureDetector(
                    onTap: shouldShowDeletionUi && index == deletionIndex
                        ? () {
                            dbHelper.deleteNote(database!,
                                int.parse((data?[index]["id"].toString())!));
                            init();
                            setState(() {
                              shouldShowDeletionUi = false;
                            });
                          }
                        : () {},
                    onLongPress: () {
                      setState(() {
                        deletionIndex = index;
                        shouldShowDeletionUi = true;
                      });
                    },
                    child: Container(
                      width: size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(1000),
                          border: Border.all(width: 1),
                          color: shouldShowDeletionUi && deletionIndex == index
                              ? Colors.red
                              : Colors.transparent),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          AnimatedOpacity(
                            duration: const Duration(milliseconds: 555),
                            curve: Curves.linearToEaseOut,
                            opacity:
                                shouldShowDeletionUi && index == deletionIndex
                                    ? 0
                                    : 1,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(11.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(7.0),
                                      child: Text(
                                        " ${data?[index]["title"]} ",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w900,
                                            fontSize: size.width * .041,
                                            height: 0),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(21, 0, 21, 11),
                                  child: Text(
                                    data == null
                                        ? ""
                                        : (data?[index]["note"].toString())!,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: size.width * .041,
                                        height: 0),
                                    textAlign: TextAlign.center,
                                  ),
                                )
                              ],
                            ),
                          ),
                          AnimatedOpacity(
                            duration: const Duration(milliseconds: 555),
                            curve: Curves.linearToEaseOut,
                            opacity:
                                shouldShowDeletionUi && index == deletionIndex
                                    ? 1
                                    : 0,
                            child: Text(
                              "delete leaf",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900,
                                  fontSize: size.width * .055),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            Visibility(
                visible: shouldShowLoadingUI,
                child: const CircularProgressIndicator(
                  color: Colors.black,
                ))
          ],
        ),
      ),
    );
  }
}
