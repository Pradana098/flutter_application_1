class Student {
  final String name;
  bool isPresent;

  Student({required this.name, this.isPresent = false});

  Student copyWith({String? name, bool? isPresent}) {
    return Student(
      name: name ?? this.name,
      isPresent: isPresent ?? this.isPresent,
    );
  }
}