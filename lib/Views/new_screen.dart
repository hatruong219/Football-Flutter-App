import 'package:flutter/material.dart';
import 'package:flutter_app_demo/Views/News/news_all.dart';

  class NewScreen extends StatelessWidget {
  const NewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          // padding: EdgeInsets.only(left: 5),
          icon: const Icon(Icons.settings),
          tooltip: 'Go to the next page',
          onPressed: () {
            Navigator.push(context, MaterialPageRoute<void>(
              builder: (BuildContext context) {
                return Scaffold(
                  appBar: AppBar(
                    title: const Text('Next page'),
                  ),
                  body: const Center(
                    child: Text(
                      'This is the next page',
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                );
              },
            ));
          },
        ),
        title: const Text(
          "News"
        ),
        centerTitle: true,
      ),
      body: AllNews(),
    );
  }
}
