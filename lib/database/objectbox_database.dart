import 'objectbox.g.dart';

class ObjectboxDatabase {
  Store? _store;

  Future<Store> getStore() async {
    return _store ??= await openStore();
  }
}
