import 'package:flutter/material.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  bool _mounted = true;
  List<NewsItem> _newsItems = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchNews();
  }

  @override
  void dispose() {
    _mounted = false;
    super.dispose();
  }

  Future<void> _fetchNews() async {
    try {
      // Simulate network delay
      await Future.delayed(const Duration(seconds: 2));

      // Only update state if the widget is still mounted
      if (_mounted) {
        setState(() {
          _isLoading = false;
          _newsItems = [
            NewsItem(
              title: 'Weather Alert',
              description: 'Heavy rainfall expected in coastal areas',
              icon: Icons.cloud,
              time: DateTime.now(),
            ),
            NewsItem(
              title: 'Safety Update',
              description: 'New emergency protocols in effect',
              icon: Icons.security,
              time: DateTime.now().subtract(const Duration(hours: 2)),
            ),
          ];
        });
      }
    } catch (e) {
      if (_mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Widget _buildNewsCard(NewsItem item) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(item.icon, color: Colors.blue),
                const SizedBox(width: 10),
                Text(
                  item.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              item.description,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Text(
              '${item.time.hour}:${item.time.minute.toString().padLeft(2, '0')}',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: _fetchNews,
              child: ListView(
                children: [
                  const Text(
                    'Latest Updates',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ..._newsItems.map((item) => Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: _buildNewsCard(item),
                      )),
                ],
              ),
            ),
    );
  }
}

class NewsItem {
  final String title;
  final String description;
  final IconData icon;
  final DateTime time;

  NewsItem({
    required this.title,
    required this.description,
    required this.icon,
    required this.time,
  });
}
