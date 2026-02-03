import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'registration_state.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  RegistrationCubit() : super(RegistrationInitial());

  void selectGoal(int index) {
    emit(GoalSelcte(index));
  }

  Future<void> savegoal(int index, String goaltxt) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('goalIndex', index);
    await prefs.setString('goaltxt', goaltxt);
  }

  void selectGender(int index) {
    emit(SelectGender(index));
  }

  Future<void> savegender(int index, String gender) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('index', index);
    await prefs.setString('gender', gender);
  }

  void updatedWeight(double newweight) {
    emit(SelectWeight(newweight));
  }

  Future<void> saveWeight(double weight) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('weight', weight);
  }

  Future<void> saveheight(String height) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('height', height);
  }

  void updatedAge(int newAge) {
    emit(SelectAge(newAge));
  }

  Future<void> saveAge(int age) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('age', age);
  }

  Future<Map<String, dynamic>> getSaveData() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'email': prefs.getString('email') ?? "",
      'password': prefs.getString('password') ?? "",
      'goaltxt': prefs.getString('goaltxt') ?? "",
      'gender': prefs.getString('gender') ?? "",
      'height': prefs.getString('height') ?? "",
      'weight': prefs.getDouble('weight') ?? 0.0,
      'age': prefs.getInt('age') ?? 0,
      'firstName': prefs.getString('firstName') ?? "",
      'lastName': prefs.getString('lastName') ?? "",
      'name': prefs.getString('name') ?? '',
      'image': '',
    };
  }
}
