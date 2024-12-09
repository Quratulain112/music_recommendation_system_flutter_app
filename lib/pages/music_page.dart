import 'package:flutter/material.dart';
import 'package:music_app/utils/api_service.dart';
import 'package:music_app/widgets/detail_song_card.dart';
import 'package:url_launcher/url_launcher.dart';

class MusicPage extends StatefulWidget {
  const MusicPage({super.key});

  @override
  State<MusicPage> createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  List<dynamic> songs = [];
  bool _isLoading = false;
  int _currentPage = 1;
  final String _selectedFilter = 'popular';

  Future<void> fetchSongs({bool loadMore = false}) async {
    if (_isLoading) return;
    setState(() {
      _isLoading = true;
    });
    try {
      final responseSongs = await ApiService.fetchDiscoverSongs(
        page: _currentPage,
        filter: _selectedFilter,
        year: null,
        artist: null,
        genre: null,
      );
      setState(() {
        if (loadMore) {
          songs.addAll(responseSongs);
        } else {
          songs = responseSongs;
        }
        _isLoading = false;
        _currentPage++;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      showSnackbar("Error fetching songs: $e");
    }
  }

  Future<void> refreshSongs() async {
    setState(() {
      _currentPage = 1;
      songs.clear(); // Clear the existing songs before fetching new ones
    });
    await fetchSongs();
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
    super.initState();
    fetchSongs();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;

    return Container(
      width: 500,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/glitter_two.jfif"),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 12),
              child: Text(
                "Available Songs",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            (!_isLoading)
                ? Expanded(
                    child: NotificationListener<ScrollNotification>(
                      onNotification: (ScrollNotification scrollInfo) {
                        if (scrollInfo.metrics.pixels ==
                                scrollInfo.metrics.maxScrollExtent &&
                            !_isLoading) {
                          fetchSongs(loadMore: true);
                        }
                        return false;
                      },
                      child: GridView.count(
                        padding: const EdgeInsets.all(10),
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: (itemWidth / ((itemHeight * 0.70))),
                        controller: ScrollController(keepScrollOffset: false),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        children: songs.map((dynamic item) {
                          return DetailSongCard(
                            item: item,
                            onTap: () async {
                              setState(() {
                                launchUrl(
                                    Uri.parse(
                                        "https://open.spotify.com/track/${item['track_id']}"),
                                    mode: LaunchMode.inAppWebView);
                              });
                            },
                          );
                        }).toList(),
                      ),
                    ),
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  )
          ],
        ),
      ),
    );
  }
}
