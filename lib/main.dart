import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Modern Todo App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF7F9FA),
        primaryColor: const Color(0xFF0F4C3A),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0F4C3A),
          primary: const Color(0xFF0F4C3A),
        ),
        useMaterial3: true,
      ),
      home: const MainNavigationScreen(),
    );
  }
}

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  // Ordered strictly according to the supervisor's navigation bar design serial
  final List<Widget> _screens = [
    const HomeScreen(),
    const TasksScreen(),
    const CalendarScreen(),
    const Scaffold(body: Center(child: Text('Profile Screen (Nadim)'))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.task), label: 'Tasks'),
          NavigationDestination(icon: Icon(Icons.calendar_month), label: 'Calendar'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Good Morning 👋',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      Text(
                        'John Doe',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black87),
                      ),
                      Text(
                        'Friday, July 3',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: const Color(0xFF0F4C3A).withOpacity(0.1),
                    child: const Text('JD', style: TextStyle(color: Color(0xFF0F4C3A), fontWeight: FontWeight.bold)),
                  )
                ],
              ),
              const SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search tasks...',
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(vertical: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Row(
                children: [
                  _buildStatCard('12', 'Total Tasks', Colors.black),
                  const SizedBox(width: 12),
                  _buildStatCard('8', 'Completed', const Color(0xFF0F4C3A)),
                  const SizedBox(width: 12),
                  _buildStatCard('4', 'Pending', Colors.orange),
                ],
              ),
              const SizedBox(height: 25),
              Row(
                children: [
                  ChoiceChip(
                    label: const Text('All Tasks'),
                    selected: true,
                    selectedColor: const Color(0xFF0F4C3A).withOpacity(0.1),
                    labelStyle: const TextStyle(color: Color(0xFF0F4C3A), fontWeight: FontWeight.bold),
                    side: BorderSide.none,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Recent Tasks',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text('See all', style: TextStyle(color: Color(0xFF0F4C3A))),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.02),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    )

                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Design Mobile Application UI',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Complete the Home and Calendar screens for the presentation layout.',
                      style: TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.red.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text('High', style: TextStyle(color: Colors.red, fontSize: 11, fontWeight: FontWeight.bold)),
                        ),
                        const SizedBox(width: 12),
                        const Row(
                          children: [
                            Icon(Icons.calendar_today, size: 12, color: Colors.grey),
                            SizedBox(width: 4),
                            Text('July 3, 2026', style: TextStyle(color: Colors.grey, fontSize: 11)),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard(String value, String label, Color valueColor) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              value,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: valueColor),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Calendar',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              const Text(
                'July 2026',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildCalendarDay('Fri', '3', true),
                  _buildCalendarDay('Sat', '4', false),
                  _buildCalendarDay('Sun', '5', false),
                  _buildCalendarDay('Mon', '6', false),
                  _buildCalendarDay('Tue', '7', false),
                ],
              ),
              const SizedBox(height: 30),
              const Text(
                'Friday, July 3',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Review Prototype Bundle With Team',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Go over the .dc.html bundle files shared by the supervisor.',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCalendarDay(String dayLabel, String dayNum, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF0F4C3A) : Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            dayLabel,
            style: TextStyle(color: isSelected ? Colors.white70 : Colors.grey, fontSize: 12),
          ),
          const SizedBox(height: 4),
          Text(
            dayNum,
            style: TextStyle(color: isSelected ? Colors.white : Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}


class Task {
  String title;
  String subtitle;
  String priority;
  Color priorityColor;
  String date;
  String category;
  bool isCompleted;

  Task({
    required this.title,
    required this.subtitle,
    required this.priority,
    required this.priorityColor,
    required this.date,
    required this.category,
    required this.isCompleted,
  });
}

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  int selectedFilter = 0;

  final List<Task> tasks = [
    Task(
      title: "Design Homepage",
      subtitle: "Finish hero section",
      priority: "High",
      priorityColor: Colors.red,
      date: "Today",
      category: "Work",
      isCompleted: false,
    ),

    Task(
      title: "Grocery Shopping",
      subtitle: "Buy weekly essentials",
      priority: "Medium",
      priorityColor: Colors.orange,
      date: "Tomorrow",
      category: "Shopping",
      isCompleted: true,
    ),

    Task(
      title: "Read Chapter 5",
      subtitle: "Data Structures notes",
      priority: "Low",
      priorityColor: Colors.green,
      date: "Today",
      category: "Study",
      isCompleted: false,
    ),

    Task(
      title: "Morning Run",
      subtitle: "5km around the park",
      priority: "Medium",
      priorityColor: Colors.orange,
      date: "Today",
      category: "Fitness",
      isCompleted: false,
    ),

    Task(
      title: "Call Mom",
      subtitle: "Weekly catch-up",
      priority: "Low",
      priorityColor: Colors.green,
      date: "Tomorrow",
      category: "Personal",
      isCompleted: true,
    ),

    Task(
      title: "Submit Report",
      subtitle: "Q3 performance review",
      priority: "High",
      priorityColor: Colors.red,
      date: "Fri, Jul 5",
      category: "Work",
      isCompleted: false,
    ),

    Task(
      title: "Meal Prep",
      subtitle: "Prepare lunches for the week",
      priority: "Medium",
      priorityColor: Colors.orange,
      date: "Sat, Jul 6",
      category: "Personal",
      isCompleted: false,
    ),
  ];

  List<Task> get filteredTasks {
    if (selectedFilter == 0) {
      return tasks;
    } else if (selectedFilter == 1) {
      return tasks.where((task) => task.isCompleted).toList();
    } else {
      return tasks.where((task) => !task.isCompleted).toList();
    }
  }
@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: const Color(0xffF5F7F8),
body: SafeArea(
child: SingleChildScrollView(
padding: const EdgeInsets.all(20),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
const Text(
"My Tasks",
style: TextStyle(
fontSize: 32,
fontWeight: FontWeight.bold,
),
),

const SizedBox(height: 20),

Row(
children: [
buildFilterChip("All", 0),
const SizedBox(width: 10),
buildFilterChip("Completed", 1),
const SizedBox(width: 10),
buildFilterChip("Pending", 2),
],
),

const SizedBox(height: 25),

ListView.builder(
itemCount: filteredTasks.length,
shrinkWrap: true,
physics: const NeverScrollableScrollPhysics(),
itemBuilder: (context, index) {
final task = filteredTasks[index];

return buildTaskCard(
task: task,
onChanged: () {
setState(() {
task.isCompleted = !task.isCompleted;
});
},
);
},
),
],
),
),
),
);
}
  Widget buildFilterChip(String title, int index) {
    return ChoiceChip(
      label: Text(
        title,
        style: TextStyle(
          color: selectedFilter == index ? Colors.white : Colors.black,
        ),
      ),
      selected: selectedFilter == index,
      selectedColor: Colors.teal,
      onSelected: (value) {
        setState(() {
          selectedFilter = index;
        });
      },
    );
  }

  Widget buildTaskCard({
    required Task task,
    required VoidCallback onChanged,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: onChanged,
            child: Icon(
              task.isCompleted
                  ? Icons.check_circle
                  : Icons.radio_button_unchecked,
              color: task.isCompleted ? Colors.teal : Colors.grey,
              size: 30,
            ),
          ),

          const SizedBox(width: 15),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.title,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    decoration: task.isCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),

                const SizedBox(height: 5),

                Text(
                  task.subtitle,
                  style: TextStyle(
                    color: Colors.grey,
                    decoration: task.isCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),

                const SizedBox(height: 12),

                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: task.priorityColor.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        task.priority,
                        style: TextStyle(
                          color: task.priorityColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    const SizedBox(width: 12),

                    Expanded(
                      child: Text(
                        "${task.date} • ${task.category}",
                        style: const TextStyle(color: Colors.grey),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const Icon(
            Icons.more_vert,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}