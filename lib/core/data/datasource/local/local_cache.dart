///An interfaces that must have a generic type of T
abstract class LocalCache<T> {
  ///Persist a list of <T> objects at local cache
  Future<bool> cachePicturesOfDay({required List<T> pictures});
}
