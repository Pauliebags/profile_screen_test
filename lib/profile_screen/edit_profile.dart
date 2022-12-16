import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: const BackButton(),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
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
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          'Washington US',
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                              color: Colors.black),
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
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
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
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 50),
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
                                color: Colors.white,
                                border: Border.all(color: Colors.grey),
                                shape: BoxShape.circle),
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
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '188 reports',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '682 Followers',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '11m likes',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Nov, 2021 Member',
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
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
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
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
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
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
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        Spacer(),
                        Text(
                          'Profile',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                        Spacer(
                          flex: 2,
                        ),
                        SizedBox(),
                      ],
                    ),
                    Divider(
                      thickness: 2,
                      color: Colors.grey.shade700,
                    ),
                    const Text(
                      'Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.',
                      style: TextStyle(fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                    Divider(
                      thickness: 2,
                      color: Colors.grey.shade700,
                    ),
                    const Text(
                      'If image could explain me;',
                      style: TextStyle(fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 150,
                      width: double.infinity,
                      child: Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage('images/2.png'))),
                          ),
                          Container(
                            height: 70,
                            width: 70,
                            margin: const EdgeInsets.only(left: 40, bottom: 20),
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage('images/1.png'))),
                          ),
                          Container(
                            height: 100,
                            width: 100,
                            margin: const EdgeInsets.only(
                              left: 110,
                            ),
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image:
                                        AssetImage('images/Ellipse 654.png'))),
                          ),
                          Container(
                            height: 60,
                            width: 60,
                            margin: const EdgeInsets.only(left: 80, top: 80),
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage('images/5.png'))),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 2,
                      color: Colors.grey.shade700,
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
                          SvgPicture.asset(
                            'images/Facebook_icon.svg',
                            color: Colors.blue,
                            height: 20,
                            width: 20,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text('Facebook'),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(left: 4),
                            child: SvgPicture.asset(
                              'images/Instagram_logo.svg',
                              height: 20,
                              width: 20,
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
                          SvgPicture.asset(
                            'images/Twitter_icon.svg',
                            color: Colors.blue,
                            height: 20,
                            width: 20,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text('Twitter'),
                          const Spacer(),
                          SvgPicture.asset(
                            'images/Linkedin_logo.svg',
                            height: 20,
                            width: 20,
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
                          SvgPicture.asset(
                            'images/Youtube_icon.svg',
                            color: Colors.red,
                            fit: BoxFit.cover,
                            height: 20,
                            width: 20,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text('YouTube'),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: SvgPicture.asset(
                              'images/TikTok_logo.svg',
                              fit: BoxFit.cover,
                              height: 20,
                              width: 20,
                            ),
                          ),
                          const Text('TikTok'),
                        ],
                      ),
                    ),
                    Divider(
                      thickness: 2,
                      color: Colors.grey.shade700,
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
}
