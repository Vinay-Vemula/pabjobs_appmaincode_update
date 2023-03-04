import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pabjobs/pages/recruiter/filter/search_listing.dart';

class SearchPageR extends StatefulWidget {
  const SearchPageR({Key? key}) : super(key: key);
  @override
  _SearchPageRState createState() => _SearchPageRState();
}

class _SearchPageRState extends State<SearchPageR> {
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
              Get.to(() => const SearchListingR(), arguments: value);
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
