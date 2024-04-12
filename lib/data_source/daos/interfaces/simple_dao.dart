
abstract class SimpleDao {
  /*
  * Change method return types as per the API End Point response type,
  * If possible modify the API End Points to return as per function that calls to them.
  */

  Future<Map<String, dynamic>> fetch(int id);

  Future<List<dynamic>> fetchAll();

  Future<List<Map<String, dynamic>>> search(String search);

  Future<dynamic> put(Map<String, dynamic> data, int id);

  Future<dynamic> post(Map<String, dynamic> data);

  Future<dynamic> delete(int id);

  Future<int> getCountAll();

  Future<List<dynamic>> getCountByDateJoined();
}
