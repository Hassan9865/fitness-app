class HomeAchievement {
  final String name;
  final String icon;
  final bool unlocked;

  HomeAchievement({
    required this.name,
    required this.icon,
    required this.unlocked,
  });

  HomeAchievement copyWith({String? name, String? icon, bool? unlocked}) {
    return HomeAchievement(
      name: name ?? this.name,
      icon: icon ?? this.icon,
      unlocked: unlocked ?? this.unlocked,
    );
  }
}
