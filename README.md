## Project Structure

```

lib/
│── main.dart
│
├── models/
│ ├── product.dart
│ └── cart_item.dart
│
├── providers/
│ ├── product_provider.dart
│ └── cart_provider.dart
│
├── screens/
│ ├── product_list_screen.dart
│ ├── product_detail_screen.dart
│ ├── cart_screen.dart
│ └── checkout_screen.dart
│
├── services/
│ └── api_service.dart
│
├── widgets/
│ ├── product_card.dart
│ └── quantity_selector.dart
```

---

## Architecture

### 1. State Management – Provider

* **Used Provider as per assignment**


*Providers used:

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
* A Splash Screen can be used to fetch the data from api before product detail screen
* Sort product by value
* Category Filteration
* Dark Mode can be implemented



---


## APK Download

You can download and test the APK from the link below:

**[Download APK](https://drive.google.com/file/d/1s81R7j26_yVfN8sCfcdRB9LFH12zAX6b/view?usp=sharing)**

## Author

**Rajat**

