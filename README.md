# Flutter E‑Commerce Demo App

## Overview

This project is a **Flutter-based E‑Commerce demo application** built as part of an interview assignment. The goal of the app is to demonstrate **clean architecture, state management using Provider, reusable UI components, and basic business logic** such as product listing, cart management, and price calculations.


---


## Project Structure

```
lib/
│── main.dart
│
├── models/
│   ├── product.dart
│   └── cart_item.dart
│
├── providers/
│   ├── product_provider.dart
│   └── cart_provider.dart
│
├── screens/
│   ├── product_list_screen.dart
│   ├── product_detail_screen.dart
│   └── cart_screen.dart
│
├── widgets/
│   ├── product_card.dart
│   └── cart_item_tile.dart
│
└── services/
    └── mock_api_service.dart
```

---

## Architecture

### 1. State Management – Provider

* **Why Provider?**

    * Simple and lightweight
    * Recommended by Flutter team for small–medium apps
    * Easy to understand and explain in interviews

* Providers used:

    * `ProductProvider` → handles product fetching and loading states
    * `CartProvider` → manages cart items, totals, and business rules

---

### 2. Separation of Business Logic

* **Models** → Plain Dart classes (`Product`, `CartItem`)
* **Providers** → Business logic and state
* **Screens** → Page‑level UI
* **Widgets** → Reusable UI components


---

### Prerequisites

* Flutter SDK installed
* Android Studio
* Emulator or physical device

### Steps

```bash
flutter clean
flutter pub get
flutter run
```

---

## Known Limitations

* No authentication or user accounts
* No persistent storage (cart resets on restart)
* No catched to show when network not available
* No logged in user to show recomendation


---

## Possible Improvements
* Add local persistence using SharedPreferences
* Implement Product search
* A Splash Screen can be used
* Sort product by value
* Category Filteration
* Dark Mode can be implemented



---



## Author

**Rajat**

