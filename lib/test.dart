import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  final _formKey = GlobalKey<FormState>();
  String? selectedValue;
  List<String> dropDownItems = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchDropDownItems();
  }

  Future<void> fetchDropDownItems() async {
    try {
      final response = await http.get(Uri.parse(
          'https://www.angkorrealestate.com/book_report/bookReport/public/api/getallinspactor'));
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        if (jsonResponse['data'] != null) {
          setState(() {
            dropDownItems = jsonResponse['data'];
            isLoading = false;
          });
        }
      } else {
        print('Error: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Exception: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                const Text(
                  "Single selection dropdown",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                isLoading
                    ? const CircularProgressIndicator()
                    : DropdownButtonFormField<String>(
                        value: selectedValue,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Select an option',
                        ),
                        items: dropDownItems.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          setState(() {
                            selectedValue = newValue;
                          });
                        },
                        validator: (value) {
                          if (value == null) {
                            return "Required field";
                          }
                          return null;
                        },
                      ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
