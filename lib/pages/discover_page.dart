import 'package:flutter/material.dart';
import 'package:music_app/widgets/list_item.dart';
import 'package:music_app/widgets/search_bar.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 500,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/glitter_one.jfif"))),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.only(top: 75),
            child: Column(
              children: [
                Text(
                  "What's on your mind?",
                  style: TextStyle(
                      color: const Color.fromARGB(255, 228, 216, 230),
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: MySearchBar(),
                ),
                MyListItem(song_name: "Song one", artist_name: "artist name"),
                MyListItem(song_name: "Song two", artist_name: "artist name"),
                MyListItem(song_name: "Song three", artist_name: "artist name"),
                MyListItem(song_name: "Song four", artist_name: "artist name"),
                MyListItem(song_name: "Song five", artist_name: "artist name"),
                MyListItem(song_name: "Song six", artist_name: "artist name"),
                MyListItem(song_name: "Song seven", artist_name: "artist name"),
              ],
            ),
          ),
        ));
  }
}
