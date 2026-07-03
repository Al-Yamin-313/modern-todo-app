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
        useMaterial3: true,
      ),
      home: const HomeScreen(),
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
                mainAxisAlignment: MainAxisAlignment.between,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Good Morning 👋', style: TextStyle(fontSize: 14, color: Colors.grey)),
                      Text('John Doe', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                      Text('Friday, July 3', style: TextStyle(fontSize: 12, color: Colors.grey)),
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
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
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
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: valueColor)),
            const SizedBox(height: 4),
            Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}