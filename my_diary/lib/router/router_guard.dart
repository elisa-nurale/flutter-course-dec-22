import 'package:auto_route/auto_route.dart';
import 'package:flutter_course_dec_22/globals/globals.dart';

class AuthGuard extends AutoRouteGuard{
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    final loggedIn = await storage.read(key: 'loggedIn');
    if(loggedIn != null){
      resolver.next(true);
    }
    else{
      resolver.next(false);
    }
  }
}