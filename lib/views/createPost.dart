import 'dart:developer';
import 'dart:io';
import 'package:assesment/views/profile_page.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreatePostPage extends StatefulWidget {
  @override
  _CreatePostPageState createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  bool isChecked = false; // This tracks whether the checkbox is checked
  dynamic selectedImage;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    bool _obscureText = true;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Post"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align children to the left
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: selectedImage != null
                  ? Container(
                      width: double.infinity,
                      height: size.height * 0.2,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: FileImage(selectedImage),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    )
                  : DottedBorder(
                      borderType: BorderType.RRect,
                      radius: const Radius.circular(10),
                      dashPattern: const [10, 4],
                      strokeCap: StrokeCap.round,
                      color: Colors.grey,
                      child: Container(
                        width: double.infinity,
                        height: 150,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200.withOpacity(.3),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.cloud_download_outlined,
                              color: Colors.grey,
                              size: 40,
                            ),
                            SizedBox(height: size.height * 0.01),
                            TextButton(
                              onPressed: () async {
                                final picker = ImagePicker();
                                final pickImage = await picker.pickImage(
                                    source: ImageSource.gallery);

                                if (pickImage != null) {
                                  File pickFile = File(pickImage.path);
                                  setState(() {
                                    selectedImage = pickFile;
                                    log(selectedImage.toString());
                                  });
                                } else {
                                  print("Empty");
                                }
                              },
                              child: const Text(
                                'Upload An Image here',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                  decorationColor: Colors.black,
                                  decorationThickness: 3,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20.0, top: 16.0), // Better spacing
              child: Text.rich(
                TextSpan(
                  text: 'Event Title',
                  style: const TextStyle(fontSize: 16),
                  children: const [
                    TextSpan(
                      text: '*',
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter your text here',
                  filled: true,
                  fillColor: Colors.white, // TextFormField background
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(30.0), // Fully rounded corners
                    borderSide: const BorderSide(color: Colors.transparent),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: const BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide:
                        const BorderSide(color: Colors.blue, width: 2.0),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 15.0,
                      horizontal: 20.0), // Padding inside TextFormField
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20.0, top: 16.0), // Better spacing
              child: Text.rich(
                TextSpan(
                  text: 'Description',
                  style: const TextStyle(fontSize: 16),
                  children: const [
                    TextSpan(
                      text: '*',
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                maxLines: 4, // Multiple lines for the description
                decoration: InputDecoration(
                  hintText: 'Enter the description here',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: const BorderSide(color: Colors.transparent),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: const BorderSide(color: Colors.transparent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide:
                        const BorderSide(color: Colors.blue, width: 2.0),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 20.0,
                      horizontal: 20.0), // Increased height padding
                ),
              ),
            ),
            SizedBox(
                height: size.height * 0.15), // Adds space before the button
            Center(
              child: SizedBox(
                width: size.width * 0.9,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfilePage()),
                    );
                  },
                  child: const Text(
                    'Share',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.3, vertical: 6.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    backgroundColor: const Color.fromARGB(255, 255, 111, 0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
