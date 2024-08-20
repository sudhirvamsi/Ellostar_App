import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class ContestsScreen extends StatefulWidget {
  const ContestsScreen({Key? key}) : super(key: key);

  @override
  State<ContestsScreen> createState() => _ContestsScreen();
}

class _ContestsScreen extends State<ContestsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool isLoading = false;
  List<Map<String, String>> pdfList = [];
  List<Map<String, String>> videoList = [];
  List<Map<String, String>> imageList = [];

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    getAchievers();
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Contests',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.orange,
        bottom: TabBar(
          dividerColor: Colors.black,
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: const [
            Tab(text: "Images"),
            Tab(text: "Videos"),
            Tab(text: "PDFs"),
          ],
        ),
      ),
      backgroundColor: Colors.orange.shade50,
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : TabBarView(
              controller: _tabController,
              children: [
                _buildSection(imageList, 'image'),
                _buildSection(videoList, 'video'),
                _buildSection(pdfList, 'pdf'),
              ],
            ),
    );
  }

  Widget _buildSection(List<Map<String, String>> itemList, String type) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: itemList.isEmpty
          ? const Center(child: Text('No items available'))
          : SingleChildScrollView(
              child: Column(
                children: itemList.map((item) {
                  switch (type) {
                    case 'image':
                      return _buildImageItem(item['source'] ?? '');
                    case 'video':
                      return _buildYouTubeVideoItem(item['source'] ?? '');
                    case 'pdf':
                      return _buildItemList(Icons.picture_as_pdf, pdfList);
                    default:
                      return Container();
                  }
                }).toList(),
              ),
            ),
    );
  }

  Widget _buildImageItem(String url) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Image.network(url, errorBuilder: (context, error, stackTrace) {
        return const Text('Failed to load image');
      }),
    );
  }

  Widget _buildYouTubeVideoItem(String url) {
    final videoId = YoutubePlayer.convertUrlToId(url);
    if (videoId == null) {
      return const Text('Invalid YouTube URL');
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: YoutubePlayer(
        controller: YoutubePlayerController(
          initialVideoId: videoId,
          flags: const YoutubePlayerFlags(
            autoPlay: false,
            mute: false,
          ),
        ),
        showVideoProgressIndicator: true,
      ),
    );
  }

  Widget _buildItemList(IconData icon, List<Map<String, String>> itemList) {
    return Column(
      children: itemList.map((item) {
        return ListTile(
          leading: Icon(icon),
          title: Text(item['title'] ?? 'Untitled'),
          onTap: () => _launchUrl(item['source'] ?? ''),
        );
      }).toList(),
    );
  }

  Future<void> _launchUrl(String url) async {
    if (url.isNotEmpty) {
      if (!await canLaunch(url)) {
        throw 'Could not launch $url';
      } else {
        await launch(url);
      }
    }
  }

  Future<void> getAchievers() async {
    setState(() {
      isLoading = true;
    });

    String url = "https://ellostars.com/api/contests";
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization':
              'Basic ' + base64Encode(utf8.encode('ellostars:ellostars')),
        },
      );
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        if (jsonResponse['status'] == 'ok') {
          final details = jsonResponse['details'];

          for (var item in details) {
            if (item['type'] == '3') {
              pdfList.add({
                'title': item['title'] ?? '',
                'source': item['source'] ?? '',
              });
            } else if (item['type'] == '2') {
              videoList.add({
                'title': item['title'] ?? '',
                'source': item['source'] ?? '',
              });
            } else {
              imageList.add({
                'title': item['title'] ?? '',
                'source': item['source'] ?? '',
              });
            }
          }
        } else {
          print("Error: ${jsonResponse['msg']}");
        }
      } else {
        print("Error: ${response.statusCode}");
      }
    } catch (e) {
      print("Error: $e");
    }

    setState(() {
      isLoading = false;
    });
  }
}

class PdfViewerWidget extends StatelessWidget {
  final String pdfUrl;

  const PdfViewerWidget({Key? key, required this.pdfUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400, // Specify a finite height
      child: PDFView(
        filePath: pdfUrl,
      ),
    );
  }
}
