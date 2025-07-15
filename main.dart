enum UserRole { admin, editor, guest }

String formatUser(Map<String, dynamic> data) {
  final nameBuffer = StringBuffer();

  nameBuffer
    ..write(data['first'] ?? '')
    ..write(data['middle'] != null ? ' ${data['middle']}' : '')
    ..write(data['last'] != null ? ' ${data['last']}' : '');

  final fullName = nameBuffer.toString().trim().isEmpty
      ? 'Guest'
      : nameBuffer.toString().trim();

  final role = (data['role'] is String)
      ? UserRole.values.firstWhere(
          (e) => e.name == data['role'].toString().toLowerCase(),
      orElse: () => UserRole.guest)
      : UserRole.guest;

  return '[$role] $fullName';
}

void main() {
  var user1 = {'first': 'Omar', 'role': 'admin'};
  var user2 = {'dsd' : 'sad'};

  print(formatUser(user1));
  print(formatUser(user2));
}


