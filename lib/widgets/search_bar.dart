import 'package:flutter/material.dart';

class MySearchBar extends StatelessWidget {
  final VoidCallback onSend;
  final TextEditingController searchBarController;
  const MySearchBar(
      {super.key, required this.onSend, required this.searchBarController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: Colors.white70, width: 2),
          color: Colors.white.withOpacity(0.06),
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(12),
              child: Icon(Icons.search, color: Colors.white),
            ),
            Expanded(
              child: TextField(
                controller: searchBarController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Enter prompt",
                  hintStyle: TextStyle(color: Colors.white70),
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(right: 10),
                child: IconButton(
                  onPressed: onSend,
                  icon: Icon(
                    Icons.send,
                    color: Colors.white,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
