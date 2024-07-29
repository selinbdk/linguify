import 'dart:convert';
import 'dart:io';

dynamic readListOfLanguages() {
  return jsonDecode(
      File('/Users/sedat/Desktop/selin/linguify/list_of_languages.json')
          .readAsStringSync());
}
