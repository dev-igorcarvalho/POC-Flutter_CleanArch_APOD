import 'dart:core';

///A class that should have all app configs
class Config {
  final Api api;
  Config(this.api);
}

///A class that should have all API configs
class Api {
  final String url;
  final String key;
  Api(this.url, this.key);
}
