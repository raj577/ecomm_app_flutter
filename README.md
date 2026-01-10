# 🛒 Flutter E-Commerce Mini App

A lightweight e-commerce application developed as a **technical take-home assignment**, focusing on clean architecture, state management, and reliable business logic.

---

## 📖 Overview
The primary goal of this project is to demonstrate a solid understanding of **Flutter fundamentals**, specifically focusing on:
* **Separation of concerns** (UI vs. Logic).
* **State management** using the Provider pattern.
* **Asynchronous data handling** via REST APIs.

The app allows users to browse products, view details, manage a shopping cart, and simulate a checkout process.

---

## 🛠 Tech Stack
* **Framework:** [Flutter](https://flutter.dev/) (Stable)
* **Language:** Dart (Null Safety)
* **State Management:** [Provider](https://pub.dev/packages/provider) (ChangeNotifier)
* **API:** [Fake Store API](https://fakestoreapi.com/)
* **Target Platform:** Android

---

## 🏗 Architecture
The project follows a **Layered Architecture** to ensure the code is maintainable and testable:

1.  **UI Layer:** Purely declarative widgets; contains no business logic.
2.  **Provider Layer:** Manages state, handles business logic, and coordinates between UI and Services.
3.  **Service Layer:** Handles API communication and data fetching.
4.  **Model Layer:** Data structures and JSON serialization.

---

## ✨ Features & Business Logic
* **Product Fetching:** Fetches real-time data with loading and error state handling.
* **Cart Management:** Add/remove items and adjust quantities.
* **Complex Calculations:** Logic handled within `CartProvider` including:
    * Subtotal calculation.
    * Dynamic discount application.
    * **5% Tax** calculation.
    * Final Grand Total.

---

## 🚀 Getting Started

### Prerequisites
* Flutter SDK (Stable)
* Android Studio / VS Code
* An Android Emulator or Physical Device

### Installation
1. **Clone the repository:**
   ```bash
   git clone <your-repo-url>
