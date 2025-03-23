Map<String, dynamic> parseErrorMessages(String errorMessages) {
  Map<String, dynamic> errorsMap = {};

  for (var line in errorMessages.split('\n')) {
    List<String> parts = line.split(': ');
    if (parts.length == 2) {
      String key = parts[0].trim();
      List<String> values = parts[1].split(',').map((e) => e.trim()).toList();
      errorsMap[key] = values;
    }
  }

  return errorsMap;
}