import 'package:flutter/material.dart';
import 'package:http/http.dart';

class PostDataPage extends StatefulWidget {
  const PostDataPage({super.key});

  @override
  State<PostDataPage> createState() => _PostDataPageState();
}

class _PostDataPageState extends State<PostDataPage> {
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
        title: Text("Post Data"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            clickPostData();
          },
          child: Text(
            "Post Data",
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

void clickPostData() async {
  try {
    final uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');

    final response = await post(uri, body: {
      "id": 1000.toString(),
      "name": "Jack",
      "email": "Jack@gmail.com"
    });

    print(response.body);
    print(response.statusCode);
  } catch (e) {
    print(e);
  }
}
