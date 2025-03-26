# Hava Havai Shopping Cart 

A Flutter-based shopping cart application developed as part of the Hava Havai hiring challenge. This app features product listing with pagination, cart management, and price calculations with discounts.



## Features

- **Product Listing** with pagination (10 items per page)
- **Discount Price Calculation** displayed for each product
- **Shopping Cart Management** with quantity adjustment
- **State Management** using Riverpod
- **API Integration** with DummyJSON products endpoint
- **Responsive Grid Layout** for product display
- **Cart Total Calculation** with real-time updates
- **Error Handling** and loading states
- **Image Caching** with error fallbacks
- **Clean Architecture** with proper separation of concerns

## Screenshots

<div align="center">
  <div style="display: flex; justify-content: space-between">
    <img src="https://github.com/Aayush9266/havahavai/blob/master/screenshots/havahavai2.jpg" width="45%" alt="Products Screen">
    <img src="https://github.com/Aayush9266/havahavai/blob/master/screenshots/havahavai1.jpg" width="45%" alt="Cart Screen">
  </div>
  <em>Left: Product listing with add to cart button | Right: Shopping cart with quantity controls</em>
</div>

<br>



## Technologies Used

- **Flutter** - Framework
- **Riverpod** - State management
- **Dio** - HTTP client
- **Cached Network Image** - Image loading and caching
- **Dart** - Programming language

## Installation

1. **Clone the repository**
```bash
git clone https://github.com/Aayush9266/havahavai.git
cd havahavai
```

2. **Install dependencies**
```bash
flutter pub get
```

3. **Run the app**
```bash
flutter run
```

## Project Structure

```
lib/
├── models/            # Data models
├── providers/         # Riverpod state providers
├── services/          # API service classes
├── screens/           # Application screens
├── widgets/           # Reusable UI components
└── main.dart          # Entry point
```

## API Integration

The app uses the [DummyJSON Products API](https://dummyjson.com/products) with the following features:
- Pagination support
- Product discount calculations
- Image loading from URLs
- Error handling for network requests

## State Management

Implemented using **Riverpod** with:
- `productsProvider` - Manages product list and pagination
- `cartProvider` - Handles cart operations and total calculation
- StateNotifier for business logic encapsulation



