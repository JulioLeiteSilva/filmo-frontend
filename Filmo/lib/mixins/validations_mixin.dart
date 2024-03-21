mixin ValidationsMixin {
  String? isNotEmpty(String? value, [String? message]) {
    if (value!.isEmpty) return message ?? "O campo não pode ser nulo!!";
    return null;
  }
}
