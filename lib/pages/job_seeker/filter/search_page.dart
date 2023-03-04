import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pabjobs/pages/job_seeker/filter/search_listing.dart';
import 'package:pabjobs/theme/text_theme.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late FocusNode focusNode;

  void showKeyboard() {
    focusNode.requestFocus();
  }

  @override
  void initState() {
    super.initState();

    focusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Container(
          height: 40,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.1),
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextField(
            autofocus: true,
            focusNode: focusNode,
            onSubmitted: (value) {
              Get.to(() => const SearchListing(), arguments: value);
              print(value);
            },
            decoration: const InputDecoration(
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              prefixIcon: Icon(Icons.search),
              isDense: true,
              contentPadding: EdgeInsets.symmetric(vertical: 11),
              hintText: "Search",
            ),
          ),
        ),
      ),
    ));
  }
}
