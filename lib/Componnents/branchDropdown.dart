import 'package:flutter/material.dart';

class BranchDropdown extends StatefulWidget {
  final List<String> branches;
  final String? selectedBranch;
  final ValueChanged<String?> onChanged;

  BranchDropdown({
    required this.branches,
    required this.selectedBranch,
    required this.onChanged,
  });

  @override
  _BranchDropdownState createState() => _BranchDropdownState();
}

class _BranchDropdownState extends State<BranchDropdown> {
  @override
  Widget build(BuildContext context) {
    // Ensure selected branch is in the branches list, otherwise set to null
    final selectedBranch = widget.branches.contains(widget.selectedBranch)
        ? widget.selectedBranch
        : null;

    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
      child: Container(
        width: 450,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(
              overflow: TextOverflow.ellipsis,
              TextSpan(children: [
                TextSpan(
                  text: 'Select Report',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                TextSpan(
                  text: " *",
                  style: TextStyle(color: Colors.red, fontSize: 15),
                )
              ]),
            ),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                hintText: 'Report to',
                hintStyle: TextStyle(height: 2.5),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                contentPadding: EdgeInsets.symmetric(horizontal: 8),
              ),
              value: selectedBranch,
              items: widget.branches.map((branch) {
                return DropdownMenuItem<String>(
                  value: branch,
                  child: Text(branch),
                );
              }).toList(),
              onChanged: widget.onChanged,
            ),
          ],
        ),
      ),
    );
  }
}
