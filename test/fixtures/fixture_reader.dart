import 'dart:io';

String fixture(String json) => File('test/fixtures/$json').readAsStringSync();
