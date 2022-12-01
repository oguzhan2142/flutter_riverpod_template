enum UserType {
  student("student"),
  teacher("teacher"),
  guardian("guardian");

  final String apiValue;

  const UserType(this.apiValue);
}
