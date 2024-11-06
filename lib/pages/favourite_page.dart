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
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            Text("All Songs"),
            Expanded(
                child: ListView.builder(
              itemCount: 2,
              itemBuilder: (context, index) {
                return MyListItem(song_name: "NAME", artist_name: "Artist");
              },
            ))
          ],
        ),
      ),
    );
  }
}
