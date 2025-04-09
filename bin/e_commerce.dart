import 'categories.dart';
import 'input_function.dart';
import 'products.dart';

class ECommerce {
  List<String> storeSellerName = ['Karim Rashad', 'Ahmed Saber'];
  num _dayIncome = 0;
  final List<Category> _categories = [];

  void setCategories(Category category) {
    _categories.add(category);
    print("Added ${category.categoryName} To Categories");
  }

  List<Category> get categories => _categories;
  num get dayIncome => _dayIncome;

  void sell() {
    String inputCategoryName = getInput<String>(
      message: 'Enter the category name:',
      validator: (input) => input.isNotEmpty ? input : null,
    );

    String inputProductName = getInput<String>(
      message: 'Enter the product name:',
      validator: (input) => input.isNotEmpty ? input : null,
    );

    int inputQuantity = getInput<int>(
      message: 'Enter the quantity:',
      validator: (input) {
        int? val = int.tryParse(input);
        return (val != null && val > 0) ? val : null;
      },
    );

    for (var category in _categories) {
      if (inputCategoryName == category.categoryName) {
        for (var product in category.products) {
          if (inputProductName == product.productName) {
            if (inputQuantity <= product.quantity) {
              product.quantity -= inputQuantity;
              _dayIncome += product.price * inputQuantity;
              print("✅ Product sold successfully!");
            } else {
              print("Not enough quantity in stock");
              return;
            }
          }
        }
      }
    }
  }

  void buy() {
    String inputCategoryName = getInput<String>(
      message: 'Enter the category name:',
      validator: (input) => input.isNotEmpty ? input : null,
    );

    String inputProductName = getInput<String>(
      message: 'Enter the product name:',
      validator: (input) => input.isNotEmpty ? input : null,
    );

    int inputQuantity = getInput<int>(
      message: 'Enter the quantity:',
      validator: (input) {
        int? val = int.tryParse(input);
        return (val != null && val > 0) ? val : null;
      },
    );

    for (var category in _categories) {
      if (inputCategoryName == category.categoryName) {
        for (var product in category.products) {
          if (inputProductName == product.productName) {
            product.quantity += inputQuantity;
            _dayIncome -= product.price * inputQuantity;
            print("✅ Product bought successfully!");
          }
        }
      }
    }
  }

  void addCategory() {
    String inputCategoryName = getInput<String>(
      message: 'Enter the category name:',
      validator: (input) => input.isNotEmpty ? input : null,
    );

    Category newCategory = Category(inputCategoryName, []);
    setCategories(newCategory);
    print("Category added successfully");
  }

  void addProduct() {
    String inputCategoryName = getInput<String>(
      message: 'Enter the category name:',
      validator: (input) => input.isNotEmpty ? input : null,
    );

    String inputProductName = getInput<String>(
      message: 'Enter the product name:',
      validator: (input) => input.isNotEmpty ? input : null,
    );

    double inputPrice = getInput<double>(
      message: 'Enter the product price:',
      validator: (input) {
        double? val = double.tryParse(input);
        return (val != null && val > 0) ? val : null;
      },
    );

    int inputQuantity = getInput<int>(
      message: 'Enter the quantity:',
      validator: (input) {
        int? val = int.tryParse(input);
        return (val != null && val >= 0) ? val : null;
      },
    );

    for (var category in _categories) {
      if (inputCategoryName == category.categoryName) {
        category.products.add(Product(
          productName: inputProductName,
          price: inputPrice,
          quantity: inputQuantity,
        ));
        print(" Product added successfully ");
        return;
      }
    }

    print(" Category not found ");
  }

  void removeProduct() {
    String inputCategoryName = getInput<String>(
      message: 'Enter the category name:',
      validator: (input) => input.isNotEmpty ? input : null,
    );

    String inputProductName = getInput<String>(
      message: 'Enter the product name to remove:',
      validator: (input) => input.isNotEmpty ? input : null,
    );

    for (var category in _categories) {
      if (inputCategoryName == category.categoryName) {
        for (var product in category.products) {
          if (inputProductName == product.productName) {
            category.products.remove(product);
            print(" Product removed successfully!");
            return;
          }
        }
      }
    }

    print(" Product not found ");
  }

  void viewProducts() {
    String inputCategoryName = getInput<String>(
      message: 'Enter the category name to view products:',
      validator: (input) => input.isNotEmpty ? input : null,
    );

    for (var category in _categories) {
      if (inputCategoryName == category.categoryName) {
        print("Products in category: $inputCategoryName");
        for (var product in category.products) {
          print(
              "Product Name: ${product.productName}, Price: ${product.price}, Quantity: ${product.quantity}");
        }
        return;
      }
    }

    print(" Category not found");
  }

  void editCategoryName(String oldCategoryName, String newCategoryName) {
    for (var category in _categories) {
      if (category.categoryName == oldCategoryName) {
        category.categoryName = newCategoryName;
        print(
            "Category name updated from $oldCategoryName to $newCategoryName");
        return;
      }
    }
    print("Category not found");
  }

  void displayMenu() {
    String inputName = getInput<String>(
      message: 'Enter the seller name:',
      validator: (input) => input.isNotEmpty ? input : null,
    );

    if (storeSellerName.contains(inputName)) {
      print("Welcome, $inputName");
      print("Select an option:");
      print("1. Add Category");
      print("2. Add Product");
      print("3. Update Category Name");
      print("4. View Products");
      print("5. Remove Product");
      print("6. Sell Product");
      print("7. Buy Product");
      print("8. Show Day Income");
      print("9. Exit");

      int choice = getInput<int>(
        message: 'Enter your choice (1-9):',
        validator: (input) {
          int? val = int.tryParse(input);
          return (val != null && val >= 1 && val <= 9) ? val : null;
        },
      );

      while (choice != 9) {
        switch (choice) {
          case 1:
            addCategory();
            break;
          case 2:
            addProduct();
            break;
          case 3:
            String oldCategory = getInput<String>(
              message: 'Enter the old category name:',
              validator: (input) => input.isNotEmpty ? input : null,
            );
            String newCategory = getInput<String>(
              message: 'Enter the new category name:',
              validator: (input) => input.isNotEmpty ? input : null,
            );
            editCategoryName(oldCategory, newCategory);
            break;
          case 4:
            viewProducts();
            break;
          case 5:
            removeProduct();
            break;
          case 6:
            sell();
            break;
          case 7:
            buy();
            break;
          case 8:
            print("Day Income: \$${dayIncome}");
            break;
          default:
            print("Invalid choice");
            break;
        }
        choice = getInput<int>(
          message: 'Enter your choice (1-9):',
          validator: (input) {
            int? val = int.tryParse(input);
            return (val != null && val >= 1 && val <= 9) ? val : null;
          },
        );
      }
      print("Good Bye");
    } else {
      print("invalid name");
    }
  }
}
