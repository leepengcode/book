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
  final OnChangeCallback? getCityorProvince;
  final OnChangeCallback? getDistrict;
  final OnChangeCallback? getCommune;
  final OnChangeCallback? getVillage;
  const CascadingDropdown(
      {super.key,
      this.getCityorProvince,
      this.getDistrict,
      this.getCommune,
      this.getVillage});
  @override
  _CascadingDropdownState createState() => _CascadingDropdownState();
}

class _CascadingDropdownState extends State<CascadingDropdown> {
  String? selectedCityorProvince;

  String? selectedDistrict;
  String? selectedCommune;
  String? selectedVillage;

  List<String> getProvinces() {
    return AddressData.address.keys.toList();
  }

  List<String> getCommune() {
    if (selectedCityorProvince == null) return [];
    return AddressData.address[selectedCityorProvince]!.keys.toList();
  }

  List<String> getDistrict() {
    if (selectedCityorProvince == null || selectedCommune == null) return [];
    return AddressData.address[selectedCityorProvince]![selectedCommune]!.keys
        .toList();
  }

  List<String> getVillage() {
    if (selectedCityorProvince == null ||
        selectedCommune == null ||
        selectedDistrict == null) return [];
    return AddressData
        .address[selectedCityorProvince]![selectedCommune]![selectedDistrict]!;
  }

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      AddressDropdown(
        headerList: getProvinces(),
        selectedVal: selectedCityorProvince,
        title: 'Select City/Province',
        hint: 'Choose a City/province',
        onChanged: (value) {
          setState(() {
            selectedCityorProvince = value;
            widget.getCityorProvince!(selectedCityorProvince);

            selectedVillage = null;
            selectedDistrict = null;
            selectedCommune = null;
          });
        },
      ),
      AddressDropdown(
        headerList: getCommune(),
        selectedVal: selectedCommune,
        title: 'Select Commune/Khan',
        hint: 'Choose a Commune/Khan',
        onChanged: (value) {
          setState(() {
            selectedCommune = value;
            widget.getCommune!(selectedCommune);
            selectedDistrict = null;
            selectedVillage = null;
          });
        },
      ),
      AddressDropdown(
        headerList: getDistrict(),
        selectedVal: selectedDistrict,
        title: 'Select District/Sangkat',
        hint: 'Choose a District/Sangkat',
        onChanged: (value) {
          setState(() {
            selectedDistrict = value;
            widget.getDistrict!(selectedDistrict);
            selectedVillage = null;
          });
        },
      ),
      AddressDropdown(
        headerList: getVillage(),
        selectedVal: selectedVillage,
        title: 'Select Village/Phum',
        hint: 'Choose a Village/Phum',
        onChanged: (value) {
          setState(() {
            selectedVillage = value;
            widget.getVillage!(selectedVillage);
          });
        },
      )
    ]);
  }
}
