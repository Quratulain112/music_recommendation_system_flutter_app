import 'package:flutter/material.dart';

class MyListItem extends StatelessWidget {
  final String song_name;
  final String artist_name;
  const MyListItem(
      {super.key, required this.song_name, required this.artist_name});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(48, 0, 0, 0),
      child: Padding(
        padding: EdgeInsets.only(left: 25, right: 25),
        child: ListTile(
          leading: Icon(
            Icons.music_note,
            color: Colors.white,
          ),
          title: Text(
            song_name,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            artist_name,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          trailing: IconButton(
            onPressed: () {},
            icon: Icon(Icons.favorite),
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
