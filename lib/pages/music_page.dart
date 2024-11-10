import 'package:flutter/material.dart';
import 'package:music_app/widgets/list_item.dart';

class MusicPage extends StatelessWidget {
  const MusicPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/glitter_two.jpg"),
        ),
      ),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 15),
              child: Text(
                "All Songs",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white),
              ),
            ),
          //   MyListItem(
          //     song_name: "song name test",
          //     artist_name: "artist name",
          //   ),
          //   MyListItem(
          //     song_name: "song name",
          //     artist_name: "artist name",
          //   ),
          //   MyListItem(
          //     song_name: "song name",
          //     artist_name: "artist name",
          //   ),
          //   MyListItem(
          //     song_name: "song name",
          //     artist_name: "artist name",
          //   ),
          //   MyListItem(
          //     song_name: "song name",
          //     artist_name: "artist name",
          //   ),
          //   MyListItem(
          //     song_name: "song name",
          //     artist_name: "artist name",
          //   ),
          //   MyListItem(
          //     song_name: "song name",
          //     artist_name: "artist name",
          //   ),
          //   MyListItem(
          //     song_name: "song name",
          //     artist_name: "artist name",
          //   ),
          //   MyListItem(
          //     song_name: "song name",
          //     artist_name: "artist name",
          //   ),
          //   MyListItem(
          //     song_name: "song name",
          //     artist_name: "artist name",
          //   ),
          //   MyListItem(
          //     song_name: "song name",
          //     artist_name: "artist name",
          //   ),
          //   MyListItem(
          //     song_name: "song name",
          //     artist_name: "artist name",
          //   ),
          //   MyListItem(
          //     song_name: "song name",
          //     artist_name: "artist name",
          //   ),
          //   MyListItem(
          //     song_name: "song name",
          //     artist_name: "artist name",
          //   ),
          //   MyListItem(
          //     song_name: "song name",
          //     artist_name: "artist name",
          //   ),
          //   MyListItem(
          //     song_name: "song name",
          //     artist_name: "artist name",
          //   ),
          //   MyListItem(
          //     song_name: "song name",
          //     artist_name: "artist name",
          //   ),
          ],
        ),
      ),
    );
  }
}
