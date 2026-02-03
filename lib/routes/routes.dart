import 'package:fitness_tracker/AuthGate/auth_gate.dart';
import 'package:fitness_tracker/features/Ai%20chat/aiChat_view.dart';
import 'package:fitness_tracker/features/Auth/view/login/login_view.dart';
import 'package:fitness_tracker/features/Auth/view/registration/age_view.dart';
import 'package:fitness_tracker/features/Auth/view/registration/fitness_goal_view.dart';
import 'package:fitness_tracker/features/Auth/view/registration/gender_view.dart';
import 'package:fitness_tracker/features/Auth/view/registration/height_view.dart';
import 'package:fitness_tracker/features/Auth/view/registration/weight_view.dart';
import 'package:fitness_tracker/features/Auth/view/signup/signup_view.dart';
import 'package:fitness_tracker/features/ai%20coach/aicoach_view.dart';
import 'package:fitness_tracker/features/bottom_NavBar/bottom_NavBar_view.dart';
import 'package:fitness_tracker/features/home/home_view.dart';
import 'package:fitness_tracker/features/notification/notifi_view.dart';
import 'package:fitness_tracker/features/nutrition/nutrition_view.dart';
import 'package:fitness_tracker/features/profile/profile_view.dart';
import 'package:fitness_tracker/features/settings/change_password/change_password_view.dart';
import 'package:fitness_tracker/features/settings/change_password/new_password/new_password.view.dart';
import 'package:fitness_tracker/features/settings/change_password/verify_code/change_password_verify_view.dart';
import 'package:fitness_tracker/features/settings/settings_view.dart';
import 'package:fitness_tracker/features/splash/splash_view.dart';
import 'package:fitness_tracker/features/trainer%20chat/Tchats_view.dart';
import 'package:fitness_tracker/features/trainer%20chat/Tchatting_view.dart';
import 'package:fitness_tracker/features/trainer/trainer_view.dart';
import 'package:fitness_tracker/features/watch/steps/biking/biking_view.dart';
import 'package:fitness_tracker/features/watch/steps/running/running_view.dart';
import 'package:fitness_tracker/features/watch/watch_view.dart';
import 'package:fitness_tracker/features/workout/workout_view.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (context, state) => SplashScreen()),
    GoRoute(
      path: '/bottomnavbar',
      builder: (context, state) => BottomNavbarView(),
    ),
    GoRoute(path: '/authgate', builder: (context, state) => AuthGate()),
    GoRoute(path: '/loginview', builder: (context, state) => LoginView()),
    GoRoute(path: '/signupview', builder: (context, state) => SignupView()),
    GoRoute(
      path: '/fitnessgoal',
      builder: (context, state) => FitnessGoalView(),
    ),
    GoRoute(path: '/genderview', builder: (context, state) => GenderView()),
    GoRoute(path: '/weightview', builder: (context, state) => WeightView()),
    GoRoute(path: '/heightview', builder: (context, state) => HeightView()),
    GoRoute(path: '/ageview', builder: (context, state) => AgeView()),
    GoRoute(path: '/homeview', builder: (context, state) => HomeView()),
    GoRoute(path: '/settingsview', builder: (context, state) => SettingsView()),
    GoRoute(
      path: '/changepasswordview',
      builder: (context, state) => ChangePasswordView(),
    ),
    GoRoute(
      path: '/verifyPasswordChangeView',
      builder: (context, state) => ChangePasswordVerifyview(),
    ),
    GoRoute(
      path: '/newPasswordView',
      builder: (context, state) => NewPasswordView(),
    ),
    GoRoute(path: '/notifiview', builder: (context, state) => NotifiView()),
    GoRoute(path: '/profileview', builder: (context, state) => ProfileView()),
    GoRoute(path: '/workoutview', builder: (context, state) => WorkoutView()),
    GoRoute(path: '/aicoachview', builder: (context, state) => AicoachView()),
    GoRoute(path: '/aichatview', builder: (context, state) => AichatView()),
    GoRoute(path: '/tchatsview', builder: (context, state) => TchatsView()),
    GoRoute(
      path: '/nutritionview',
      builder: (context, state) => NutritionScreen(),
    ),
    GoRoute(
      path: '/tchattingview',
      builder: (context, state) => TchattingView(),
    ),
    GoRoute(path: '/watchView', builder: (context, state) => WatchView()),
    GoRoute(
      path: '/trainersview',
      builder: (context, state) => TrainersScreen(),
    ),
    // GoRoute(path: '/walkingView', builder: (context, state) => Walkingview()),
    GoRoute(path: '/runningView', builder: (context, state) => RunningView()),
    GoRoute(path: '/bikingView', builder: (context, state) => BikingView()),
  ],
);
