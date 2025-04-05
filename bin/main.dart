import 'dart:io';
import 'theater_booking_system.dart';

void main() {
  final theater = TheaterSystem();
  theater.welcomeMessage();

  while (true) {
    theater.showMenu();

    stdout.write("Enter your choice: ");
    String? userChoice = stdin.readLineSync();

    switch (userChoice) {
      case "1":
        theater.bookSeat();
        break;

      case "2":
        theater.showSeats();
        break;

      case "3":
        theater.showBookings();
        break;

      case "4":
        print("See You Back..!");
        return;

      default:
        print("Invalid choice! Please enter a number from 1 to 4.");
    }
  }
}
