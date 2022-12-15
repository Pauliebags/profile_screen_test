import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  bool follow = false;

  //bool follows = false;
  List<bool>? follows;
  File? image;
  File? galeryImage;
  File? downImage;
  File? stackImage;
  File? stckImage;

  // function for hyperlink accounts

  launchUrlForInstagram() async {
    const url = 'https://www.instagram.com/ramzan___ch/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  launchUrlForFacebook() async {
    const url = 'https://www.facebook.com/ramzan.anwar.56?mibextid=LQQJ4d';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  launchUrlForLinkedin() async {
    const url = 'https://www.linkedin.com/in/ramzan-ch-2bb2a1192/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  launchUrlForTwiter() async {
    const url = 'https://twitter.com/Ramzanch056';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  launchUrlForYouTube() async {
    const url = 'https://www.youtube.com/@EmaanOYaqeenOfficial';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  launchUrlForTikToke() async {
    const url = 'https://www.tiktok.com/@faaizkhankamalia?_t=8YDatTaQxMn&_r=1';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future pickedForStackl() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        stckImage = File(picked.path);
      });
    } else {
      return;
    }
  }

  Future pickedForStack() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        stackImage = File(picked.path);
      });
    } else {
      return;
    }
  }

  Future pickedForDownImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        downImage = File(picked.path);
      });
    } else {
      return;
    }
  }

  Future picked() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        galeryImage = File(picked.path);
      });
    } else {
      return;
    }
  }

  Future pickedImage() async {
    final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        image = File(picked.path);
      });
    } else {
      return;
    }
  }

  bool _isEditingText = false;
  TextEditingController _editingController = TextEditingController();
  String initialText =
      "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.";

  @override
  void initState() {
    super.initState();
    _editingController = TextEditingController(text: initialText);
  }

  @override
  void dispose() {
    _editingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            shrinkWrap: true,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'images/Flag_Icon.svg',
                              color: Colors.redAccent,
                              height: 70,
                              width: 70,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SvgPicture.asset(
                              'images/Flag_Icon.svg',
                              color: Colors.indigo,
                              height: 70,
                              width: 70,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Tobin Sydneysmith',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          'Washington US',
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300, color: Colors.black),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          padding: const EdgeInsets.all(3),
                          color: Colors.blue,
                          alignment: Alignment.center,
                          child: const Text(
                            'Follow   ^',
                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 200,
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10, top: 50),
                          child: CircularPercentIndicator(
                            radius: 60,
                            progressColor: Colors.brown,
                            percent: 0.4,
                            center: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: ClipOval(
                                child: image == null
                                    ? Image.asset('images/Profile Pic 2.png')
                                    : Image.file(
                                        image!,
                                        fit: BoxFit.fill,
                                      ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          right: 0,
                          top: 150,
                          child: Container(
                            height: 30,
                            width: 30,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.white, border: Border.all(color: Colors.grey), shape: BoxShape.circle),
                            child: const Text(
                              '34',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        Text(
                          'Top 10\nTrending Story',
                          textAlign: TextAlign.end,
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '188 reports',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '682 Followers',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '11m likes',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Nov, 2021 Member',
                          style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        follow = !follow;
                      });
                    },
                    child: Container(
                      height: 40,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        follow ? 'Following' : 'Follow',
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      pickedImage();
                    },
                    child: Container(
                      height: 40,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Text(
                        'Upload Photo',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Icon(
                      Icons.keyboard_arrow_down_sharp,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Channel',
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                        Spacer(),
                        Text(
                          'Profile',
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.blue),
                        ),
                        Spacer(
                          flex: 2,
                        ),
                        SizedBox(),
                      ],
                    ),
                    const Divider(
                      thickness: 2,
                    ),
                    _editTitleTextField(),
                    const Divider(
                      thickness: 2,
                    ),
                    const Text(
                      'If image could describe me;',
                      style: TextStyle(fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 150,
                      width: double.infinity,
                      child: Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          GestureDetector(
                            onTap: () {
                              pickedForStack();
                            },
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: stackImage == null
                                        ? const AssetImage('images/2.png')
                                        : FileImage(stackImage!) as ImageProvider,
                                    fit: BoxFit.fill,
                                  )),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              pickedForDownImage();
                            },
                            child: Container(
                              height: 70,
                              width: 70,
                              margin: const EdgeInsets.only(left: 40, bottom: 20),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: downImage == null
                                        ? const AssetImage('images/1.png')
                                        : FileImage(downImage!) as ImageProvider,
                                    fit: BoxFit.fill,
                                  )),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              picked();
                            },
                            child: Container(
                              height: 100,
                              width: 100,
                              margin: const EdgeInsets.only(
                                left: 110,
                              ),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: galeryImage == null
                                        ? const AssetImage('images/Ellipse 654.png')
                                        : FileImage(galeryImage!) as ImageProvider,
                                    fit: BoxFit.fill,
                                  )),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              pickedForStackl();
                            },
                            child: Container(
                              height: 60,
                              width: 60,
                              margin: const EdgeInsets.only(left: 80, top: 80),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: stckImage == null
                                        ? const AssetImage('images/5.png')
                                        : FileImage(stckImage!) as ImageProvider,
                                    fit: BoxFit.fill,
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      thickness: 2,
                    ),
                    const Text(
                      'My social Media links:',
                      style: TextStyle(fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              launchUrlForFacebook();
                            },
                            child: SvgPicture.asset(
                              'images/Facebook_icon.svg',
                              color: Colors.blue,
                              height: 20,
                              width: 20,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text('Facebook'),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              launchUrlForInstagram();
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(left: 4),
                              child: SvgPicture.asset(
                                'images/Instagram_logo.svg',
                                height: 20,
                                width: 20,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text('instagram'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              launchUrlForTwiter();
                            },
                            child: SvgPicture.asset(
                              'images/Twitter_icon.svg',
                              color: Colors.blue,
                              height: 20,
                              width: 20,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text('Twitter'),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              launchUrlForLinkedin();
                            },
                            child: SvgPicture.asset(
                              'images/Linkedin_logo.svg',
                              height: 20,
                              width: 20,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text('Linkedin'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              launchUrlForYouTube();
                            },
                            child: SvgPicture.asset(
                              'images/Youtube_icon.svg',
                              color: Colors.red,
                              fit: BoxFit.cover,
                              height: 20,
                              width: 20,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text('YouTube'),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {
                              launchUrlForTikToke();
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: SvgPicture.asset(
                                'images/TikTok_logo.svg',
                                fit: BoxFit.cover,
                                height: 20,
                                width: 20,
                              ),
                            ),
                          ),
                          const Text('TikTok'),
                        ],
                      ),
                    ),
                    const Divider(
                      thickness: 2,
                    ),
                    const Text(
                      'Who do i follow on purified?',
                      style: TextStyle(fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: List.generate(
                        6,
                        (index) => Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              const CircleAvatar(
                                radius: 30,
                                backgroundImage: AssetImage('images/1.png'),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Charles',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  Text(
                                    'washington',
                                    style: TextStyle(fontSize: 13),
                                  ),
                                  Text(
                                    'canada',
                                    style: TextStyle(fontSize: 13),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Container(
                                padding: const EdgeInsets.all(5),
                                color: Colors.blue,
                                alignment: Alignment.centerLeft,
                                child: Row(
                                  children: const [
                                    Text(
                                      'Follow',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Icon(
                                      Icons.person,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _editTitleTextField() {
    if (_isEditingText) {
      return Center(
        child: TextField(
          decoration: const InputDecoration(
              hintStyle: TextStyle(
            fontWeight: FontWeight.w500,
          )),
          onSubmitted: (newValue) {
            setState(() {
              initialText = newValue;
              _isEditingText = false;
            });
          },
          autofocus: true,
          controller: _editingController,
        ),
      );
    }
    return InkWell(
        onTap: () {
          setState(() {
            _isEditingText = true;
          });
        },
        child: Text(
          initialText,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 15.0,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ));
  }
}
