import 'package:flutter/material.dart';

class TaskList extends StatefulWidget {
  const TaskList({Key? key}) : super(key: key);

  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  List<String> tasks = [];

  void addTask(String taskName) {
    setState(() {
      tasks.add(taskName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To do'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Expanded(
              flex: 2,
              child: Card(
                color: Colors.amber,
                child: Center(
                  child: SizedBox(
                    width: 300,
                    height: 100,
                    child: Column(
                      children: [
                        Text('Task List', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TaskRegister(addTask)),
                  );
                },
                child: Icon(Icons.add),
              ),
            ),
            const SizedBox(height: 16),  // Adicione um espaço entre o botão e a lista de atividades.
            Expanded(
              flex: 10,
              child: Card(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(tasks[index]),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {
                        // Adicione qualquer funcionalidade que desejar ao tocar no ListTile.
                      },
                    );
                  },
                  separatorBuilder: (_, __) => Divider(),
                  itemCount: tasks.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TaskRegister extends StatelessWidget {
  final Function(String) addTask;
  final TextEditingController _taskNameController = TextEditingController();

  TaskRegister(this.addTask);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _taskNameController,
              decoration: InputDecoration(labelText: 'Task Name'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                String taskName = _taskNameController.text;
                if (taskName.isNotEmpty) {
                  addTask(taskName);
                }
                Navigator.pop(context);
              },
              child: const Text('Adicionar Tarefa'),
            ),
          ],
        ),
      ),
    );
  }
}
