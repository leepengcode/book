import 'package:book/Componnents/style.dart';
import 'package:flutter/material.dart';

class BankDropdown extends StatelessWidget {
  final List<Map<String, dynamic>> banks;
  final String? selectedBankName;
  final String? selectedBranch;
  final ValueChanged<String?> onBankChanged;
  final ValueChanged<String?> onBranchChanged;
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
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
      child: Container(
        width: 550,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: THeader()),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 8)),
              value: selectedBankName,
              onChanged: onBankChanged,
              items: banks.map((bank) {
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
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 8)),
              value: selectedBranch,
              onChanged: onBranchChanged,
              items: selectedBankName != null
                  ? banks
                      .firstWhere((bank) => bank['name'] == selectedBankName)[
                          'branches']
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
