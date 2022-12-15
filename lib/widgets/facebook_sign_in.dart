import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FacebookSignInProvider {
  Map? userData;

  final result = await FacebookAuth.i.login(
  permissions: ["public_profile", "email"]
  );

  if (result.status == LoginStatus.success) {

  final userData = await FacebookAuth.i.getUserData(
  fields: "email,name",
  );

  setState(() {
  _userData = userData;
  });
}