import 'dart:ffi';

import 'package:church_dashboard/data_source/daos/implementations/person_dao_impl.dart';
import 'package:church_dashboard/data_source/models/count_model.dart';
import 'package:church_dashboard/data_source/models/person_model.dart';

class PersonRepo {
  static Future<int> countAll() async {
    var personDao = PersonDaoImpl();
    var response = await personDao.getCountAll();
    return response;
  }

  static Future<List<CountModel>> countAllByDateJoined() async {
    var personDao = PersonDaoImpl();
    var countList = await personDao.getCountByDateJoined();
    return countList.map((count) => CountModel.fromJson(count)).toList();
  }

  static Future<PersonModel> fetch(int personId) async {
    var personDao = PersonDaoImpl();
    var personMap = await personDao.fetch(personId);
    return PersonModel.fromJson(personMap);
  }

  static Future<List<PersonModel>> fetchAll(
      {Map<String, dynamic>? body}) async {
    List<PersonModel> people;
    try {
      var personDao = PersonDaoImpl();
      var responseList = await personDao.fetchAll();
      people = responseList.map((doc) => PersonModel.fromJson(doc)).toList();
    } finally {}
    return people;
  }

  static Future post(PersonModel person) async {
    var personDao = PersonDaoImpl();
    var personMap = await personDao.post(person.toApiJson());
    return PersonModel.fromJson(personMap);
  }

  static Future put(PersonModel person, int personId) async {
    var personDao = PersonDaoImpl();
    var personMap = await personDao.put(person.toApiJson(), personId);
    return PersonModel.fromJson(personMap);
  }

  static Future<List<PersonModel>> search(String search) async {
    var personDao = PersonDaoImpl();
    var responseList = await personDao.search(search);
    var people = responseList.map((doc) => PersonModel.fromJson(doc)).toList();
    return people;
  }

  static Future<List<PersonModel>> delete(int personId) async {
    var personDao = PersonDaoImpl();
    var responseList = await personDao.delete(personId);
    var people = responseList.map((doc) => PersonModel.fromJson(doc)).toList();
    return people;
  }
}
