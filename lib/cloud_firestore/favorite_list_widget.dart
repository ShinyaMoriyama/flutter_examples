import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './language_item.dart';
import './error_widget.dart' as MyAppErrorWidget;

class FavoriteList extends StatelessWidget {
  static Stream<QuerySnapshot> getStream() => FirebaseFirestore.instance
      .collection("languages")
      .orderBy("likes", descending: true) // 1
      .snapshots(); // 2

  const FavoriteList();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: getStream(),
      builder: (context, languages) {
        if (languages.hasError) {
          return const MyAppErrorWidget.ErrorWidget();
        }

        if (languages.hasData) {
          final data = languages.data;
          print("data: ${data?.docs.length}");
          if (data != null) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemExtent: 80.0,
                    itemCount: data.docs.length,
                    itemBuilder: (context, index) =>
                        LanguageItem(data.docs[index]),
                  ),
                )
              ],
            );
          } else {
            return const MyAppErrorWidget.ErrorWidget();
          }
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
