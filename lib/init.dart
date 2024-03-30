import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:church_dashboard/data_source/models/person_model.dart';

var person = PersonModel();

final FilteringTextInputFormatter formatNumerals =
    FilteringTextInputFormatter(RegExp(r'[^0-9.]'), allow: false);

final box = GetStorage();

GetStorage getLocalStorage() {
  return box;
}
