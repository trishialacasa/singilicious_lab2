
# Singilicious

**Good food. Good friends. Fair shares.**

## Laboratory Activity 2 – Flutter Static UI Implementation

**Student:** Trishia May S. Lacasa  
**School:** National Teachers College

## Application Overview

Singilicious is a mobile-based group expense management and bill splitting application designed to help users manage shared expenses, calculate individual contributions, and track outstanding balances conveniently.

## Laboratory Activity Objectives

- Develop two static Flutter application screens.
- Apply Row, Column, and Stack widgets.
- Integrate local image assets and custom fonts.
- Implement consistent application theming using ThemeData.
- Create an organized and user-friendly mobile interface.

## Implemented Screens

### 1. Home Dashboard

- Total group expenses
- Outstanding balance summary
- Quick action buttons
- Payment confirmation section
- Group expense overview
- Bottom navigation bar

### 2. Group Expenses Screen

- Group information and invitation code
- Member avatars
- Expense summary
- Expense categories and filters
- Equal, custom, and selected-member split labels
- Floating Add Expense button

## Technologies Used

- Flutter
- Dart
- Visual Studio Code
- Android Emulator
- Figma
- GitHub

## Design Specifications

| Element | Specification |
|---|---|
| Primary Color | Forest Green (#234D3C) |
| Secondary Color | Sage Green (#D9E6CB) |
| Background Color | Cream (#F5F1E8) |
| Accent Color | Honey Gold (#E9B872) |
| Font Family | Poppins |

## Project Structure

    singilicious/
    ├── assets/
    │   ├── fonts/
    │   └── images/
    ├── lib/
    │   ├── main.dart
    │   └── group_expenses.dart
    ├── test/
    │   └── widget_test.dart
    ├── pubspec.yaml
    └── README.md

## How to Run

1. Clone the repository.
2. Open the project in Visual Studio Code.
3. Run `flutter pub get`.
4. Connect an Android emulator or supported device.
5. Run `flutter run`.

## Current Development Status

This repository contains the static UI implementation
for Laboratory Activity 2. All displayed expenses,
balances, and member information are sample data.

Navigation, authentication, database integration,
and functional bill splitting will be implemented
in future development stages.
