import 'package:book/Componnents/bankDropdown.dart';
import 'package:book/Componnents/dropdown.dart';
import 'package:book/Componnents/textField.dart';
import 'package:book/style.dart';
import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  FormScreen({Key? key}) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final List<String> _HeaderList = [
    "Property Valuation Report",
    "Property Valuation Report1",
    "Property Valuation Report2",
    "Property Valuation Report3"
  ];
  String? _selectedVal = "";

  final List<String> _inforList = [
    "Owner",
    "Bank",
  ];
  String? _selectedinfo = "";

  final List<Map<String, dynamic>> _bankList = [
    {
      "id": "0",
      "name": "ACLEDA Bank PLC",
      "branches": ["Branch 1", "Branch 2", "Branch 3", "Branch 4"]
    },
    {
      "id": "1",
      "name": "Advanced Bank of Asia Ltd",
      "branches": ["Branch A", "Branch B", "Branch C", "Branch D"]
    },
    {
      "id": "2",
      "name": "AGRIBANK",
      "branches": ["Branch X", "Branch Y", "Branch Z", "Branch W"]
    },
    {
      "id": "3",
      "name": "ANZ Royal Bank",
      "branches": ["Branch I", "Branch II", "Branch III", "Branch IV"]
    },
    // Add more banks as needed
  ];

  String? _selectedBankName;
  String? _selectedBranch;

  @override
  void initState() {
    super.initState();
    _selectedVal = _HeaderList[0];
    _selectedinfo = _inforList[1];
  }

  void _onBankChanged(String? value) {
    setState(() {
      _selectedBankName = value;
      // Reset branch selection when bank changes
      _selectedBranch = null;
    });
  }

  void _onBranchChanged(String? value) {
    setState(() {
      _selectedBranch = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("FILL THE FORM"),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 40),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/pdf');
              },
              child: const Icon(
                Icons.picture_as_pdf,
                color: Colors.white,
                size: 35,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              HeaderDropdown(
                hint: "Select Header",
                title: "Select Header",
                headerList: _HeaderList,
                selectedVal: _selectedVal!,
                onChanged: (value) {
                  setState(() {
                    _selectedVal = value!;
                  });
                },
              ),
              HeaderDropdown(
                hint: "Select Information",
                title: "Select Information",
                headerList: _inforList,
                selectedVal: _selectedinfo!,
                onChanged: (value) {
                  setState(() {
                    _selectedinfo = value!;
                  });
                },
              ),
              if (_selectedinfo == "Bank") ...[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BankDropdown(
                      onBankChanged: _onBankChanged,
                      onBranchChanged: _onBranchChanged,
                      title: "Select Bank",
                      banks: _bankList,
                      selectedBankName: _selectedBankName,
                      selectedBranch: _selectedBranch,
                    ),
                  ],
                ),
              ] else ...[
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Ownership",
                  style: THeader(),
                ),
                textField(
                  hint: "Your Name",
                ),
              ],
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        "Owner Name",
                        style: THeader(),
                      ),
                      textField(hint: "Owner Name")
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "Deep Title",
                        style: THeader(),
                      ),
                      textField(hint: "Deep Title")
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
