# Magic Fitness App

Welcome to the Magic Fitness App! This Flutter application helps users track their workouts and manage fitness routines efficiently. The app uses a simple architecture that queries data from local storage, making it easy to maintain and extend. It can be effortlessly adapted to include API calls and advanced error handling within cubits or screens as needed.

## Table of Contents

- [Magic Fitness App](#magic-fitness-app)
  - [Table of Contents](#table-of-contents)
  - [Description](#description)
  - [Features](#features)
  - [Architecture](#architecture)
    - [Simplicity and Extensibility](#simplicity-and-extensibility)
  - [Installation](#installation)

## Description

Magic Fitness App is designed to help users log their workouts, track progress, and manage fitness routines. The app focuses on simplicity and ease of use, ensuring users can quickly input their workout data and retrieve it whenever needed.

## Features

- **Workout Logging**: Users can add, edit, and delete workouts, including details like exercises, sets, repetitions, and weights.
- **Local Data Storage**: Workout data is stored locally using Isar, a high-performance database for Flutter/Dart.
- **Simple Navigation**: Intuitive navigation between screens for seamless user experience.
- **State Management**: Uses a combination of Cubit for shared states and `setState` for local state management to simplify the app structure.
- **Modular Architecture**: Organized codebase with clear separation of concerns, making it easy to maintain and extend.

## Architecture

The app follows a simple yet effective architecture comprising the following layers:

1. **Models**: Define the data structures used throughout the app, such as `WorkoutModel` and `SetModel`. Models represent the entities stored in the database.

2. **Repositories**: Handle data operations and interactions with the local storage. Repositories abstract the data layer, making it easy to switch to a remote data source if needed.

3. **Cubits**: Manage the state of the app, particularly for features that require shared state across multiple widgets. Cubits are used in conjunction with the Bloc library for predictable state management.

4. **Screens**: The UI components of the app. Screens present the data to the user and handle user interactions. They use `setState` and simple object passing for local state updates when shared state management is unnecessary.

### Simplicity and Extensibility

- **Simple Data Queries**: The app currently queries data from local storage, keeping the architecture straightforward and efficient.
- **Easy Extension for API Calls**: The architecture is designed to be easily extendable. Developers can integrate API calls and handle errors within cubits or screens without significant refactoring.
- **State Management Balance**: By using both Cubits and `setState`, the app maintains a balance between complexity and simplicity, ensuring optimal performance and ease of development.

## Installation

To run the Magic Fitness App locally, follow these steps:

1. **Clone the Repository**

   ```bash
   git clone https://github.com/brunovsiqueira/magic_fitness_app.git
   cd magic_fitness_app

2. **Run code generation**

    ```bash
    dart run build_runner build

3. **Run the app**

    ```bash
    flutter run