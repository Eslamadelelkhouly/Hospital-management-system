class MedicalTestSearch {
  final List<MedicalTest> tests;
  final String message;
  final int status;

  MedicalTestSearch({
    required this.tests,
    required this.message,
    required this.status,
  });

  factory MedicalTestSearch.fromJson(Map<String, dynamic> json) {
    return MedicalTestSearch(
      tests: (json['tests'] as List<dynamic>)
          .map((e) => MedicalTest.fromJson(e))
          .toList(),
      message: json['message'] ?? '',
      status: json['status'] ?? 0,
    );
  }
}

class MedicalTest {
  final int id;
  final String testName;
  final String cost;
  final String description;

  MedicalTest({
    required this.id,
    required this.testName,
    required this.cost,
    required this.description,
  });

  factory MedicalTest.fromJson(Map<String, dynamic> json) {
    return MedicalTest(
      id: json['id'] ?? 0,
      testName: json['test_name'] ?? '',
      cost: json['cost'] ?? '',
      description: json['description'] ?? '',
    );
  }
}
