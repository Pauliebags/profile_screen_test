import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:profile_page_redesign/profile_screen/edit_profile.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

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
                        Row(
                          children: [
                            SvgPicture.asset(
                              'images/Flag_Icon.svg',
                              color: Colors.indigo,
                              height: 50,
                              width: 70,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            SvgPicture.asset(
                              'images/Flag_Icon.svg',
                              color: Colors.redAccent,
                              height: 50,
                              width: 70,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Robin Sydnesmith",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Text(
                          "Washington US",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300, color: Colors.black),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          padding: const EdgeInsets.all(3),
                          color: Colors.blue,
                          alignment: Alignment.center,
                          child: const Text(
                            "Grade   A",
                            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfile()));
                    },
                    child: Container(
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
                                  child: Image.asset("images/4.png"),
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
                              child: const Text("24"),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        Text(
                          "Top 10\nTrending Story",
                          textAlign: TextAlign.end,
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.grey),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "188 reports",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.grey),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "682 Followers",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.grey),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "11m likes",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.grey),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Nov, 2021 Member",
                          style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Channel",
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                        Spacer(),
                        Text(
                          "Profile",
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
                    const Text(
                      'Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content.',
                      style: TextStyle(fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                    const Divider(
                      thickness: 2,
                    ),
                    const Text(
                      'If image could explain me',
                      style: TextStyle(fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                    Container(
                      height: 150,
                      width: double.infinity,
                      child: Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, image: DecorationImage(image: AssetImage('images/2.png'))),
                          ),
                          Container(
                            height: 70,
                            width: 70,
                            margin: const EdgeInsets.only(left: 40, bottom: 20),
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, image: DecorationImage(image: AssetImage('images/1.png'))),
                          ),
                          Container(
                            height: 100,
                            width: 100,
                            margin: const EdgeInsets.only(
                              left: 110,
                            ),
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(image: AssetImage('images/Ellipse 654.png'))),
                          ),
                          Container(
                            height: 60,
                            width: 60,
                            margin: const EdgeInsets.only(left: 80, top: 80),
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, image: DecorationImage(image: AssetImage('images/5.png'))),
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
                          SvgPicture.asset(
                            'images/Facebook_icon.svg',
                            height: 20,
                            width: 20,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text("Facebook"),
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
                          const Text("instagram"),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'images/Twitter_icon.svg',
                            height: 20,
                            width: 20,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text("Twitter"),
                          const Spacer(),
                          SvgPicture.asset(
                            'images/Linkedin_logo.svg',
                            height: 20,
                            width: 20,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text("Linkedin"),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            'images/Youtube_icon.svg',
                            fit: BoxFit.cover,
                            height: 20,
                            width: 20,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text("YouTube"),
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
                          const Text("TikTok"),
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
                                    "Charles",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  Text(
                                    "washington",
                                    style: TextStyle(fontSize: 13),
                                  ),
                                  Text(
                                    "canada",
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
                                      "Follow",
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
