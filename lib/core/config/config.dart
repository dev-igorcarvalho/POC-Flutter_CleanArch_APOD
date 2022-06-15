import 'dart:core';

class Config {
  final Api api;
  Config(this.api);
}

class Api {
  final String url;
  final String key;
  Api(this.url, this.key);
}
