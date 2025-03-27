import 'dart:io';

void main() {
  List<List<String>> seats = List.generate(5, (_) => List.filled(5, 'E'));
  Map<String, String> bookings = {};

  print("Welcome To Our Theater");

  while (true) {
    print("\npress 1 to book new seat");
    print("press 2 to show the theater seats");
    print("press 3 to show users data");
    print("press 4 to exit");

    stdout.write("input=> ");
    String? choice = stdin.readLineSync();

    if (choice == '4') {
      print("Exiting...");
      break;
    }

    switch (choice) {
      case '1':
        stdout.write("Enter row (1-5) or 'exit' to quit: ");
        String? rowInput = stdin.readLineSync();
        if (rowInput == 'exit') break;

        int row = int.parse(rowInput!) - 1;
        stdout.write("Enter column (1-5): ");
        int col = int.parse(stdin.readLineSync()!) - 1;

        if (row < 0 || row >= 5 || col < 0 || col >= 5) {
          print("Invalid seat position. Try again.");
          continue;
        }

        if (seats[row][col] == 'B') {
          print("Seat already booked! Choose another seat.");
        } else {
          stdout.write("Enter your name: ");
          String name = stdin.readLineSync()!;
          stdout.write("Enter your phone number: ");
          String phone = stdin.readLineSync()!;

          seats[row][col] = 'B';
          String seatPosition = "${row + 1},${col + 1}";
          bookings[seatPosition] = "$name - $phone";

          print("Seat booked successfully!");
        }
        break;

      case '2':
        print("\nTheater Seats:");
        for (var row in seats) {
          print(row.join(" "));
        }
        break;

      case '3':
        print("\nUsers Booking Details:");
        if (bookings.isEmpty) {
          print("No bookings yet.");
        } else {
          bookings.forEach((seat, userData) {
            print("Seat $seat: $userData");
          });
        }
        break;

      default:
        print("Invalid choice! Please enter a number between 1 and 4.");
    }
  }
}
