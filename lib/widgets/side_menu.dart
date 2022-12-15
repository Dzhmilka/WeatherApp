import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/widgets/change_city.dart';
import 'package:weather_app/widgets/google_maps.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'google_sign_in.dart';

class NavDrawer extends StatelessWidget {
  final void Function(String) cityPass;

  const NavDrawer({super.key, required this.cityPass});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue[400]
            ),
              child: const Text(
                'Welcome to app!',
                style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
          ),
          ListTile(
            leading: const Icon(Icons.add_location),
            title: const Text('Open Google Maps'),
            onTap: () async {
              final cityName =
              await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MapSample()));
              print(cityName);
              cityPass(cityName);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.location_city),
            title: const Text('Search new city'),
            onTap: () async {
              final cityName =
              await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ChangeCity()));
              print(cityName);
              cityPass(cityName);
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(FontAwesomeIcons.google),
            title: const Text('Sign in with Google'),
            onTap: () {
              final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.googleLogin();
            },
          ),
          ListTile(
            leading: const Icon(Icons.facebook),
            title: const Text('Sign in with Facebook'),
            onTap: () async {
              final result = await FacebookAuth.i.login(
                  permissions: ["public_profile", "email"]
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Exit'),
            onTap: () => {exit(0)},
          ),
        ],
      ),
    );
  }
}