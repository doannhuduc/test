import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart';

class DeleteDataPage extends StatefulWidget {
  const DeleteDataPage({super.key});

  @override
  State<DeleteDataPage> createState() => _DeleteDataPageState();
}

class _DeleteDataPageState extends State<DeleteDataPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text("Delete Data"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            clickDeleteData();
          },
          child: Text(
            "Delete Data",
            style: TextStyle(fontSize: 30, color: Colors.black),
          ),
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.amber),
              fixedSize: MaterialStatePropertyAll(Size(200, 60))),
        ),
      ),
    );
  }
}

void clickDeleteData() async {
  try {
    final uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');

    final response = await delete(uri, body: {
      {
        "userId": 1.toString(),
        "id": 1,
        "title":
            "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
        "body":
            "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
      }
    });
    print(response.body);
    print(response.statusCode);
  } catch (e) {
    print(e);
  }
}
