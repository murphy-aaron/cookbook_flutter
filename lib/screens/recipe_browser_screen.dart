import 'package:cookbook_flutter/util/constants.dart';
import 'package:flutter/material.dart';

class RecipeBrowserScreen extends StatelessWidget {
  const RecipeBrowserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAccentColor,
        title: Center(
            child: Text(
          'Recipe Browser',
          style: TextStyle(color: Colors.white),
        )),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (value) {},
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Search recipes',
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide.none),
                    ),
                  ),
                ),
                TextButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.filter_list_alt,
                      color: kAccentColor,
                      size: 30.0,
                    ))
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: ListView(
                children: [
                  Card(
                    child: SizedBox(
                      height: 150.0,
                        child: Text('Recipe 1')
                    ),
                    elevation: 1.0,
                    color: Colors.white,
                  ),
                  Card(
                    child: SizedBox(
                        height: 150.0,
                        child: Text('Recipe 2')
                    ),
                    elevation: 1.0,
                    color: Colors.white,
                  ),
                  Card(
                    child: SizedBox(
                        height: 150.0,
                        child: Text('Recipe 3')
                    ),
                    elevation: 1.0,
                    color: Colors.white,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
