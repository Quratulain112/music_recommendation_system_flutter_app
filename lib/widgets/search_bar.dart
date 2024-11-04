import 'package:flutter/material.dart';

class MySearchBar extends StatelessWidget {
  const MySearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    // return SizedBox(
    //   height: 35,
    //   width: 250,
    //   child: TextField(
    //     style: TextStyle(color: Colors.white),
    //     decoration: InputDecoration(
    //       hintText: 'Search...',
    //       hintStyle: TextStyle(color: Colors.white54),
    //       border: OutlineInputBorder(
    //         borderRadius: BorderRadius.circular(8.0),
    //       ),
    //       suffixIcon: Icon(Icons.search, color: Colors.white),
    //       filled: true,
    //       fillColor: Colors.black26, // Optional: to give a background color
    //     ),
    //   ),
    // );
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        alignment: Alignment.center,
        child: TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor:
                Colors.white.withOpacity(0.06), // Semi-transparent background
            prefixIcon: const Icon(
              Icons.search,
              size: 30,
              color: Colors.white70,
            ),
            hintText: "Search",
            hintStyle: const TextStyle(fontSize: 16, color: Colors.white70),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(
                color: const Color.fromARGB(204, 192, 181, 181)
                    .withOpacity(0.5), // Semi-transparent border
                width: 2,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide: BorderSide(
                color: Colors.white10
                    .withOpacity(0.8), // Slightly more opaque when focused
                width: 2,
              ),
            ),
          ),
          style: const TextStyle(color: Colors.white30), // Text color
        ),
      ),
    );
  }
}
