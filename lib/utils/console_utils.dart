import 'dart:convert';
import 'dart:io';

class ConsoleUtils {
  static String lerString() {
    return stdin.readLineSync(encoding: utf8) ?? "";
  }

  static String lerStringComMsg(String msg) {
    print(msg);
    return lerString();
  }

  static double? lerDouble() {
    try {
      return double.parse(lerString());
    } catch (e) {
      return null;
    }
  }

  static double? lerDoubleComMsg(String msg) {
    print(msg);
    return lerDouble();
  }
}
