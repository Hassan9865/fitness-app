import 'package:bloc/bloc.dart';

class BottomNavbarCubit extends Cubit<int> {
  BottomNavbarCubit() : super(0);

  setIndex(int index) {
    emit(index);
  }
}
