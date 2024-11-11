import 'package:flutter/material.dart';
import 'package:music_app/utils/api_service.dart';
import 'package:music_app/widgets/list_item.dart';
import 'package:url_launcher/url_launcher.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  List<dynamic> songs = [];
  Future<void> removeFavorite(String trackId) async {
    try {
      final success = await ApiService.removeFavorite(trackId);
      if (success) {
        setState(() {
          songs.removeWhere(
            (element) => element["track_id"] == trackId,
          );
        });
        showSnackbar("Removed from favorites");
      } else {
        showSnackbar("Failed to remove from favorites");
      }
    } catch (e) {}
  }

  Future<void> getFavorites() async {
    try {
      final results = await ApiService.fetchFavoritesFromApi();
      setState(() {
        songs = results;
      });
    } catch (e) {
      print(e);
    }
  }

  void showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  void initState() {
    getFavorites();
  }

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
            Padding(
              padding: EdgeInsets.only(top: 12, bottom: 6),
              child: Text(
                "Your Favorites",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: songs.length,
                itemBuilder: (context, index) {
                  final item = songs[index];
                  final trackId = item["track_id"] as String;
                  final trackName = item["track_name"] as String;
                  final trackArtists = item["artist_names"] as String;
                  final isFavorites = true;
                  final albumCover = item["album_cover_64x64"] as String;
                  return MyListItem(
                      onTap: () async {
                        setState(() {
                          launchUrl(
                              Uri.parse(
                                  "https://open.spotify.com/track/${trackId}"),
                              mode: LaunchMode.inAppWebView);
                        });
                      },
                      track_id: trackId,
                      song_name: trackName,
                      artist_name: trackArtists,
                      album_cover: albumCover,
                      is_favorite: isFavorites,
                      onPressFavorite: () {
                        removeFavorite(trackId);
                      });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
