import 'dart:io';

void main() {
  List<List<String>> theaterSeats =
      List.generate(5, (rows) => List.generate(5, (columns) => 'E'));

  Map<String, Map<String, String>> bookings = {}; // تخزين بيانات الحجز

  String theaterEmoji = "\u{1F3AD}";

  print('$theaterEmoji  Welcome To Our Theater $theaterEmoji');

  while (true) {
    print("\npress 1 to book new seat");
    print("press 2 to show the theater seats");
    print("press 3 to show users data");
    print("press 4 to exit");

    stdout.write("Enter your choice: ");
    String? userChoice = stdin.readLineSync();

    switch (userChoice) {
      case "1":
        while (true) {
          stdout.write("Enter row (1-5) or 'exit' to quit: ");
          String? userRow = stdin.readLineSync();
          if (userRow == 'exit') break;

          stdout.write("Enter column (1-5): ");
          String? userCol = stdin.readLineSync();

          int rowIndex = int.tryParse(userRow ?? '') ?? -1;
          int colIndex = int.tryParse(userCol ?? '') ?? -1;

          if (rowIndex < 1 || rowIndex > 5 || colIndex < 1 || colIndex > 5) {
            print("Invalid input! Please enter numbers between 1 and 5.");
            continue;
          }

          rowIndex--;
          colIndex--;

          if (theaterSeats[rowIndex][colIndex] == 'B') {
            print("Seat already booked! Try another.");
          } else {
            stdout.write("Enter your name: ");
            String? name = stdin.readLineSync();
            stdout.write("Enter your phone number: ");
            String? phone = stdin.readLineSync();

            theaterSeats[rowIndex][colIndex] = 'B';
            bookings['${rowIndex + 1},${colIndex + 1}'] = {
              'Name': name ?? '',
              'Phone': phone ?? ''
            };
            print("Seat booked successfully!");
            break;
          }
        }
        break;

      case "2":
        print("\nTheater Seats:");
        for (var row in theaterSeats) {
          print(row.join(' '));
        }
        break;

      case "3":
        if (bookings.isEmpty) {
          print("No user data available yet.");
        } else {
          print("\nBooking List:");
          bookings.forEach((seat, details) {
            print(
                "Seat: $seat - Name: ${details['Name']}, Phone: ${details['Phone']}");
          });
        }
        break;

      case "4":
        print("See You Back..!");
        return;

      default:
        print("Invalid choice! Please enter a number from 1 to 4.");
    }
  }
}
