import 'package:flutter/material.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  bool liked = false; // Initial state of the like button
  int likes = 0; // Initial count of likes
  final List<Map<String, dynamic>> posts = [
    {
      'avatarUrl':
          'https://placekitten.com/200/200', // Replace with actual image URL
      'name': 'John Doe',
      'postContent': 'This is the first post content',
      'postImageUrl':
          'data:image/jpeg;base64,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', // Replace with post image URL
      'likes': 10,
      'liked': false
    },
    {
      'avatarUrl':
          'data:image/jpeg;base64,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', // Replace with actual image URL
      'name': 'Jane Smith',
      'postContent': 'This is the second post content',
      'postImageUrl':
          'https://plus.unsplash.com/premium_photo-1664303012848-6bfbea738ac5?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8YW1zdGVyZGFtJTIwUGVvcGxlc3xlbnwwfHwwfHx8MA%3D%3D',
      'likes': 5,
      'liked': true
    },
    // Add more posts if needed
  ];

  var _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Neighborgood"),
        ),
        body: ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            return postCard(index, context);
          },
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed, // Allows 4+ icons
          currentIndex: _selectedIndex,
          onTap: (index) {
            _selectedIndex = index;
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline),
              label: '', // Center button doesn't need a label
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_rounded),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Container(
                padding: EdgeInsets.all(2), // Add padding if you want a border
                decoration: BoxDecoration(
                  color: Colors.white, // Border color
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1456315138460-858d1089ddba?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8YW1zdGVyZGFtJTIwUGVvcGxlc3xlbnwwfHwwfHx8MA%3D%3D'),
                ),
              ),
              label: '',
            ),
          ],
        ));
  }

  Widget postCard(int index, BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    final post = posts[index];
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Avatar and name row
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(post['avatarUrl']),
                ),
                SizedBox(width: 10),
                Text(
                  post['name'],
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(width: size.width * 0.44),
                Icon(Icons.more_vert)
              ],
            ),
            SizedBox(height: 10),

            // Post content
            Text(post['postContent']),
            SizedBox(height: 10),

            // Post image
            Container(
              width: double.infinity, // Full width
              height: 200, // Desired height of the post image
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(
                      'data:image/jpeg;base64,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'),
                  fit: BoxFit
                      .cover, // Makes the image cover the container neatly
                ),
              ),
            ),
            SizedBox(height: 10),

            // Like button and likes count row
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    post['liked'] ? Icons.thumb_up : Icons.thumb_up_outlined,
                    color: post['liked'] ? Colors.blue : Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      post['liked'] = !post['liked'];
                      post['liked'] ? post['likes']++ : post['likes']--;
                    });
                  },
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.comment)),
                IconButton(
                    onPressed: () {}, icon: Icon(Icons.arrow_outward_outlined))
              ],
            ),
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(post['avatarUrl']),
                ),
                SizedBox(
                  width: size.width * 0.03,
                ),
                Expanded(
                  child: Container(
                    height: size.height * 0.05, // Set your desired height
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(
                              color: Colors.white // Transparent border color
                              ),
                        ),

                        hintText: "add Comment",

                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: Colors.white, // Border color when focused
                            width: 2,
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical:
                                10), // Adjust padding for text field content
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
