import 'package:blogger/content_page.dart';
import 'package:flutter/material.dart';

class FeedPage extends StatelessWidget {
  final List<Map<String, String>> posts = [
    {
      'author': 'Jishnu Hari',
      'time': '2 hr ago',
      'title': '5 tips to create a modern app UI Design',
      'content':
          'Recently I was given the task to “Modernize” my current companies app UI on Android. The terms modern, young, cool, etc.. are all quite vague. What makes a design modern or old?',
    },
    {
      'author': 'Jenny Wilson',
      'time': '2 hr ago',
      'title': 'Why Minimal UI Design is the Go-To Trend in 2022',
      'content':
          'Minimalism is a design aesthetic that embodies the phrase “less is more.” With minimalist design, you push an idea by stripping it down to essential...',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color(0xFFF6F6F6),
        // Add the drawer here
        drawer: Drawer(
          child: SafeArea(
            child: Container(
              color: Colors.black,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Profile section
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 24.0,
                      horizontal: 16.0,
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 32,
                          backgroundColor: Colors.grey[800],
                          child: Icon(
                            Icons.person,
                            size: 36,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Cameron Williamson",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "@cameronwill_",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                 
                  const SizedBox(height: 16),
                  const Divider(color: Colors.white24),
                  // Drawer items
                  ListTile(
                    leading: Icon(Icons.edit, color: Colors.white),
                    title: Text(
                      "Add new article",
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      // TODO: Implement upload functionality
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.article, color: Colors.white),
                    title: Text(
                      "Your articles",
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      // TODO: Implement your articles navigation
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.notifications, color: Colors.white),
                    title: Text(
                      "Notifications",
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      // TODO: Implement notifications navigation
                      Navigator.pop(context);
                    },
                  ),
                  const Spacer(),
                  ListTile(
                    leading: Icon(Icons.logout, color: Colors.white),
                    title: Text(
                      "Logout",
                      style: TextStyle(color: Colors.white),
                    ),
                    onTap: () {
                      // TODO: Implement logout
                      Navigator.pop(context);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                      bottom: 16,
                      top: 8,
                    ),
                    child: CircleAvatar(
                      backgroundColor: Colors.white24,
                      radius: 20,
                      child: Icon(Icons.close, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            'Feed',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          bottom: TabBar(
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.black,
            tabs: const [Tab(text: 'For You'), Tab(text: 'Your Profile')],
          ),
        ),
        body: TabBarView(
          children: [
            // For You Tab
            ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return _PostCard(post: post);
              },
            ),
            // Your Profile Tab (empty for now)
            Center(
              child: Text(
                'Your Profile',
                style: TextStyle(fontSize: 18, color: Colors.grey[700]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PostCard extends StatelessWidget {
  final Map<String, String> post;
  const _PostCard({required this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Author Row
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey[300],
                  child: Icon(Icons.person, color: Colors.white),
                ),
                const SizedBox(width: 10),
                Text(
                  post['author'] ?? '',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  post['time'] ?? '',
                  style: TextStyle(color: Colors.grey[600], fontSize: 12),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Title
            Text(
              post['title'] ?? '',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 8),
            // Content
            Text(
              post['content'] ?? '',
              style: TextStyle(color: Colors.grey[800], fontSize: 15),
            ),
            const SizedBox(height: 16),
            // Read More Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => ContentPage(post: post)),
                  );
                },
                child: const Text(
                  'Read more',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
