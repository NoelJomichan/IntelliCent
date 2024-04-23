
class User {
  String username;
  String apiKey;
  String savings;
  String risk;
  String duration;
  String expectedReturns;

  User({required this.username, required this.apiKey, required this.savings, required this.risk, required this.duration, required this.expectedReturns});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'],
      apiKey: json['api_key'],
      savings: json['savings'],
      risk: json['risk'],
      duration: json['duration'],
      expectedReturns: json['expected_returns'],
    );
  }
}
