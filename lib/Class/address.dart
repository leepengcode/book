import 'package:book/Componnents/addressDropdown.dart';
import 'package:flutter/material.dart';

class AddressData {
  static const Map<String, Map<String, Map<String, List<String>>>> address = {
    'Phnom Penh': {
      'Sen Sok': {
        'Tik Tla': ['Phum1', 'Phum2'],
        'Tik L\'ok': ['Phum1', 'Phum2'],
      },
      'Mean Chhey': {
        'District3': ['Phum1', 'Phum2'],
        'District4': ['Phum1', 'Phum2'],
      },
    },
    'Province2': {
      'City3': {
        'District5': ['Commune9', 'Commune10'],
        'District6': ['Commune11', 'Commune12'],
      },
      'City4': {
        'District7': ['Commune13', 'Commune14'],
        'District8': ['Commune15', 'Commune16'],
      },
    },
  };
}

typedef OnChangeCallback = void Function(dynamic value);

class CascadingDropdown extends StatefulWidget {
  final OnChangeCallback? getProvince;
  final OnChangeCallback? getCity;
  final OnChangeCallback? getDistrict;
  final OnChangeCallback? getCommune;
  const CascadingDropdown(
      {super.key,
      this.getProvince,
      this.getCity,
      this.getDistrict,
      this.getCommune});
  @override
  _CascadingDropdownState createState() => _CascadingDropdownState();
}

class _CascadingDropdownState extends State<CascadingDropdown> {
  String? selectedProvince;
  String? selectedCity;
  String? selectedDistrict;
  String? selectedCommune;

  List<String> getProvinces() {
    return AddressData.address.keys.toList();
  }

  List<String> getCities() {
    if (selectedProvince == null) return [];
    return AddressData.address[selectedProvince]!.keys.toList();
  }

  List<String> getDistricts() {
    if (selectedProvince == null || selectedCity == null) return [];
    return AddressData.address[selectedProvince]![selectedCity]!.keys.toList();
  }

  List<String> getCommunes() {
    if (selectedProvince == null ||
        selectedCity == null ||
        selectedDistrict == null) return [];
    return AddressData
        .address[selectedProvince]![selectedCity]![selectedDistrict]!;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        AddressDropdown(
          headerList: getProvinces(),
          selectedVal: selectedProvince,
          title: 'Select City/Province',
          hint: 'Choose a City/province',
          onChanged: (value) {
            setState(() {
              selectedProvince = value;
              widget.getProvince!(selectedProvince);
              selectedCity = null;
              selectedDistrict = null;
              selectedCommune = null;
            });
          },
        ),
        AddressDropdown(
          headerList: getCities(),
          selectedVal: selectedCity,
          title: 'Select Commune/Khan',
          hint: 'Choose a Commune/Khan',
          onChanged: (value) {
            setState(() {
              selectedCity = value;
              widget.getCity!(selectedCity);
              selectedDistrict = null;
              selectedCommune = null;
            });
          },
        ),
        AddressDropdown(
          headerList: getDistricts(),
          selectedVal: selectedDistrict,
          title: 'Select District/Sangkat',
          hint: 'Choose a District/Sangkat',
          onChanged: (value) {
            setState(() {
              selectedDistrict = value;
              widget.getDistrict!(selectedDistrict);
              selectedCommune = null;
            });
          },
        ),
        AddressDropdown(
          headerList: getCommunes(),
          selectedVal: selectedCommune,
          title: 'Select Village/Phum',
          hint: 'Choose a Village/Phum',
          onChanged: (value) {
            setState(() {
              selectedCommune = value;
              widget.getCommune!(selectedCommune);
            });
          },
        ),
      ],
    );
  }
}
