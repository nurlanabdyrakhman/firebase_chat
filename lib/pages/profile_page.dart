import 'package:firebase_chat/pages/auth/login_page.dart';
import 'package:firebase_chat/pages/home_page.dart';
import 'package:firebase_chat/service/auth_service.dart';
import 'package:firebase_chat/shared/contants.dart';
import 'package:firebase_chat/widgets/widget.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({super.key, required this.userName, required this.email});
  String userName;
  String email;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  AuthService authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.symmetric(
            vertical: 50,
          ),
          children: [
            const Icon(
              Icons.account_circle,
              size: 150,
              color: Colors.teal,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              widget.userName,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            const Divider(
              height: 4,
            ),
            ListTile(
              onTap: () {
                nextScreen(context, const HomePage());
              },
              selectedColor: Theme.of(context).primaryColor,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 6,
              ),
              leading: const Icon(
                Icons.group,
              ),
              title: const Text(
                'Groups',
                style: TextStyle(color: Colors.green),
              ),
            ),
            ListTile(
              selected: true,
              onTap: () async {},
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 6,
              ),
              leading: const Icon(
                Icons.group,
              ),
              title: const Text(
                'Profile',
                style: TextStyle(color: Colors.green),
              ),
            ),
            ListTile(
              onTap: () async {
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text(
                          'Logout',
                        ),
                        content: const Text(
                          'Are you sure you want to logout?',
                        ),
                        actions: [
                          IconButton(
                             onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.cancel,
                              color: Colors.red,
                            ),
                           
                          ),
                          IconButton(
                           
                            onPressed: () async {
                              await authService.signOut();
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                    builder: (context) => LoginPage(),
                                  ),
                                  (route) => false);
                            }, icon: const Icon(
                              Icons.done,
                              color: Colors.green,
                            ),
                          ),
                        ],
                      );
                    });
                // authService.signOut().whenComplete(() {
                //   nextScreenReplace(
                //     context,
                //     const LoginPage(),
                //   );
                // });
              },
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 6,
              ),
              leading: const Icon(
                Icons.exit_to_app,
              ),
              title: const Text(
                'Logout',
                style: TextStyle(color: Colors.green),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 40,
          vertical: 160,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.account_circle,
              size: 150,
              color: Colors.brown[500],
            ),
            SizedBox(
              height: 13,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Full Name',
                  style: TextStyle(fontSize: 21),
                ),
                Text(
                  widget.userName,
                  style: const TextStyle(fontSize: 21),
                ),
              ],
            ),
            const Divider(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Email',
                  style: TextStyle(fontSize: 21),
                ),
                Text(
                  widget.email,
                  style: const TextStyle(fontSize: 21),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
