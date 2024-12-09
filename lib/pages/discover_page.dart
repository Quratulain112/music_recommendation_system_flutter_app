import 'package:flutter/material.dart';
import 'package:music_app/utils/api_service.dart';
import 'package:music_app/widgets/list_item.dart';
import 'package:music_app/widgets/search_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  List<dynamic> songs = [];
  TextEditingController promptController = TextEditingController();
  Future<void> searchSongs(String query) async {
    try {
      dynamic fetchSongs = await ApiService.fetchSongsByPrompt(query);
      setState(() {
        songs = fetchSongs;
      });
    } catch (e) {}
  }

  Future<void> toggleFavorite(
      String trackId, String trackName, bool isFavorite) async {
    try {
      if (!isFavorite) {
        await ApiService.addFavorite(trackId, trackName);
        showSnackbar("Added to favorites");
      } else {
        await ApiService.removeFavorite(trackId);
        showSnackbar("Remove from favorites");
      }
      setState(() {
        songs = songs.map((item) {
          if (item['track_id'] == trackId) {
            item['is_favorite'] = !isFavorite; // Toggle favorite status
          }
          return item;
        }).toList();
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
              Padding(
                padding: EdgeInsets.only(top: 15),
                child: MySearchBar(
                    onSend: () {
                      searchSongs(promptController.text);
                    },
                    searchBarController: promptController),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: songs.length,
                  itemBuilder: (context, index) {
                    final item = songs[index];
                    final trackId = item["track_id"] as String;
                    final trackName = item["track_name"] as String;
                    final trackArtists = item["artist_names"] as String;
                    final isFavorites = item["is_favorite"] as bool;
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
                          toggleFavorite(trackId, trackName, isFavorites);
                        });
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
