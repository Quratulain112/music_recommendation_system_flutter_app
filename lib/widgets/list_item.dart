import 'package:flutter/material.dart';

class MyListItem extends StatelessWidget {
  final String track_id;
  final String song_name;
  final String artist_name;
  final String album_cover;
  final bool is_favorite;
  final VoidCallback onPressFavorite;
  final VoidCallback onTap;

  const MyListItem({
    super.key,
    required this.track_id,
    required this.song_name,
    required this.artist_name,
    required this.album_cover,
    required this.is_favorite,
    required this.onPressFavorite,
    required this.onTap,
  });
  Widget _buildAlbumCover() {
    return Image.network(
      album_cover,
      width: 50,
      height: 50,
      fit: BoxFit.fitWidth,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child; // Image loaded successfully
        } else {
          return const Icon(
            Icons.music_note, // Show music note icon while loading
            color: Colors.white,
            size: 50,
          );
        }
      },
      errorBuilder: (context, error, stackTrace) {
        // Fallback to music note icon if image fails to load
        return const Icon(
          Icons.music_note,
          color: Colors.white,
          size: 50,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(48, 0, 0, 0),
      child: Padding(
        padding: EdgeInsets.only(left: 25, right: 25),
        child: ListTile(
          onTap: onTap,
          leading: _buildAlbumCover(),
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
            onPressed: onPressFavorite,
            icon: Icon(Icons.favorite_border),
            isSelected: is_favorite,
            selectedIcon: Icon(
              Icons.favorite,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
