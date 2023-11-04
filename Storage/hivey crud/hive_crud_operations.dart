import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

void main() async{
  await Hive.initFlutter();
  await Hive.openBox('to_do_box');
  runApp(MaterialApp(
    home: Hive_Crud(),));
}

class Hive_Crud extends StatefulWidget {
  @override
  State<Hive_Crud> createState() => _Hive_CrudState();
}

class _Hive_CrudState extends State<Hive_Crud> {
  List<Map<String, dynamic>> task = [];
  final myBox = Hive.box('to_do_box');

  @override
  void initState() {
    load_or_Read_task();
    super.initState();
  }
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ToDo"),
      ),
      body: task.isEmpty
      ? const Center(
        child: CircularProgressIndicator(),
      )
      : ListView.builder(
    itemCount: task.length,
    itemBuilder: (ctx, index){
    final mytask= task[index];
      return Card(
        child: ListTile(
          title: Text(task[index]['taskname']),
          subtitle: Text(mytask['taskcont']),
          trailing: Wrap(
            children: [
              IconButton(onPressed: () {
                showTask(context, mytask['id']);
              }, icon: Icon(Icons.edit)),
              IconButton(onPressed: () {
                deleteTask(mytask['id']);
              }, icon: Icon(Icons.delete))
            ],
          ),
        ),
      );
    }),
    floatingActionButton: FloatingActionButton.extended(
        onPressed: ()=> showTask(context, null) ,
    label: const Text('Create Task'),
    icon: const Icon(Icons.add),
    ),
    );
  }
  final task_controller=TextEditingController();
  final content_controller=TextEditingController();
  
 void showTask(BuildContext context, int? itemkey) {
   if(itemkey != null){
     final existingTask = task.firstWhere((element) => element['id'] == itemkey);
     task_controller.text = existingTask['taskname'];
     content_controller.text = existingTask['taskcont'];
   }
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context){
          return Container(
            padding: EdgeInsets.only(
              top: 15,
              left: 15,
              right: 15,
              bottom: MediaQuery.of(context).viewInsets.bottom +120),
            child: Column(
              mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: task_controller,
                decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Task Name",
            ),),
            const SizedBox(height: 15),
              TextField(
                controller: content_controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Task content"
                ),
              ),
              ElevatedButton(
                  onPressed: (){
                if(task_controller.text!=" " && content_controller.text!=""){
                  if(itemkey == null){
                    createTask({
                      'name':task_controller.text.trim(),
                      'content':content_controller.text.trim(),
                    });
                  }
                   else{
                  updateTask(itemkey,{
                    'name':task_controller.text.trim(),
                    'content':content_controller.text.trim(),
                  });
                   }
                }
                content_controller.text ="";
                task_controller.text="";
                Navigator.of(context).pop();
              },
               child: Text( itemkey == null? 'Create Task':'Update Task')),
            ],
            ),);
    });
  }
Future <void> createTask(Map<String, dynamic> task) async{
    await myBox.add(task);
    load_or_Read_task();
}

  Future<void> updateTask(int? itemkey,Map<String, String> uptask) async{
   await myBox.put(itemkey, uptask);
   load_or_Read_task();
  }

  void load_or_Read_task() {
        final task_from_hive = myBox.keys.map((key){
        final value = myBox.get(key);
        return{
          'id' : key,
          'taskname':value['name'],
          'taskcont':value['content']
        };
        }).toList();

        setState(() {
          task = task_from_hive.reversed.toList();

        });
 }

Future <void> deleteTask(int itemkey) async{
   await myBox.delete(itemkey);
   load_or_Read_task();
   ScaffoldMessenger.of(context).showSnackBar(
     const SnackBar(content: Text("Successfully Deleted"))
   );
}
}
