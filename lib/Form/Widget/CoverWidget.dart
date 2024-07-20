import 'dart:io';

import 'package:book/Class/address.dart';
import 'package:book/Componnents/ImagWidget.dart';
import 'package:book/Componnents/bankDropdown.dart';
import 'package:book/Componnents/branchDropdown.dart';
import 'package:book/Componnents/dropdown.dart';
import 'package:book/Componnents/style.dart';
import 'package:book/Model/CoverModel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// typedef OnChangeCallback = void Function(Cover value);

class CoverWidget extends StatefulWidget {
  final ValueChanged<String?>? onChanged;
  final ValueChanged<Cover?>? getForm;
  CoverWidget({
    super.key,
    this.onChanged,
    this.getForm,
  });

  // final OnChangeCallback? objCove;
  @override
  State<CoverWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<CoverWidget> {
  Cover objcover = Cover(
      header: "header",
      info: "info",
      ownername: "ownername",
      deeptitle: "deeptitle",
      cityorprovince: "cityorprovince",
      communeorkhan: "communeorkhan",
      districtorsangkat: "districtorsangkat",
      villageorphum: "villageorphum",
      reportto: "reportto",
      date: null);
  final List<String> _HeaderList = [
    "Property [LAND AND BUILDING] VALUATION REPORT",
    "Property LAND VALUATION REPORT",
    "Property OFFICE SPACE VALUATION REPORT",
    "Property CONDO REPORT",
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

    // _focusNode.addListener(() {
    //   if (!_focusNode.hasFocus) {
    //     // Validate the form field when the text field loses focus
    //     if (_formKey.currentState != null) {
    //       _formKey.currentState!.validate();
    //     }
    //   }
    // });
  }

  void _onBankChanged(String? value) {
    setState(() {
      _selectedBankName = value;
      objcover.bank = _selectedBankName;
      _selectedBankBranch = null;
    });
  }

  void _onBranchChanged(String? value) {
    setState(() {
      _selectedBankBranch = value;
      objcover.branch = _selectedBankBranch;
    });
  }

  // final _formKey = GlobalKey<FormState>();
  // final _controller = TextEditingController();
  // final _focusNode = FocusNode();

  // @override
  // void dispose() {
  //   _controller.dispose();
  //   _focusNode.dispose();
  //   super.dispose();
  // }
  File? io;
  final owneShipController = TextEditingController();
  final ownerNameContoller = TextEditingController();
  final deepTitleController = TextEditingController();
  final locationControltter = TextEditingController();
  final streetController = TextEditingController();
  final code = TextEditingController();

  DateTime date = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onFocusChange: (value) {
        setState(() {
          if (value == false &&
              _selectedinfo != '' &&
              _selectedVal != '' &&
              objcover.date != null &&
              io != null) {
            print("objcover ${objcover.toJson()}");
            _selectedinfo;
            _selectedVal;
            objcover;
            objcover.image = io;
            widget.getForm!(objcover);
          }
        });
      },
      child: Container(
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
                      print("ckeck form$_selectedVal\n");
                      objcover.header = _selectedVal.toString();
                      widget.onChanged!(_selectedVal.toString());
                    });
                  },
                ),
                HeaderDropdown1(
                  hint: "Select Information",
                  title: "Select Information",
                  headerList: _inforList,
                  selectedVal: _selectedinfo!,
                  onChanged: (value) {
                    setState(() {
                      _selectedinfo = value!;
                      objcover.info = _selectedinfo!;
                      print("ckeck form2 $value\n");
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
                    onBankChanged: (val) {
                      setState(() {
                        _onBankChanged(val);
                      });
                    },
                    onBranchChanged: (val) {
                      setState(() {
                        _onBranchChanged(val);
                      });
                    },
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
                padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
                child: Container(
                  width: 550,
                  child: TextFormField(
                    controller: owneShipController,

                    onChanged: (value) {
                      setState(() {
                        objcover.ownership = value;
                      });
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[200],
                      hintText: "Ownership Name",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16)),
                    ),
                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return 'Please enter some text';
                    //   }
                    //   return null;
                    // },
                  ),
                ),
              ),
            ],
            const SizedBox(
              height: 25,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Select Image",
                      style: THeader(),
                    ),
                    Text(
                      " *",
                      style: TextStyle(color: Colors.red, fontSize: 15),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: ImagePickerWidget(
                    getFile: (value) {
                      setState(() {
                        io = value;
                      });
                    },
                  ),
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
                _buildTextFieldColumn(
                  title: "Owner Name",
                  label: "",
                  width: 250,
                  controller: ownerNameContoller,
                  onChanged: (value) {
                    setState(() {
                      objcover.ownername = value;
                    });
                  },
                ),
                _buildTextFieldColumn(
                  title: "Deep Title",
                  label: "",
                  width: 250,
                  controller: deepTitleController,
                  onChanged: (value) {
                    setState(() {
                      objcover.deeptitle = value;
                    });
                  },
                ),
                _buildTextFieldColumn(
                  title: "Property Location",
                  label: "",
                  width: 250,
                  controller: locationControltter,
                  onChanged: (value) {
                    setState(() {
                      objcover.location = value;
                    });
                  },
                ),
                _buildTextFieldColumn(
                  title: "Street",
                  label: "",
                  width: 250,
                  controller: streetController,
                  onChanged: (value) {
                    setState(() {
                      objcover.street = value;
                    });
                  },
                )
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            CascadingDropdown(
              getCityorProvince: (value) {
                setState(() {
                  objcover.cityorprovince = value;
                });
              },
              getDistrict: (value) {
                setState(() {
                  objcover.districtorsangkat = value.toString();
                });
              },
              getCommune: (value) {
                setState(() {
                  objcover.communeorkhan = value.toString();
                });
              },
              getVillage: (value) {
                setState(() {
                  objcover.villageorphum = value.toString();
                });
              },
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: _buildTextFieldColumn(
                    title: "Code",
                    label: "Code",
                    width: 400,
                    controller: code,
                    onChanged: (value) {
                      setState(() {
                        objcover.code = value;
                      });
                    },
                  ),
                ),
                BranchDropdown(
                  branches: _branches,
                  selectedBranch: _selectedbranch,
                  onChanged: (branch) {
                    setState(() {
                      _selectedbranch = branch;
                      objcover.reportto = _selectedbranch.toString();
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
                              String formattedDate =
                                  DateFormat("yyyy-MM-dd").format(date);
                              objcover.date = formattedDate;
                            });
                          }
                          // setState(() {
                          //   print("object Cover ${objcover.toString()}\n");
                          // });
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Column _buildTextFieldColumn({
    required String title,
    required String label,
    required double width,
    required TextEditingController controller,
    bool readOnly = false,
    String? Function(String?)? validator,
    void Function(String)? onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              title,
              style: THeader(),
            ),
            Text(
              " *",
              style: TextStyle(color: Colors.red, fontSize: 15),
            )
          ],
        ),
        Container(
          width: width,
          child: TextFormField(
            readOnly: readOnly,
            controller: controller,
            onChanged: (value) {
              onChanged!(value);
            },
            maxLines: null,
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                hintText: label,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16))),
            validator: validator,
          ),
        ),
      ],
    );
  }
}
