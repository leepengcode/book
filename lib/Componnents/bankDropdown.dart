import 'package:book/Componnents/style.dart';
import 'package:flutter/material.dart';

class BankDropdown extends StatefulWidget {
  final List<Map<String, dynamic>> banks;
  final String? selectedBankName;
  final String? selectedBranch;
  final ValueChanged<String?>? onBankChanged;
  final ValueChanged<String?>? onBranchChanged;
  final String title;

  BankDropdown({
    required this.onBankChanged,
    required this.onBranchChanged,
    required this.title,
    required this.banks,
    required this.selectedBankName,
    required this.selectedBranch,
  });

  @override
  State<BankDropdown> createState() => _BankDropdownState();
}

class _BankDropdownState extends State<BankDropdown> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
      child: Container(
        width: 550,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  widget.title,
                  style: THeader(),
                ),
                Text(
                  " *",
                  style: TextStyle(color: Colors.red, fontSize: 15),
                )
              ],
            ),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16)),
                  contentPadding: EdgeInsets.symmetric(horizontal: 8)),
              value: widget.selectedBankName,
              onChanged: (val) {
                setState(() {
                  widget.onBankChanged!(val);
                });
              },
              items: widget.banks.map((bank) {
                return DropdownMenuItem<String>(
                  value: bank['name'],
                  child: Text(bank['name']),
                );
              }).toList(),
            ),
            SizedBox(height: 10),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16)),
                  contentPadding: EdgeInsets.symmetric(horizontal: 8)),
              value: widget.selectedBranch,
              onChanged: (val) {
                setState(() {
                  widget.onBranchChanged!(val);
                });
              },
              items: widget.selectedBankName != null
                  ? widget.banks
                      .firstWhere((bank) =>
                          bank['name'] == widget.selectedBankName)['branches']
                      .map<DropdownMenuItem<String>>((branch) {
                      return DropdownMenuItem<String>(
                        value: branch,
                        child: Text(branch),
                      );
                    }).toList()
                  : [],
            ),
          ],
        ),
      ),
    );
  }
}
