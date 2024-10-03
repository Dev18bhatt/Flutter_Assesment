import 'dart:developer';

import 'package:assesment/controller/state_controller.dart';
import 'package:assesment/views/createPost.dart';
import 'package:assesment/views/post.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class ProfilePage extends GetView<normalController> {
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    normalController controller = Get.put(normalController());

    // Sample data for the GridView
    final List<String> imageUrls = [
      'https://plus.unsplash.com/premium_photo-1661887237533-b38811c27add?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8YW1zdGVyZGFtfGVufDB8fDB8fHww',
      'https://images.unsplash.com/photo-1468436385273-8abca6dfd8d3?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8YW1zdGVyZGFtfGVufDB8fDB8fHww',
      'https://images.unsplash.com/photo-1583295125721-766a0088cd3f?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fGFtc3RlcmRhbXxlbnwwfHwwfHx8MA%3D%3D',
      'https://images.unsplash.com/photo-1524047934617-cb782c24e5f3?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fGFtc3RlcmRhbXxlbnwwfHwwfHx8MA%3D%3D',
      'https://images.unsplash.com/photo-1525615466489-bcc019b90420?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fGFtc3RlcmRhbXxlbnwwfHwwfHx8MA%3D%3D',
      'https://plus.unsplash.com/premium_photo-1661964194420-d1237f0b7bd8?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fGFtc3RlcmRhbXxlbnwwfHwwfHx8MA%3D%3D',
      'https://images.unsplash.com/photo-1489340515768-943cfb51431a?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTl8fGFtc3RlcmRhbXxlbnwwfHwwfHx8MA%3D%3D',
      'https://images.unsplash.com/photo-1525615466489-bcc019b90420?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fGFtc3RlcmRhbXxlbnwwfHwwfHx8MA%3D%3D',
      'https://media.istockphoto.com/id/1495768047/photo/panoramic-view-of-amsterdam.webp?a=1&b=1&s=612x612&w=0&k=20&c=YqJ1iX_pudHL0f5lapWylTP9aO4bFYiD-s0fa-rKK8g=',
      'https://via.placeholder.com/300',
      'https://via.placeholder.com/350',
      'https://via.placeholder.com/400',
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(
                // Desired height
                child: Image.asset(
                  'assets/images/logo.jpeg',
                  width: size.width * 0.6, // Chhoti width
                  height: size.height * 0.2, // Chhoti height
                ),
              ),
              SizedBox(
                width: size.width * 0.3,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            PostPage(), // Navigate to LoginPage
                      ),
                    );
                  },
                  child: Icon(Icons.list))
            ],
          ),
          Container(
            // Add padding if you want a border
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
              radius: 50,
              backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1456315138460-858d1089ddba?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8YW1zdGVyZGFtJTIwUGVvcGxlc3xlbnwwfHwwfHx8MA%3D%3D'),
            ),
          ),
          SizedBox(height: 10),

          // User Name
          Text(
            '${controller.username}',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 5),

          // Bio
          Text(
            'Intrested in Running',
            style: TextStyle(
              fontSize: 10,
              color: Colors.grey,
            ),
          ),

          SizedBox(height: 20),

          // Number of Posts, Followers, Following
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text('15', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('Post',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                        )),
                  ],
                ),
                Column(
                  children: [
                    Text('150', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('Followers',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                        )),
                  ],
                ),
                Column(
                  children: [
                    Text('98', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('Following',
                        style: TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                        )),
                  ],
                ),
              ],
            ),
          ),

          SizedBox(height: 30),

          // Edit Profile and Create Postcard Buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.03, vertical: 6.0),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(8.0), // Rounded rectangle
                      ),
                      backgroundColor:
                          Colors.white70, // Button color in dark mode
                    ),
                    onPressed: () {
                      // Edit profile logic here
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.person,
                          color: Colors.black,
                        ),
                        SizedBox(
                          width: size.width * 0.02,
                        ),
                        Text('Edit Profile',
                            style: TextStyle(color: Colors.black)),
                      ],
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.03, vertical: 6.0),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(8.0), // Rounded rectangle
                    ),
                    backgroundColor:
                        Colors.white70, // Button color in dark mode
                  ),
                  onPressed: () {
                    // Create Postcard logic here
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.create,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: size.width * 0.02,
                      ),
                      Text('Create Postcard',
                          style: TextStyle(color: Colors.black)),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Row(
              // children: [Icon(Icons)],
              ),

          SizedBox(height: size.height * 0.02),

          // GridView.builder to display 3 items per row
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // 3 items per row
                  crossAxisSpacing: 20.0,
                  mainAxisSpacing: 20.0,
                  childAspectRatio: 1, // Make the items more square-shaped
                ),
                itemCount: imageUrls.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(15), // Rounded corners
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    clipBehavior:
                        Clip.hardEdge, // Clip the image to the rounded shape
                    child: Image.network(
                      imageUrls[index],
                      fit: BoxFit
                          .cover, // Adjusts the image to cover the grid item
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Allows 4+ icons
        currentIndex: controller.selectedIndex,
        onTap: (index) {
          controller.selectedIndex = index;
          if (controller.selectedIndex == 0) {
            Get.to(() => PostPage());
          }
          if (controller.selectedIndex == 2) {
            Get.to(() => CreatePostPage());
          }
          if (controller.selectedIndex == 4) {
            Get.to(() => ProfilePage());
          }

          log("${controller.selectedIndex}");
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
            icon: GestureDetector(
              onTap: () {
                if (controller.selectedIndex == 4) {
                  Get.to(() => ProfilePage());
                }
              },
              child: Container(
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
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
