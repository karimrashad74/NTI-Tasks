import 'dart:io';

class TheaterSystem {
  static final TheaterSystem _instance = TheaterSystem._internal();

  factory TheaterSystem() {
    return _instance;
  }

  TheaterSystem._internal();

  final List<List<String>> _theaterSeats =
      List.generate(5, (_) => List.generate(5, (_) => 'E'));

  final Map<String, Map<String, String>> _bookings = {};

  final String _theaterEmoji = "\u{1F3AD}";

  void welcomeMessage() {
    print('$_theaterEmoji  Welcome To Our Theater $_theaterEmoji');
  }

  void showMenu() {
    print("\npress 1 to book new seat");
    print("press 2 to show the theater seats");
    print("press 3 to show users data");
    print("press 4 to exit");
  }

  void bookSeat() {
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

      if (_theaterSeats[rowIndex][colIndex] == 'B') {
        print("Seat already booked! Try another.");
      } else {
        stdout.write("Enter your name: ");
        String? name = stdin.readLineSync();
        stdout.write("Enter your phone number: ");
        String? phone = stdin.readLineSync();

        _theaterSeats[rowIndex][colIndex] = 'B';
        _bookings['${rowIndex + 1},${colIndex + 1}'] = {
          'Name': name ?? '',
          'Phone': phone ?? ''
        };

        print("Seat booked successfully!");
        break;
      }
    }
  }

  void showSeats() {
    print("\nTheater Seats:");
    for (var row in _theaterSeats) {
      print(row.join(' '));
    }
  }

  void showBookings() {
    if (_bookings.isEmpty) {
      print("No user data available yet.");
    } else {
      print("\nBooking List:");
      _bookings.forEach((seat, details) {
        print(
            "Seat: $seat - Name: ${details['Name']}, Phone: ${details['Phone']}");
      });
    }
  }
}
