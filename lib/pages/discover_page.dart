import 'package:flutter/material.dart';
import 'package:music_app/widgets/list_item.dart';
import 'package:music_app/widgets/search_bar.dart';

class DiscoverPage extends StatelessWidget {
  DiscoverPage({super.key});

  final List<dynamic> songs = [
    ["SONGS NAME", "ARTIST"],
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/glitter_one.jfif"),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
          child: Column(
            children: [
              const Text(
                "What's on your mind?",
                style: TextStyle(
                    color: Color.fromARGB(255, 228, 216, 230),
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 15),
                child: MySearchBar(),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: songs.length,
                  itemBuilder: (context, index) {
                    return MyListItem(
                        song_name: songs[index][0],
                        artist_name: songs[index][1]);
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
