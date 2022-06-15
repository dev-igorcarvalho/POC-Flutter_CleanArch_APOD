import 'dart:io';

String getJsonFromFile(String name) =>
    File('test/fixture/$name').readAsStringSync();
