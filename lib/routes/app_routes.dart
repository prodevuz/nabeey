import 'package:flutter/material.dart';
import 'package:nabeey/routes/routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nabeey/features/quiz/screens/quiz/quiz.dart';
import 'package:nabeey/features/explore/screens/category/category.dart';
import 'package:nabeey/features/authentication/screens/signup/signup.dart';
import 'package:nabeey/features/authentication/blocs/signup/signup_bloc.dart';
import 'package:nabeey/bindings/service_locator.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ADRoutes.home:
        return MaterialPageRoute(builder: (_) => const CategoryScreen());
      case ADRoutes.quiz:
        return MaterialPageRoute(builder: (_) => const QuizScreen());
      case ADRoutes.signup:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<SignupBloc>(
            create: (context) => getIt<SignupBloc>(),
            child: const SignupScreen(),
          ),
        );
      // case ADRoutes.rating:
      //   return MaterialPageRoute(builder: (_) => const RatingScreen());
      // case ADRoutes.profile:
      //   return MaterialPageRoute(builder: (_) => const ProfileScreen());
      // case ADRoutes.onBoarding:
      //   return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      // case ADRoutes.editProfile:
      //   return MaterialPageRoute(builder: (_) => const EditProfileScreen());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(title: const Text('Sahifa topilmadi')),
        body: const Center(child: Text('Sahifa topilmadi!')),
      );
    });
  }
}
