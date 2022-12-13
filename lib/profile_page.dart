import 'package:flutter/material.dart';
import 'package:profile_page_redesign/edit_profile_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: const BackButton(),
        centerTitle: true,
        title: const Text('Profile Page',
            style: TextStyle(fontSize: 28, color: Colors.black)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(50, 120, 50, 50),
          child: Column(
            children: [
              SizedBox(
                width: 180,
                height: 150,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(
                        'https://cdn-icons-png.flaticon.com/512/3135/3135715.png')),
              ),
              const SizedBox(height: 20),
              const Text('Joe Bloggs',
                  style: TextStyle(fontSize: 28, color: Colors.black)),
              const Text('JoeBloggs@gmail.com',
                  style: TextStyle(fontSize: 16, color: Colors.black)),
              const SizedBox(height: 20),
              const Divider(
                color: Colors.black,
                thickness: 1.0,
              ),
              const SizedBox(height: 10),
              ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.blue.withOpacity(0.1),
                  ),
                  child: const Icon(Icons.settings, color: Colors.blue),
                ),
                title: const Text('Settings',
                    style: TextStyle(fontSize: 16, color: Colors.black)),
                trailing: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.grey.withOpacity(0.1),
                    ),
                    child: const Icon(Icons.arrow_right,
                        size: 18.0, color: Colors.grey)),
              ),
            ],
          ),
        ),
      ),
      endDrawer: const NavigationDrawer(),
    );
  }
}

/// child: Image.network(
///  'https://images.unsplash.com/photo-1533035353720-f1c6a75cd8ab?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8Z3JleXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',

///endDrawer: const NavigationDrawer(),

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Drawer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildHeader(context),
              buildMenuItems(context),
            ],
          ),
        ),
      );

  Widget buildHeader(BuildContext context) => Container(
        color: Colors.grey.shade500,
        padding: EdgeInsets.only(
          top: 24 + MediaQuery.of(context).padding.top,
          bottom: 24,
        ),
        child: Column(children: const [
          CircleAvatar(
            radius: 52,
            backgroundImage: NetworkImage(
              'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
            ),
          ),
          SizedBox(height: 12),
          Text(
            'Joe Bloggs',
            style: TextStyle(fontSize: 28, color: Colors.white),
          ),
          Text(
            'JoeBloggs@gmail.com',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ]),
      );

  Widget buildMenuItems(BuildContext context) => Container(
        padding: const EdgeInsets.all(24),
        child: Wrap(
          runSpacing: 16,
          children: [
            ListTile(
                leading: const Icon(Icons.person_outline),
                title: const Text('Edit Profile'),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const EditProfilePage(),
                  ));
                }),
            ListTile(
              leading: const Icon(Icons.favorite_border),
              title: const Text('Favourites'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.workspaces_outline),
              title: const Text('My Upload History'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.update),
              title: const Text('Check For Updates'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.account_tree_outlined),
              title: const Text('Plugins'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.notifications_outlined),
              title: const Text('Notifications'),
              onTap: () {},
            ),
          ],
        ),
      );
}
