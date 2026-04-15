// import 'package:fitness_tracker/components/app_colors.dart';
// import 'package:fitness_tracker/features/trainer/model/trainer_model.dart';
// import 'package:fitness_tracker/features/trainer/widget/trainer_card.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class TrainersScreen extends StatefulWidget {
//   const TrainersScreen({super.key});

//   @override
//   State<TrainersScreen> createState() => _TrainersScreenState();
// }

// class _TrainersScreenState extends State<TrainersScreen> {
//   List<Trainer> trainers = [
//     Trainer(
//       id: "1",
//       name: "John Doe",
//       specialization: "Weightlifting",
//       experience: "5",
//       rating: 4.8,
//       imageUrl: "assets/pic2.jpg",
//     ),
//     Trainer(
//       id: "2",
//       name: "Jane Smith",
//       specialization: "Yoga",
//       experience: "3",
//       rating: 4.6,
//       imageUrl: "assets/pic3.jpg",
//     ),
//     Trainer(
//       id: "3",
//       name: "Mike Johnson",
//       specialization: "CrossFit",
//       experience: "7",
//       rating: 4.9,
//       imageUrl: "assets/pic1.jpg",
//     ),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     final appColors = Provider.of<AppColors>(context);

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: appColors.primary,
//         title: Text(
//           "Available Trainers",
//           style: TextStyle(color: appColors.onSecondary),
//         ),
//         centerTitle: true,
//       ),
//       body: ListView.builder(
//         itemCount: trainers.length,
//         itemBuilder: (context, index) {
//           return TrainerCard(trainer: trainers[index]);
//         },
//       ),
//     );
//   }
// }

