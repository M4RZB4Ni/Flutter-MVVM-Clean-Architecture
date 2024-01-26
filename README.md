# Image Handler based On Flicker's API and Flutter leverage on MVVM and Clean Architecture for Mobile

## Overview
This is a Flutter project developed as a technical test by **Hamidreza Marzbani**. The project focuses on **Using Flicker's API to fetch recent images and search
between Flicker's images**.

## Table of Contents
- [Architecture](#architecture)
- [Technologies and Libraries Used](#technologies-and-libraries-used)
- [Getting Started](#getting-started)
    - [Prerequisites](#prerequisites)
    - [Installation](#installation)
- [Running the Project](#running-the-project)
- [Author](#author)

## Architecture

The Project is Based on MVVM and Clean-Architecture with consideration of SOLID principles which Includes four Module:

1. App: is responsible for infrastructure of the project include network handlers and exception handlers and base files.
2. Data: The data layer serves as a bridge between the domain layer and the presentation layer, supplying data through implementations of data sources, repositories, and models.
3. Domain: The domain layer encapsulates the core business logic and rules, acting as an intermediary between the data layer and presentation layer to ensure separation of concerns and maintain a clean, business-centric architecture.  
4. Presentation: The presentation layer manages user interfaces and interactions, focusing on the visual representation of data and user experience. It relies on the domain layer for business logic and the data layer for data retrieval, fostering a clear separation of concerns in the application architecture.

## Technologies and Libraries Used

- **Flutter**: Flutter is a UI toolkit that enables the creation of natively compiled applications for mobile, web, and desktop from a single codebase.

- **Cached Network Image**: A Flutter library to load and cache network images.

- **Flutter Dotenv**: A library for loading environment variables from a .env file.

- **Freezed and Freezed Annotation**: A code generation package for unions/pattern-matching/copy/toString/equals/hashCode.

- **Flutter Screenutil**: A Flutter plugin to provide a simple way to set the width and height of widgets based on screen size.

- **Get**: A state management library for Flutter.

- **Internet Connection Checker**: A library to check the internet connection status in a Flutter app.

- **Json Annotation and Json Serializable**: Packages for converting Dart objects to and from JSON.

- **HTTP**: A package for making HTTP requests.

- **Infinite Scroll Pagination**: A package to implement infinite scroll pagination in Flutter.

- **Lottie**: A Flutter package for smoothly displaying Lottie animations.

- **Xml2json**: A package for converting XML to JSON in Flutter.

## Getting Started

### Prerequisites

- Ensure that you have Flutter and Dart installed on your machine. [Flutter Installation Guide](https://flutter.dev/docs/get-started/install)

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/m4rzb4ni/communere.git

### Running the Project


1. Update the pub:

   ```bash
   flutter pub get
2. Build models with [Freezed](https://pub.dev/packages/freezed):

   ```bash
   dart run build_runner build --delete-conflicting-outputs  
3. Build the apk:

   ```bash
   flutter build apk

### Author

 **Hamidreza Marzbani**

- **LinkedIn**: https://www.linkedin.com/in/marzbani/
- **Email**: [marzbani.business@gmail.com]()






