import 'dart:io';

T getInput<T>(
    {required String message, required T? Function(String) validator}) {
  while (true) {
    stdout.write("$message ");
    String? input = stdin.readLineSync()?.trim();

    if (input == null || input.isEmpty) {
      print("\n❌ Input cannot be empty! Try again.\n");
      continue;
    }

    T? validatedValue = validator(input);
    if (validatedValue != null) return validatedValue;

    print("\n❌ Invalid input! Try again.\n");
  }
}
