import 'dart:convert';

import 'package:flutter/material.dart';

const List<String> listOfRelations = <String>[
  'Friend',
  'Partner',
  'Spouse',
  'Sibling'
];
const List<String> listOfOccasions = <String>[
  "Valentine's Day",
  'Birthday',
  'Anniversary',
  'Retirement'
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _controller = new TextEditingController();
  String gender = "prefer not to say";
  String firstDropdownValue = listOfRelations.first;
  String secondDropdownValue = listOfOccasions.first;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('OpenAI Demo'),
        ),
        body: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  "gifts by 🤖",
                ),
              ),
              Divider(),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  "who is the gift for?",
                ),
              ),
              Center(
                child: DropdownButton<String>(
                  value: firstDropdownValue,
                  icon: const Icon(Icons.arrow_drop_down),
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String? value) {
                    // This is called when the user selects an item.
                    setState(() {
                      firstDropdownValue = value!;
                    });
                  },
                  items: listOfRelations
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  "what do they identify as?",
                ),
              ),
              RadioListTile(
                title: Text("Male"),
                value: "male",
                groupValue: gender,
                onChanged: (value) {
                  setState(() {
                    gender = value.toString();
                  });
                },
              ),
              RadioListTile(
                title: Text("Female"),
                value: "female",
                groupValue: gender,
                onChanged: (value) {
                  setState(() {
                    gender = value.toString();
                  });
                },
              ),
              RadioListTile(
                title: Text("Prefer not to say"),
                value: "prefer not to say",
                groupValue: gender,
                onChanged: (value) {
                  setState(() {
                    gender = value.toString();
                  });
                },
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  "what is the occasion?",
                ),
              ),
              Center(
                child: DropdownButton<String>(
                  value: secondDropdownValue,
                  icon: const Icon(Icons.arrow_drop_down),
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String? value) {
                    // This is called when the user selects an item.
                    setState(() {
                      secondDropdownValue = value!;
                    });
                  },
                  items: listOfOccasions
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  "tell us about their hobbies or interests",
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    hintText:
                        'Enter a hobby/interest (Example: Playing Football, Gardening, etc)',
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some hobbies';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  onPressed: () async {
                    //We'll add code here to get response
                  },
                  child: Center(
                    child:
                        isLoading && _formKey.currentState!.validate() != false
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : Text("Generate Gift Ideas"),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
