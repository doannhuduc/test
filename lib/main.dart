import 'package:call_api/delete_data/delete_data_page.dart';
import 'package:call_api/get_data/get_data_page.dart';
import 'package:call_api/post_data/post_data_page.dart';
import 'package:call_api/put_data/put_data_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'RESTful API'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({super.key, required this.title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return GetDataPage();
                  },
                ));
              },
              child: Text(
                "Get",
                style: TextStyle(fontSize: 30, color: Colors.black),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.amber),
                  fixedSize: MaterialStatePropertyAll(Size(200, 40))),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return PostDataPage();
                  },
                ));
              },
              child: Text(
                "Post",
                style: TextStyle(fontSize: 30, color: Colors.black),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.amber),
                  fixedSize: MaterialStatePropertyAll(Size(200, 40))),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return PutDataPage();
                  },
                ));
              },
              child: Text(
                "Put",
                style: TextStyle(fontSize: 30, color: Colors.black),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.amber),
                  fixedSize: MaterialStatePropertyAll(Size(200, 40))),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return DeleteDataPage();
                  },
                ));
              },
              child: Text(
                "Delete",
                style: TextStyle(fontSize: 30, color: Colors.black),
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.amber),
                  fixedSize: MaterialStatePropertyAll(Size(200, 40))),
            ),
          ],
        ),
      ),
    );
  }
}