import 'package:fitness_tracker/components/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:fl_chart/fl_chart.dart';

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({super.key});

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _selectedPeriod = 'Week'; // Week, Month, Year

  // User stats
  int _totalWorkouts = 0;
  int _totalCaloriesBurned = 0;
  int _totalWorkoutMinutes = 0;
  int _currentStreak = 0;
  int _bestStreak = 0;

  // Weight tracking
  double _currentWeight = 70.0;
  double _startingWeight = 75.0;

  // Workout history (last 7 days)
  List<WorkoutDay> _weeklyWorkouts = [];

  // Nutrition history
  List<NutritionDay> _weeklyNutrition = [];

  // Achievements
  List<Achievement> _achievements = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _loadProgressData();
    _loadWeightData();
    _loadAchievements();
  }

  void _loadProgressData() {
    // Sample data - In real app, load from SharedPreferences/Hive
    _weeklyWorkouts = [
      WorkoutDay(
        day: 'Mon',
        calories: 320,
        duration: 35,
        exercises: 6,
        completed: true,
      ),
      WorkoutDay(
        day: 'Tue',
        calories: 280,
        duration: 30,
        exercises: 5,
        completed: true,
      ),
      WorkoutDay(
        day: 'Wed',
        calories: 450,
        duration: 45,
        exercises: 7,
        completed: true,
      ),
      WorkoutDay(
        day: 'Thu',
        calories: 0,
        duration: 0,
        exercises: 0,
        completed: false,
      ),
      WorkoutDay(
        day: 'Fri',
        calories: 350,
        duration: 38,
        exercises: 6,
        completed: true,
      ),
      WorkoutDay(
        day: 'Sat',
        calories: 200,
        duration: 25,
        exercises: 4,
        completed: true,
      ),
      WorkoutDay(
        day: 'Sun',
        calories: 0,
        duration: 0,
        exercises: 0,
        completed: false,
      ),
    ];

    _weeklyNutrition = [
      NutritionDay(
        day: 'Mon',
        calories: 1850,
        protein: 95,
        carbs: 210,
        fat: 55,
      ),
      NutritionDay(
        day: 'Tue',
        calories: 1920,
        protein: 102,
        carbs: 225,
        fat: 58,
      ),
      NutritionDay(
        day: 'Wed',
        calories: 1780,
        protein: 88,
        carbs: 195,
        fat: 52,
      ),
      NutritionDay(
        day: 'Thu',
        calories: 2100,
        protein: 110,
        carbs: 240,
        fat: 65,
      ),
      NutritionDay(
        day: 'Fri',
        calories: 1950,
        protein: 105,
        carbs: 230,
        fat: 60,
      ),
      NutritionDay(
        day: 'Sat',
        calories: 2200,
        protein: 115,
        carbs: 250,
        fat: 70,
      ),
      NutritionDay(
        day: 'Sun',
        calories: 2400,
        protein: 120,
        carbs: 280,
        fat: 75,
      ),
    ];

    _totalWorkouts = _weeklyWorkouts.where((w) => w.completed).length;
    _totalCaloriesBurned = _weeklyWorkouts.fold(
      0,
      (sum, w) => sum + w.calories,
    );
    _totalWorkoutMinutes = _weeklyWorkouts.fold(
      0,
      (sum, w) => sum + w.duration,
    );
    _currentStreak = 5;
    _bestStreak = 12;
  }

  void _loadWeightData() {
    // In real app, load from SharedPreferences
    _currentWeight = 70.5;
    _startingWeight = 75.0;
  }

  void _loadAchievements() {
    _achievements = [
      Achievement(
        name: 'First Workout',
        icon: '🎯',
        unlocked: true,
        date: 'Jan 15',
      ),
      Achievement(
        name: '7 Day Streak',
        icon: '🔥',
        unlocked: true,
        date: 'Jan 22',
      ),
      Achievement(
        name: '1000 Calories',
        icon: '⚡',
        unlocked: true,
        date: 'Jan 28',
      ),
      Achievement(
        name: '30 Day Streak',
        icon: '🏆',
        unlocked: false,
        date: null,
      ),
      Achievement(
        name: 'Perfect Week',
        icon: '⭐',
        unlocked: true,
        date: 'Feb 5',
      ),
      Achievement(
        name: 'Weight Loss 5kg',
        icon: '📉',
        unlocked: true,
        date: 'Feb 10',
      ),
      Achievement(
        name: '100 Workouts',
        icon: '💪',
        unlocked: false,
        date: null,
      ),
      Achievement(
        name: 'Protein Master',
        icon: '🥚',
        unlocked: false,
        date: null,
      ),
    ];
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appColors = Provider.of<AppColors>(context);
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: appColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => context.go('/bottomnavbar'),
          icon: Icon(Icons.arrow_back_ios, color: appColors.onSecondary),
        ),
        title: Text(
          '📈 Progress',
          style: TextStyle(
            color: appColors.onSecondary,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: _showWeightDialog,
            icon: Icon(
              Icons.monitor_weight_outlined,
              color: appColors.onSecondary,
            ),
          ),
          IconButton(
            onPressed: _showShareProgress,
            icon: Icon(Icons.share_outlined, color: appColors.onSecondary),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: CustomScrollView(
          slivers: [
            // Summary Cards
            SliverToBoxAdapter(
              child: _buildSummaryCards(appColors, screenWidth),
            ),

            // Period Selector
            SliverToBoxAdapter(child: _buildPeriodSelector(appColors)),

            // Charts Section
            SliverToBoxAdapter(
              child: _buildChartsSection(appColors, screenWidth),
            ),

            // Weight Tracker
            SliverToBoxAdapter(child: _buildWeightTracker(appColors)),

            // Calories Balance (In vs Out)
            SliverToBoxAdapter(child: _buildCaloriesBalance(appColors)),

            // Achievements
            SliverToBoxAdapter(child: _buildAchievementsSection(appColors)),

            // Recent Activity
            SliverToBoxAdapter(child: _buildRecentActivity(appColors)),

            const SliverToBoxAdapter(child: SizedBox(height: 80)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _showAddMeasurementDialog,
        backgroundColor: Colors.deepOrange,
        icon: const Icon(Icons.add),
        label: const Text('Log Progress'),
      ),
    );
  }

  Widget _buildSummaryCards(AppColors appColors, double screenWidth) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              _buildSummaryCard(
                appColors,
                '🔥 Total Workouts',
                '$_totalWorkouts',
                'This week',
                Icons.fitness_center,
                Colors.deepOrange,
              ),
              const SizedBox(width: 12),
              _buildSummaryCard(
                appColors,
                '⚡ Calories Burned',
                '$_totalCaloriesBurned',
                'This week',
                Icons.local_fire_department,
                Colors.red,
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              _buildSummaryCard(
                appColors,
                '⏱️ Active Minutes',
                '$_totalWorkoutMinutes',
                'This week',
                Icons.timer,
                Colors.blue,
              ),
              const SizedBox(width: 12),
              _buildSummaryCard(
                appColors,
                '📊 Current Streak',
                '$_currentStreak days',
                'Best: $_bestStreak',
                Icons.whatshot,
                Colors.orange,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryCard(
    AppColors appColors,
    String title,
    String value,
    String subtitle,
    IconData icon,
    Color color,
  ) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: appColors.primary,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: color.withOpacity(0.15),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(icon, color: color, size: 28),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: appColors.onSecondary.withOpacity(0.7),
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    value,
                    style: TextStyle(
                      color: appColors.onSecondary,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: appColors.onSecondary.withOpacity(0.5),
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPeriodSelector(AppColors appColors) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: appColors.primary,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          _buildPeriodButton('Week', appColors),
          _buildPeriodButton('Month', appColors),
          _buildPeriodButton('Year', appColors),
        ],
      ),
    );
  }

  Widget _buildPeriodButton(String period, AppColors appColors) {
    final isSelected = _selectedPeriod == period;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _selectedPeriod = period),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? Colors.deepOrange : Colors.transparent,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Text(
            period,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isSelected ? Colors.white : appColors.onSecondary,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildChartsSection(AppColors appColors, double screenWidth) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: appColors.primary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TabBar(
            controller: _tabController,
            labelColor: Colors.deepOrange,
            unselectedLabelColor: appColors.onSecondary.withOpacity(0.5),
            indicator: BoxDecoration(
              color: Colors.deepOrange.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            tabs: const [
              Tab(text: 'Workout'),
              Tab(text: 'Nutrition'),
              Tab(text: 'Comparison'),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 280,
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildWorkoutChart(appColors),
                _buildNutritionChart(appColors),
                _buildComparisonChart(appColors),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWorkoutChart(AppColors appColors) {
    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.center,
        maxY: 500,
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 40,
              getTitlesWidget: (value, meta) {
                return Text(
                  '${value.toInt()}',
                  style: const TextStyle(fontSize: 10, color: Colors.grey),
                );
              },
            ),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
                if (value.toInt() >= 0 && value.toInt() < days.length) {
                  return Text(
                    days[value.toInt()],
                    style: const TextStyle(fontSize: 11, color: Colors.grey),
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
        barGroups: _weeklyWorkouts.asMap().entries.map((entry) {
          return BarChartGroupData(
            x: entry.key,
            barRods: [
              BarChartRodData(
                toY: entry.value.calories.toDouble(),
                color: Colors.deepOrange,
                width: 25,
                borderRadius: BorderRadius.circular(5),
              ),
            ],
          );
        }).toList(),
        gridData: const FlGridData(show: true, drawVerticalLine: false),
      ),
    );
  }

  Widget _buildNutritionChart(AppColors appColors) {
    return LineChart(
      LineChartData(
        gridData: const FlGridData(show: true),
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 40,
              getTitlesWidget: (value, meta) {
                return Text(
                  '${value.toInt()}',
                  style: const TextStyle(fontSize: 10, color: Colors.grey),
                );
              },
            ),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
                if (value.toInt() >= 0 && value.toInt() < days.length) {
                  return Text(
                    days[value.toInt()],
                    style: const TextStyle(fontSize: 11, color: Colors.grey),
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
        minY: 0,
        maxY: 3000,
        lineBarsData: [
          LineChartBarData(
            spots: _weeklyNutrition.asMap().entries.map((entry) {
              return FlSpot(
                entry.key.toDouble(),
                entry.value.calories.toDouble(),
              );
            }).toList(),
            isCurved: true,
            color: Colors.green,
            barWidth: 3,
            dotData: const FlDotData(show: true),
            belowBarData: BarAreaData(
              show: true,
              color: Colors.green.withOpacity(0.1),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildComparisonChart(AppColors appColors) {
    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.center,
        maxY: 3000,
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 40,
              getTitlesWidget: (value, meta) {
                return Text(
                  '${value.toInt()}',
                  style: const TextStyle(fontSize: 10, color: Colors.grey),
                );
              },
            ),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
                if (value.toInt() >= 0 && value.toInt() < days.length) {
                  return Text(
                    days[value.toInt()],
                    style: const TextStyle(fontSize: 11, color: Colors.grey),
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
        barGroups: _weeklyWorkouts.asMap().entries.map((entry) {
          return BarChartGroupData(
            x: entry.key,
            barRods: [
              BarChartRodData(
                toY: entry.value.calories.toDouble(),
                color: Colors.deepOrange,
                width: 12,
                borderRadius: BorderRadius.circular(3),
              ),
              BarChartRodData(
                toY: _weeklyNutrition[entry.key].calories.toDouble(),
                color: Colors.green,
                width: 12,
                borderRadius: BorderRadius.circular(3),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _buildWeightTracker(AppColors appColors) {
    final weightLost = _startingWeight - _currentWeight;
    final weightLossPercent = (weightLost / _startingWeight * 100)
        .toStringAsFixed(1);

    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
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
                '⚖️ Weight Tracker',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: weightLost > 0
                      ? Colors.green.withOpacity(0.2)
                      : Colors.red.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  weightLost > 0
                      ? '⬇️ $weightLost kg lost'
                      : '⬆️ ${-weightLost} kg gained',
                  style: TextStyle(
                    color: weightLost > 0 ? Colors.green : Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildWeightItem('Starting', '$_startingWeight kg', Colors.grey),
              _buildWeightItem('Current', '$_currentWeight kg', Colors.green),
              _buildWeightItem('Goal', '68 kg', Colors.orange),
            ],
          ),
          const SizedBox(height: 20),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value:
                  ((_startingWeight - _currentWeight) / (_startingWeight - 68))
                      .clamp(0.0, 1.0),
              backgroundColor: Colors.grey.withOpacity(0.2),
              color: Colors.green,
              minHeight: 8,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '$weightLossPercent% towards your goal',
            style: TextStyle(
              color: appColors.onSecondary.withOpacity(0.6),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWeightItem(String label, String value, Color color) {
    return Column(
      children: [
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ],
    );
  }

  Widget _buildCaloriesBalance(AppColors appColors) {
    final totalCaloriesIn = _weeklyNutrition.fold(
      0,
      (sum, n) => sum + n.calories,
    );
    final totalCaloriesOut = _totalCaloriesBurned;
    final deficit = totalCaloriesIn - totalCaloriesOut;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.deepOrange.shade700, Colors.deepOrange.shade400],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '⚖️ Calories Balance (This Week)',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildBalanceItem(
                '🍽️ Calories In',
                '$totalCaloriesIn',
                Colors.white,
              ),
              const Icon(Icons.arrow_forward, color: Colors.white, size: 30),
              _buildBalanceItem(
                '🔥 Calories Out',
                '$totalCaloriesOut',
                Colors.white,
              ),
            ],
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  deficit > 0 ? Icons.trending_up : Icons.trending_down,
                  color: Colors.white,
                ),
                const SizedBox(width: 8),
                Text(
                  deficit > 0
                      ? 'Surplus: $deficit cal'
                      : 'Deficit: ${-deficit} cal',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBalanceItem(String label, String value, Color color) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(color: color.withOpacity(0.8), fontSize: 12),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildAchievementsSection(AppColors appColors) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '🏆 Achievements',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                '${_achievements.where((a) => a.unlocked).length}/${_achievements.length}',
                style: TextStyle(
                  color: Colors.deepOrange,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _achievements.length,
              itemBuilder: (context, index) {
                final achievement = _achievements[index];
                return Container(
                  width: 100,
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
                          fontSize: 35,
                          color: achievement.unlocked
                              ? Colors.amber
                              : Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        achievement.name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: achievement.unlocked
                              ? appColors.onSecondary
                              : Colors.grey,
                        ),
                      ),
                      if (achievement.unlocked)
                        Text(
                          achievement.date!,
                          style: const TextStyle(
                            fontSize: 9,
                            color: Colors.grey,
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

  Widget _buildRecentActivity(AppColors appColors) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '📋 Recent Activity',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _weeklyWorkouts.length,
            itemBuilder: (context, index) {
              final workout = _weeklyWorkouts[index];
              final nutrition = _weeklyNutrition[index];

              return Container(
                margin: const EdgeInsets.only(bottom: 8),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: appColors.primary,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: workout.completed
                            ? Colors.green.withOpacity(0.2)
                            : Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Icon(
                        workout.completed ? Icons.check_circle : Icons.schedule,
                        color: workout.completed ? Colors.green : Colors.grey,
                        size: 30,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${workout.day} • ${workout.completed ? 'Workout Completed' : 'Rest Day'}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: appColors.onSecondary,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            workout.completed
                                ? '🔥 ${workout.calories} cal • ⏱️ ${workout.duration} min • ${workout.exercises} exercises'
                                : '🍽️ ${nutrition.calories} cal consumed',
                            style: TextStyle(
                              fontSize: 12,
                              color: appColors.onSecondary.withOpacity(0.6),
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (workout.completed)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.deepOrange.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          '+${workout.calories} cal',
                          style: const TextStyle(
                            color: Colors.deepOrange,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void _showWeightDialog() {
    showDialog(
      context: context,
      builder: (context) {
        final TextEditingController weightController = TextEditingController();
        return AlertDialog(
          title: const Text('Update Weight'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Enter your current weight:'),
              const SizedBox(height: 16),
              TextField(
                controller: weightController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Weight (kg)',
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _currentWeight = double.parse(weightController.text);
                });
                Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _showAddMeasurementDialog() {
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
                'Add Progress Measurement',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              _buildMeasurementOption('⚖️ Weight', Icons.monitor_weight),
              _buildMeasurementOption('📏 Waist Size', Icons.straighten),
              _buildMeasurementOption('📸 Progress Photo', Icons.camera_alt),
              _buildMeasurementOption('💪 Body Fat %', Icons.fitness_center),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMeasurementOption(String title, IconData icon) {
    return ListTile(
      leading: Icon(icon, color: Colors.deepOrange),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: () => Navigator.pop(context),
    );
  }

  void _showShareProgress() {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Share feature coming soon!')));
  }

  Future<void> _refreshData() async {
    await Future.delayed(const Duration(seconds: 1));
    setState(() {});
  }
}

// Models
class WorkoutDay {
  final String day;
  final int calories;
  final int duration;
  final int exercises;
  final bool completed;

  WorkoutDay({
    required this.day,
    required this.calories,
    required this.duration,
    required this.exercises,
    required this.completed,
  });
}

class NutritionDay {
  final String day;
  final int calories;
  final int protein;
  final int carbs;
  final int fat;

  NutritionDay({
    required this.day,
    required this.calories,
    required this.protein,
    required this.carbs,
    required this.fat,
  });
}

class Achievement {
  final String name;
  final String icon;
  final bool unlocked;
  final String? date;

  Achievement({
    required this.name,
    required this.icon,
    required this.unlocked,
    this.date,
  });
}
