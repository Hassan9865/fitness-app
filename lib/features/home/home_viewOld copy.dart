import 'package:fitness_tracker/components/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:fl_chart/fl_chart.dart';
import 'dart:math';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  // User data
  String _userName = "Ahmed";
  int _userLevel = 3;
  int _userXP = 450;
  int _nextLevelXP = 1000;

  // Daily stats
  int _todaySteps = 6842;
  int _todayGoalSteps = 10000;
  int _todayCalories = 320;
  int _todayCaloriesGoal = 500;
  int _todayWater = 5;
  int _waterGoal = 8;
  int _activeMinutes = 35;

  // Weekly progress
  List<double> _weeklySteps = [5200, 6800, 7200, 4900, 8400, 7100, 6842];
  List<String> _weekDays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

  // Today's workout plan
  List<TodayWorkout> _todayWorkouts = [];

  // Recent achievements
  List<HomeAchievement> _recentAchievements = [];

  // Quotes
  final List<String> _motivationalQuotes = [
    "💪 Don't stop when you're tired. Stop when you're done!",
    "🔥 The only bad workout is the one that didn't happen.",
    "🌟 Your only limit is your mind.",
    "🏆 Success starts with self-discipline.",
    "⚡ Make your future self proud!",
  ];
  String _todayQuote = "";

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_animationController);
    _animationController.forward();

    _loadUserData();
    _loadTodayWorkouts();
    _loadAchievements();
    _selectRandomQuote();
  }

  void _loadUserData() async {
    // In real app, load from SharedPreferences
    setState(() {
      _userName = "Ahmed";
      _userLevel = 3;
      _userXP = 450;
    });
  }

  void _loadTodayWorkouts() {
    _todayWorkouts = [
      TodayWorkout(
        name: "🏃 Warm Up",
        duration: "5 min",
        calories: 40,
        isCompleted: true,
      ),
      TodayWorkout(
        name: "💪 Push Ups",
        duration: "3 sets",
        calories: 60,
        isCompleted: true,
      ),
      TodayWorkout(
        name: "🦵 Squats",
        duration: "3 sets",
        calories: 70,
        isCompleted: false,
      ),
      TodayWorkout(
        name: "🔥 Burpees",
        duration: "2 sets",
        calories: 80,
        isCompleted: false,
      ),
      TodayWorkout(
        name: "🧘 Cool Down",
        duration: "5 min",
        calories: 30,
        isCompleted: false,
      ),
    ];
  }

  void _loadAchievements() {
    _recentAchievements = [
      HomeAchievement(name: "7 Day Streak", icon: "🔥", unlocked: true),
      HomeAchievement(name: "1000 Calories", icon: "⚡", unlocked: true),
      HomeAchievement(name: "Early Bird", icon: "🌅", unlocked: false),
      HomeAchievement(name: "Perfect Week", icon: "⭐", unlocked: false),
    ];
  }

  void _selectRandomQuote() {
    final random = Random();
    _todayQuote =
        _motivationalQuotes[random.nextInt(_motivationalQuotes.length)];
  }

  void _toggleWaterIntake() {
    setState(() {
      if (_todayWater < _waterGoal) {
        _todayWater++;
      }
    });
  }

  void _toggleWorkoutCompletion(int index) {
    setState(() {
      _todayWorkouts[index].isCompleted = !_todayWorkouts[index].isCompleted;
      if (_todayWorkouts[index].isCompleted) {
        _todayCalories += _todayWorkouts[index].calories;
      } else {
        _todayCalories -= _todayWorkouts[index].calories;
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appColors = Provider.of<AppColors>(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: appColors.background,
      body: SafeArea(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              // App Bar with Greeting
              SliverToBoxAdapter(child: _buildAppBar(appColors, screenWidth)),

              // XP Progress Bar
              SliverToBoxAdapter(child: _buildXPProgress(appColors)),

              // Motivational Quote
              SliverToBoxAdapter(child: _buildQuoteCard(appColors)),

              // Stats Row
              SliverToBoxAdapter(child: _buildStatsRow(appColors, screenWidth)),

              // Steps Progress
              SliverToBoxAdapter(child: _buildStepsCard(appColors)),

              // Weekly Steps Chart
              SliverToBoxAdapter(child: _buildWeeklyStepsChart(appColors)),

              // Today's Workout
              SliverToBoxAdapter(child: _buildTodayWorkout(appColors)),

              // Water Intake
              SliverToBoxAdapter(child: _buildWaterIntake(appColors)),

              // Recent Achievements
              SliverToBoxAdapter(child: _buildAchievementsRow(appColors)),

              // Quick Actions
              SliverToBoxAdapter(child: _buildQuickActions(appColors)),

              const SliverToBoxAdapter(child: SizedBox(height: 80)),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showQuickLogDialog,
        backgroundColor: Colors.deepOrange,
        child: const Icon(Icons.add, color: Colors.white, size: 30),
      ),
    );
  }

  Widget _buildAppBar(AppColors appColors, double screenWidth) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello, 👋",
                style: TextStyle(
                  color: appColors.onSecondary.withOpacity(0.7),
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                _userName,
                style: TextStyle(
                  color: appColors.onSecondary,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.deepOrange.shade400,
                  Colors.deepOrange.shade700,
                ],
              ),
              shape: BoxShape.circle,
            ),
            child: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.transparent,
              child: const Icon(Icons.person, color: Colors.white, size: 28),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildXPProgress(AppColors appColors) {
    final xpProgress = _userXP / _nextLevelXP;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: appColors.primary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.deepOrange.withOpacity(0.2),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              "Lvl $_userLevel",
              style: const TextStyle(
                color: Colors.deepOrange,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "$_userXP / $_nextLevelXP XP",
                      style: TextStyle(
                        fontSize: 12,
                        color: appColors.onSecondary.withOpacity(0.7),
                      ),
                    ),
                    Text(
                      "${(xpProgress * 100).toInt()}%",
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: LinearProgressIndicator(
                    value: xpProgress,
                    backgroundColor: Colors.grey.withOpacity(0.2),
                    color: Colors.deepOrange,
                    minHeight: 6,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuoteCard(AppColors appColors) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.deepOrange.shade700, Colors.deepOrange.shade400],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          const Icon(Icons.format_quote, color: Colors.white, size: 30),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              _todayQuote,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w500,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsRow(AppColors appColors, double screenWidth) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Row(
        children: [
          _buildStatCard(
            appColors,
            "🔥 Calories",
            "$_todayCalories",
            "/ $_todayCaloriesGoal",
            Icons.local_fire_department,
            Colors.orange,
            (_todayCalories / _todayCaloriesGoal).clamp(0.0, 1.0),
          ),
          const SizedBox(width: 12),
          _buildStatCard(
            appColors,
            "💧 Water",
            "$_todayWater",
            "/ $_waterGoal",
            Icons.water_drop,
            Colors.blue,
            (_todayWater / _waterGoal).clamp(0.0, 1.0),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(
    AppColors appColors,
    String title,
    String value,
    String goal,
    IconData icon,
    Color color,
    double progress,
  ) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: appColors.primary,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, color: color, size: 20),
                ),
                Text(
                  title,
                  style: TextStyle(
                    color: appColors.onSecondary.withOpacity(0.7),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  value,
                  style: TextStyle(
                    color: appColors.onSecondary,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  goal,
                  style: TextStyle(
                    color: appColors.onSecondary.withOpacity(0.5),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: progress,
                backgroundColor: Colors.grey.withOpacity(0.2),
                color: color,
                minHeight: 4,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStepsCard(AppColors appColors) {
    final stepProgress = _todaySteps / _todayGoalSteps;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: appColors.primary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "👟 Daily Steps",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  "${(stepProgress * 100).toInt()}%",
                  style: const TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                "$_todaySteps",
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                "/ $_todayGoalSteps steps",
                style: TextStyle(
                  fontSize: 14,
                  color: appColors.onSecondary.withOpacity(0.6),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: stepProgress.clamp(0.0, 1.0),
              backgroundColor: Colors.grey.withOpacity(0.2),
              color: Colors.green,
              minHeight: 10,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "🚶 ${(stepProgress * _todayGoalSteps).toInt()} steps to go!",
                style: TextStyle(
                  fontSize: 12,
                  color: appColors.onSecondary.withOpacity(0.6),
                ),
              ),
              Text(
                "🔥 ${(stepProgress * 400).toInt()} cal burned",
                style: const TextStyle(fontSize: 12, color: Colors.orange),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildWeeklyStepsChart(AppColors appColors) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: appColors.primary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "📊 Weekly Steps",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 180,
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.center,
                maxY: 10000,
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40,
                      getTitlesWidget: (value, meta) {
                        return Text(
                          "${(value / 1000).toInt()}k",
                          style: const TextStyle(
                            fontSize: 10,
                            color: Colors.grey,
                          ),
                        );
                      },
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        if (value.toInt() >= 0 &&
                            value.toInt() < _weekDays.length) {
                          return Text(
                            _weekDays[value.toInt()],
                            style: const TextStyle(
                              fontSize: 11,
                              color: Colors.grey,
                            ),
                          );
                        }
                        return const Text('');
                      },
                    ),
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                borderData: FlBorderData(show: false),
                barGroups: _weeklySteps.asMap().entries.map((entry) {
                  return BarChartGroupData(
                    x: entry.key,
                    barRods: [
                      BarChartRodData(
                        toY: entry.value,
                        color: Colors.deepOrange,
                        width: 25,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ],
                  );
                }).toList(),
                gridData: const FlGridData(show: true, drawVerticalLine: false),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTodayWorkout(AppColors appColors) {
    final completedCount = _todayWorkouts.where((w) => w.isCompleted).length;
    final totalCount = _todayWorkouts.length;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "💪 Today's Workout",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () => context.go('/workout'),
                child: const Text(
                  "View All →",
                  style: TextStyle(color: Colors.deepOrange),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ..._todayWorkouts.asMap().entries.map((entry) {
            final index = entry.key;
            final workout = entry.value;
            return GestureDetector(
              onTap: () => _toggleWorkoutCompletion(index),
              child: Container(
                margin: const EdgeInsets.only(bottom: 8),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: appColors.primary,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: workout.isCompleted
                        ? Colors.green
                        : Colors.transparent,
                    width: 1.5,
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: workout.isCompleted
                            ? Colors.green.withOpacity(0.2)
                            : Colors.deepOrange.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        workout.isCompleted
                            ? Icons.check_circle
                            : Icons.fitness_center,
                        color: workout.isCompleted
                            ? Colors.green
                            : Colors.deepOrange,
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            workout.name,
                            style: TextStyle(
                              color: appColors.onSecondary,
                              fontWeight: FontWeight.w600,
                              decoration: workout.isCompleted
                                  ? TextDecoration.lineThrough
                                  : null,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "⏱️ ${workout.duration} • 🔥 ${workout.calories} cal",
                            style: TextStyle(
                              fontSize: 11,
                              color: appColors.onSecondary.withOpacity(0.6),
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (!workout.isCompleted)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.deepOrange.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          "Start",
                          style: TextStyle(
                            color: Colors.deepOrange,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    if (workout.isCompleted)
                      const Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size: 20,
                      ),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildWaterIntake(AppColors appColors) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: appColors.primary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "💧 Water Intake",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "$_todayWater / $_waterGoal glasses",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: _toggleWaterIntake,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.add, color: Colors.blue, size: 18),
                      SizedBox(width: 4),
                      Text("Add Glass", style: TextStyle(color: Colors.blue)),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: List.generate(8, (index) {
              return Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  height: 8,
                  decoration: BoxDecoration(
                    color: index < _todayWater
                        ? Colors.blue
                        : Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildAchievementsRow(AppColors appColors) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "🏆 Recent Achievements",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _recentAchievements.length,
              itemBuilder: (context, index) {
                final achievement = _recentAchievements[index];
                return Container(
                  width: 80,
                  margin: const EdgeInsets.only(right: 12),
                  decoration: BoxDecoration(
                    color: appColors.primary,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: achievement.unlocked
                          ? Colors.amber
                          : Colors.grey.withOpacity(0.3),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        achievement.icon,
                        style: TextStyle(
                          fontSize: 30,
                          color: achievement.unlocked
                              ? Colors.amber
                              : Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        achievement.name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 10,
                          color: achievement.unlocked
                              ? appColors.onSecondary
                              : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActions(AppColors appColors) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "⚡ Quick Actions",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              _buildActionButton(
                appColors,
                "Start Workout",
                Icons.fitness_center,
                Colors.deepOrange,
                '/workout',
              ),
              const SizedBox(width: 12),
              _buildActionButton(
                appColors,
                "Log Meal",
                Icons.restaurant,
                Colors.green,
                '/nutrition',
              ),
              const SizedBox(width: 12),
              _buildActionButton(
                appColors,
                "View Progress",
                Icons.trending_up,
                Colors.blue,
                '/progress',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(
    AppColors appColors,
    String label,
    IconData icon,
    Color color,
    String route,
  ) {
    return Expanded(
      child: GestureDetector(
        onTap: () => context.go(route),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: appColors.primary,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: color.withOpacity(0.3)),
          ),
          child: Column(
            children: [
              Icon(icon, color: color, size: 24),
              const SizedBox(height: 6),
              Text(
                label,
                style: TextStyle(color: appColors.onSecondary, fontSize: 11),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showQuickLogDialog() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Quick Log",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              _buildQuickLogOption(
                "💪 Log Workout",
                Icons.fitness_center,
                '/workout',
              ),
              _buildQuickLogOption(
                "🥗 Log Meal",
                Icons.restaurant,
                '/nutrition',
              ),
              _buildQuickLogOption("💧 Add Water", Icons.water_drop, null),
              _buildQuickLogOption(
                "⚖️ Update Weight",
                Icons.monitor_weight,
                null,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildQuickLogOption(String title, IconData icon, String? route) {
    return ListTile(
      leading: Icon(icon, color: Colors.deepOrange),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        Navigator.pop(context);
        if (route != null) {
          context.go(route);
        } else if (title.contains("Water")) {
          _toggleWaterIntake();
        }
      },
    );
  }
}

// Models
class TodayWorkout {
  final String name;
  final String duration;
  final int calories;
  bool isCompleted;

  TodayWorkout({
    required this.name,
    required this.duration,
    required this.calories,
    this.isCompleted = false,
  });
}

class HomeAchievement {
  final String name;
  final String icon;
  final bool unlocked;

  HomeAchievement({
    required this.name,
    required this.icon,
    required this.unlocked,
  });
}
