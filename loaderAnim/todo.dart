import 'package:flutter/material.dart';
import 'package:project_application1/animation loading.dart';
import 'package:loader_overlay/loader_overlay.dart';

void main() {
  runApp(MaterialApp(
    home: TodoListApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class Task {
  String title;
  bool isCompleted;
  Task(this.title, this.isCompleted);
}

class TodoListApp extends StatefulWidget {
  @override
  _TodoListAppState createState() => _TodoListAppState();
}

class _TodoListAppState extends State<TodoListApp> {
  List<Task> tasks = [];
  bool isLoading = false;

  final GlobalKey<AnimatedListState> _animatedListKey = GlobalKey();

  Future<void> loadData() async {
    setState(() {
      isLoading = true;
    });
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
            title: const Text('This is our entertainment' )),
        body: Stack(
          children: [
            AnimatedList(
              key: _animatedListKey,
              initialItemCount: tasks.length,
              itemBuilder: (context, index, animation) {
                return _buildTaskItem(tasks[index], animation, index);
              },
            ),
            if (isLoading)
              const Opacity(
                opacity: 0,
                child: ModalBarrier(dismissible: false, color: Colors.white),
              ),
            if (isLoading)
              Center(
                child: Center(child: AnimatedLoader()),
              ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _addTask,
          child: const Icon(Icons.add_box),
          backgroundColor: Colors.indigo,
        ),
          backgroundColor: Colors.black,
      ),
    );
  }

  Widget _buildTaskItem(Task task, Animation<double> animation, int index) {
    return SizeTransition(
        sizeFactor: animation,
        child: Card(
          color: Colors.white,
          child: ListTile(
            title: Text(task.title),
            onLongPress: () => _removeTask(index),
          ),
        ));
  }

  void _addTask() async {
    Task newTask = Task('Here is the task ${tasks.length + 1}', false);
    await loadData();
    tasks.add(newTask);
    _animatedListKey.currentState!.insertItem(tasks.length - 1);
  }

  void _removeTask(int index) async {
    await loadData();
    _animatedListKey.currentState!.removeItem(index,
            (context, animation) => _buildTaskItem(tasks[index], animation, index));
    tasks.removeAt(index);
  }
}