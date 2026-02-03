part of 'registration_cubit.dart';

sealed class RegistrationState extends Equatable {
  const RegistrationState();

  @override
  List<Object> get props => [];
}

final class RegistrationInitial extends RegistrationState {}

class GoalSelcte extends RegistrationState {
  final int selectedGoal;
  const GoalSelcte(this.selectedGoal);

  @override
  List<Object> get props => [selectedGoal];
}

class SelectGender extends RegistrationState {
  final int selectgender;
  const SelectGender(this.selectgender);
  @override
  List<Object> get props => [selectgender];
}

class SelectWeight extends RegistrationState {
  final double selectWeight;
  const SelectWeight(this.selectWeight);
  @override
  List<Object> get props => [selectWeight];
}

class SelectAge extends RegistrationState {
  final int selectAge;
  const SelectAge(this.selectAge);
  @override
  List<Object> get props => [selectAge];
}
