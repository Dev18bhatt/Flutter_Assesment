import 'package:assesment/controller/state_controller.dart';
import 'package:assesment/views/createPost.dart';
import 'package:assesment/views/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostPage extends GetView<normalController> {
  bool liked = false; // Initial state of the like button
  int likes = 0; // Initial count of likes
  normalController controller = Get.put(normalController());
  final List<Map<String, dynamic>> posts = [
    {
      'avatarUrl':
          'https://images.unsplash.com/photo-1490721742404-99d73e57700b?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fHNwbGFzaHxlbnwwfHwwfHx8MA%3D%3D', // Replace with actual image URL
      'name': 'John Doe',
      'postContent': 'This is the first post content',
      'postImageUrl':
          'https://images.unsplash.com/photo-1528965051322-6d335c69eb86?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fHNwbGFzaHxlbnwwfHwwfHx8MA%3D%3D', // Replace with post image URL
      'likes': 10,
      'liked': false
    },
    {
      'avatarUrl': '', // Replace with actual image URL
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
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0, // Remove AppBar shadow
        automaticallyImplyLeading: false, // Disable the default back button
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Asset image
            Image.asset(
              'assets/images/logo.jpeg',
              height: size.height * 0.05, // Adjust image size
              width: size.width * 0.35,
            ),
            SizedBox(width: 10), // Spacing between image and text/icon
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add_alert_rounded,
                color: Colors.grey[700]), // Alarm icon
            onPressed: () {
              // Alarm icon press action
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return postCard(index, context);
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Allows 4+ icons
        currentIndex: controller.selectedIndex,
        onTap: (index) {
          controller.selectedIndex = index;
          if (controller.selectedIndex == 2) {
            Get.to(() => CreatePostPage());
          }
          if (controller.selectedIndex == 4) {
            Get.to(() => ProfilePage());
          }
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
      ),
    );
  }

  Widget postCard(int index, BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    final post = posts[index];
    return Card(
      color: Colors.white,
      elevation: 5, // Slight shadow for better depth
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Avatar and name row
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                      'https://imageio.forbes.com/specials-images/imageserve/66ec412983c576047f2b8911/Black-and-white-photo-of-Fyodor-Dostoyevsky-/0x0.jpg?format=jpg&crop=1575,1050,x2,y156,safe&width=1440'),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    post['name'],
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
                Icon(Icons.more_vert, color: Colors.grey[600])
              ],
            ),
            SizedBox(height: 10),

            // Post content
            Text(
              post['postContent'],
              style: TextStyle(fontSize: 14, color: Colors.grey[800]),
            ),
            SizedBox(height: 10),

            // Post image
            Container(
              width: double.infinity,
              height: size.height *
                  0.25, // Adjusted image height for better display
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: NetworkImage(
                    'https://plus.unsplash.com/premium_photo-1664303012848-6bfbea738ac5?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8YW1zdGVyZGFtJTIwUGVvcGxlc3xlbnwwfHwwfHx8MA%3D%3D',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 15),

            // Like button and likes count row
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    post['liked'] ? Icons.thumb_up : Icons.thumb_up_outlined,
                    color: post['liked'] ? Colors.blue : Colors.grey,
                  ),
                  onPressed: () {
                    post['liked'] = !post['liked'];
                    post['liked'] ? post['likes']++ : post['likes']--;
                  },
                ),
                Text(
                  '${post['likes']} Likes',
                  style: TextStyle(color: Colors.grey[700], fontSize: 12),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.comment_outlined, color: Colors.grey[600]),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.share_outlined, color: Colors.grey[600]),
                )
              ],
            ),
            Divider(),

            // Comment Section
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1490721742404-99d73e57700b?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fHNwbGFzaHxlbnwwfHwwfHx8MA%3D%3D'),
                ),
                SizedBox(width: size.width * 0.03),
                Expanded(
                  child: Container(
                    height: size.height * 0.05,
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(
                              color: Colors.grey.shade300,
                              width: 1), // Softer border color
                        ),
                        hintText: "Add a comment...",
                        hintStyle:
                            TextStyle(color: Colors.grey[500], fontSize: 13),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(
                            color: Colors.blue, // Border color when focused
                            width: 1.5,
                          ),
                        ),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
