import 'package:auto_route/auto_route_annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ducafecat_news/common/router/auth_grard.dart';
import 'package:flutter_ducafecat_news/pages/application/application.dart';
import 'package:flutter_ducafecat_news/pages/details/details.dart';
import 'package:flutter_ducafecat_news/pages/index/index.dart';
import 'package:flutter_ducafecat_news/pages/sign_in/sign_in.dart';
import 'package:flutter_ducafecat_news/pages/sign_up/sign_up.dart';
import 'package:flutter_ducafecat_news/pages/welcome/welcome.dart';

Widget zoomInTransition(BuildContext context, Animation<double> animation,
    Animation<double> secondaryAnimation, Widget child) {
  // you get an animation object and a widget
  // make your own transition
  return ScaleTransition(scale: animation, child: child);
}

@MaterialAutoRouter(generateNavigationHelperExtension: false)
class $AppRouter {
  @initial
  IndexPage indexPageRoute;

  WelcomePage welcomePageRoute;

  SignInPage signInPageRoute;

  SignUpPage signUpPageRoute;

  @GuardedBy([AuthGuard])
  ApplicationPage applicationPageRoute;

  @GuardedBy([AuthGuard])
  @CustomRoute(transitionsBuilder: zoomInTransition)
  DetailsPage detailsPageRoute;
}
