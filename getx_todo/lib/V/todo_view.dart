import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:getx_todo/C/value-controller.dart';


class TodoView extends StatelessWidget {
  TodoView({super.key});
  final ValueController valuecontroller= Get.put(ValueController());

  // var tasks = [
  //   'Math Homework',
  //   'English Exam',
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            child: TextFormField(
              // controller: valuecontroller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter a task',
              ),
              onFieldSubmitted: ((value) {
                valuecontroller.add();
                  // valuecontroller.clear();
              }),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 2.5,
            child: ListView.builder(
                itemCount: valuecontroller.value.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.all(10),
                    child: ListTile(
                      title: Text('${valuecontroller.value[index]}'),
                      leading: Icon(Icons.check_box_outline_blank),
                      trailing: IconButton(
                        onPressed: () {
                          valuecontroller.value.removeAt(index);
                        },
                        icon: Icon(Icons.delete),
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}