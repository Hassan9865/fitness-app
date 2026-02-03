// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:fitness_tracker/features/Auth/models/createuser_model.dart';
// import 'package:fitness_tracker/features/Auth/repository/auth_repo.dart';

// import 'package:shared_preferences/shared_preferences.dart';

// part 'auth_state.dart';

// class AuthCubit extends Cubit<AuthState> {
//   // final AuthRepository authRepository;
//   AuthCubit() : super(AuthInitial());

//   Future loginUser(String email, String password) async {
//     emit(AuthLoading());
//     try {
//       await authRepository.loginUser(email, password);
//       emit(AuthSucess());
//     } catch (e) {
//       emit(AuthError(e.toString()));
//     }
//   }

//   Future createUser(CreateUserModel model) async {
//     emit(AuthLoading());
//     try {
//       await authRepository.createUser(model);
//       emit(AuthSucess());
//     } catch (e) {
//       emit(AuthError(e.toString()));
//     }
//   }

//   Future logout() async {
//     emit(AuthLoading());
//     try {
//       await authRepository.logOut();
//       emit(AuthLogoutState());
//     } catch (e) {
//       emit(AuthError(e.toString()));
//     }
//   }

//   void loginvalidate(String email, String password) {
//     if (email.isEmpty || password.isEmpty) {
//       emit(AuthError("All fields are required"));
//       return;
//     }

//     emit(AuthSucess());
//   }

//   void validateAndNavigate(String fname, String lname, String email,
//       String password, String confirmpass) {
//     if (fname.isEmpty ||
//         lname.isEmpty ||
//         email.isEmpty ||
//         password.isEmpty ||
//         confirmpass.isEmpty) {
//       emit(AuthError("All Feilds are required"));
//     } else if (password != confirmpass) {
//       emit(AuthError("Pasword do not match"));
//     } else {
//       emit(AuthSucess());
//     }
//   }

//   Future<void> saveEmailPass(
//       String firstName, String lastName, String email, String password) async {
//     final pref = await SharedPreferences.getInstance();
//     await pref.setString('name', firstName);
//     await pref.setString('firstName', firstName);
//     await pref.setString('lastName', lastName);
//     await pref.setString('email', email);
//     await pref.setString('password', password);
//   }
// }
