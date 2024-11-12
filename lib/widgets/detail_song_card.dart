import 'package:flutter/material.dart';

class DetailSongCard extends StatelessWidget {
  final dynamic item;

  final VoidCallback onTap;

  const DetailSongCard({super.key, required this.item, required this.onTap});
  Widget _buildAlbumCover(String coverUrl) {
    return Image.network(
      coverUrl,
      width: 80,
      height: 80,
      fit: BoxFit.fitWidth,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child; // Image loaded successfully
        } else {
          return const Icon(
            Icons.music_note, // Show music note icon while loading
            color: Colors.white,
            size: 70,
          );
        }
      },
      errorBuilder: (context, error, stackTrace) {
        // Fallback to music note icon if image fails to load
        return const Icon(
          Icons.music_note,
          color: Colors.white,
          size: 100,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: const Color.fromARGB(48, 0, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildAlbumCover(item['album_cover_64x64']),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
              child: Text(
                item['track_name'],
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Text(
                item['artist_names'].replaceAll(RegExp(r'''[\[\]\'"]'''), ''),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 15,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Text(
                "Year: ${item['year']}",
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
