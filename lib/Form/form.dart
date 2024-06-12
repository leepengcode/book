import 'package:book/Class/address.dart';
import 'package:book/Componnents/ImagWidget.dart';
import 'package:book/Componnents/bankDropdown.dart';
import 'package:book/Componnents/branchDropdown.dart';
import 'package:book/Componnents/dropdown.dart';
import 'package:book/Componnents/style.dart';
import 'package:book/Componnents/textField.dart';
import 'package:book/Form/Widget/NearbyProperty.dart';
import 'package:book/Form/Widget/PhotoDetail.dart';
import 'package:book/Form/Widget/PropertyInfo.dart';
import 'package:book/Form/Widget/mapWidget.dart';
import 'package:book/Form/Widget/uploadIdCard.dart';
import 'package:book/Form/Widget/uploadLayoutWidget.dart';
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
  String? _selectedBankBranch;

  final List<String> _branches = [
    'Phnom Penh',
    'Siem Reap',
    'Battambang',
    'Preah Sihanuk',
    'Kom Pot',
  ];

  String? _selectedbranch;

  @override
  void initState() {
    super.initState();
    _selectedVal = _HeaderList[0];
    _selectedinfo = _inforList[1];
  }

  void _onBankChanged(String? value) {
    setState(() {
      _selectedBankName = value;
      _selectedBankBranch = null;
    });
  }

  void _onBranchChanged(String? value) {
    setState(() {
      _selectedBankBranch = value;
    });
  }

  DateTime date = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("FILL THE FORM"),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/pdf');
              },
              child: Icon(
                Icons.picture_as_pdf,
                color: Colors.white,
                size: 25,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 22, horizontal: 22),
                width: 1500,
                decoration: BoxDecoration(
                    color: Colors.blueGrey.shade100,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                      ],
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
                            selectedBranch: _selectedBankBranch,
                          ),
                        ],
                      ),
                    ] else ...[
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Ownership",
                        style: THeader(),
                        textAlign: TextAlign.start,
                      ),
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 30, right: 30, top: 10),
                          child: Container(
                            width: 550,
                            child: TextField(
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.grey[200],
                                  hintText: "Owner Name",
                                  border: InputBorder.none),
                            ),
                          ))
                    ],
                    const SizedBox(
                      height: 25,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Select Image",
                          style: THeader(),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: ImagePickerWidget(),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Owner Name",
                              style: THeader(),
                            ),
                            const textField(
                              hint: "Owner Name",
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Deep Title",
                              style: THeader(),
                            ),
                            const textField(
                              hint: "Deep Title",
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Property Location",
                              style: THeader(),
                            ),
                            const textField(
                              hint: "Enter property location",
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Street",
                              style: THeader(),
                            ),
                            const textField(
                              hint: "Enter Street",
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    CascadingDropdown(),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BranchDropdown(
                          branches: _branches,
                          selectedBranch: _selectedbranch,
                          onChanged: (branch) {
                            setState(() {
                              _selectedbranch = branch;
                            });
                          },
                        ),
                        Column(
                          children: [
                            SizedBox(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  '${date.day}/${date.month}/${date.year}',
                                  style: THeader(),
                                ),
                              ),
                            ),
                            Container(
                              child: ElevatedButton(
                                child: const Text(
                                  "Select Date",
                                  style: TextStyle(color: Colors.black),
                                ),
                                onPressed: () async {
                                  DateTime? newDate = await showDatePicker(
                                    context: context,
                                    initialDate: date,
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2100),
                                  );
                                  if (newDate != null) {
                                    setState(() {
                                      date = newDate;
                                    });
                                  }
                                },
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const PropertyInfo_Widget(),
              const SizedBox(
                height: 25,
              ),
              const uploadIDCard(),
              const SizedBox(
                height: 25,
              ),
              const uploadLayoutWidget(),
              const SizedBox(
                height: 25,
              ),
              const Mapwidget(),
              const SizedBox(
                height: 25,
              ),
              const PhotoDetailWidget(),
              const SizedBox(
                height: 25,
              ),
              NearbyPropertyWidget()
            ],
          ),
        ),
      ),
    );
  }
}
