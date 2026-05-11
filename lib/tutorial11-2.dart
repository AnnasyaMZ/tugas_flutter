import 'package:flutter/material.dart';

// 2311102246_Annasya Maulafidatu Zahra
class MyApp11_2 extends StatefulWidget {
  const MyApp11_2({super.key});

  @override
  State<MyApp11_2> createState() => _MyApp11_2State();
}

class _MyApp11_2State extends State<MyApp11_2> {
  List<Map<String, dynamic>> data = [
    {
      "title": "Native App",
      "platform": "Android, iOS",
      "lang": "Java, Kotlin, Swift, C#",
      "color": Colors.red,
    },
    {
      "title": "Hybrid App",
      "platform": "Android, iOS, Web",
      "lang": "Javascript, Dart",
      "color": Colors.grey,
    },
  ];

  var titleInput = TextEditingController();
  var platInput = TextEditingController();
  var langInput = TextEditingController();

  List<String> colors = ['blue', 'green', 'yellow'];
  List<DropdownMenuItem<String>> dd_items = [];
  var col_selected;

  @override
  void initState() {
    super.initState();
    for (String col in colors) {
      dd_items.add(DropdownMenuItem(value: col, child: Text(col)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.white,
              child: InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Detail'),
                        content: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data[index]["title"],
                                style: const TextStyle(
                                  color: Colors.blue,
                                  fontSize: 28,
                                ),
                              ),
                              Text(
                                data[index]["platform"],
                                style: const TextStyle(fontSize: 20),
                              ),
                              Text(
                                data[index]["lang"],
                                style: const TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                        actions: [
                          TextButton(
                            child: const Text('Close'),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Container(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: data[index]['color'],
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          bottom: 40,
                          left: 10,
                          top: 10,
                        ),
                        padding: const EdgeInsets.only(top: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data[index]["title"],
                              style: const TextStyle(
                                color: Colors.blue,
                                fontSize: 28,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          var snackBar = SnackBar(
            content: const Text('Add new tech?'),
            action: SnackBarAction(
              label: 'Add',
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return SimpleDialog(
                      title: const Text('Add New Tech'),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Tech Name',
                                ),
                                controller: titleInput,
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Platform',
                                ),
                                controller: platInput,
                              ),
                              TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Lang',
                                ),
                                controller: langInput,
                              ),
                              DropdownButtonFormField<String>(
                                items: dd_items,
                                hint: const Text("Select Color"),
                                onChanged: (val) {
                                  setState(() {
                                    col_selected = val;
                                  });
                                },
                              ),
                              const SizedBox(height: 20),
                              ElevatedButton(
                                child: const Text('Save'),
                                onPressed: () {
                                  Color selectedColor = Colors.blue;
                                  if (col_selected == 'green')
                                    selectedColor = Colors.green;
                                  if (col_selected == 'yellow')
                                    selectedColor = Colors.yellow;

                                  setState(() {
                                    data.add({
                                      'title': titleInput.text,
                                      'platform': platInput.text,
                                      'lang': langInput.text,
                                      'color': selectedColor,
                                    });
                                  });
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
      ),
    );
  }
}
