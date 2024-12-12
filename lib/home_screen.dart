import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; //i put
import 'task.dart';
import 'create_screen.dart';
import 'edit_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Task> tasks = [];

  // Add new task
  void addTask(Task task) {
    setState(() {
      tasks.add(task);
    });
  }

  // Edit existing task
  void editTask(Task task, String newTitle, DateTime newTime) {
    setState(() {
      task.title = newTitle;
      task.time = newTime;
    });
  }

  // Delete a task
  void deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do List'),
      ),
      body: tasks.isEmpty
          ? const Center(child: Text('No tasks added yet!'))
          : ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                // Format the task time
                String formattedTime =
                    DateFormat('hh:mm a').format(tasks[index].time);

                return ListTile(
                  title: Text(tasks[index].title),
                  subtitle: Text('Due: $formattedTime'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      deleteTask(index); // Delete the task
                    },
                  ),
                  onTap: () async {
                    final updatedTask = await Navigator.pushNamed(
                      context,
                      '/edit',
                      arguments: tasks[index],
                    );
                    if (updatedTask != null) {
                      editTask(updatedTask as Task, updatedTask.title,
                          updatedTask.time);
                    }
                  },
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final task = await Navigator.pushNamed(context, '/create');
          if (task != null) {
            addTask(task as Task); // Add new task
          }
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.teal,
      ),
    );
  }
}
