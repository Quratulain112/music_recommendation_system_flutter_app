import 'package:flutter/material.dart';
import 'package:music_app/widgets/list_item.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/glitter_two.jfif"),
        ),
      ),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 15),
              child: Text(
                "Favourite Songs",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white),
              ),
            ),
            MyListItem(
              song_name: "song name",
              artist_name: "artist name",
            ),  
            MyListItem(
              song_name: "song name",
              artist_name: "artist name",
            ),
            MyListItem(
              song_name: "song name",
              artist_name: "artist name",
            ),
            MyListItem(
              song_name: "song name",
              artist_name: "artist name",
            ),
            MyListItem(
              song_name: "song name",
              artist_name: "artist name",
            ),
            MyListItem(
              song_name: "song name",
              artist_name: "artist name",
            ),
            MyListItem(
              song_name: "song name",
              artist_name: "artist name",
            ),
            MyListItem(
              song_name: "song name",
              artist_name: "artist name",
            ),
            MyListItem(
              song_name: "song name",
              artist_name: "artist name",
            ),
            MyListItem(
              song_name: "song name",
              artist_name: "artist name",
            ),
            MyListItem(
              song_name: "song name",
              artist_name: "artist name",
            ),
            MyListItem(
              song_name: "song name",
              artist_name: "artist name",
            ),
            MyListItem(
              song_name: "song name",
              artist_name: "artist name",
            ),
            MyListItem(
              song_name: "song name",
              artist_name: "artist name",
            ),
            MyListItem(
              song_name: "song name",
              artist_name: "artist name",
            ),
            MyListItem(
              song_name: "song name",
              artist_name: "artist name",
            ),
            MyListItem(
              song_name: "song name",
              artist_name: "artist name",
            ),
          ],
        ),
      ),
    );
  }
}
