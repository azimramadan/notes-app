# Notes App 📓✨

This project is a note-taking app built with **Flutter**, leveraging **Hive** for local storage and **BLoC** for state management. The app allows users to create, edit, search, and delete notes with smooth animations and user-friendly interfaces. 💡

## Features ⚡️

- **Create, Edit, and Delete Notes** 📝
- **Smooth Animations** 🎬
- **Search Functionality** 🔍
- **Custom Dialogs and Transitions** 🏙️
- **Modal Progress HUD** ⏳
- **Local Storage** **with Hive** 💾
- **State Management** **using BLoC** 💼

## Animations Used 🎬

The app utilizes various types of animations to enhance the user experience. Below are the main animations used:

### **Animated List 📝**
   - **Description**: The list of notes in the app is animated when items are added or removed. This provides a smooth transition and gives users a better visual experience when interacting with the list. 🎢
   - **Implementation**: 
     The `AnimatedList` widget is used to animate the insertion and removal of notes. When a new note is added, it smoothly slides into the list. When a note is deleted, it smoothly slides out.
     
These animations enhance the user experience by making the app feel **responsive** and **fluid**, and they contribute to the overall **polished look** of the application. ✨

## Search Functionality 🔍

The app features a **custom search delegate** that allows users to search for notes based on their title, content, or date. The search is implemented using Flutter's `SearchDelegate` class and filters the notes as the user types.

### CustomSearchDelegate 🧐

The `CustomSearchDelegate` is responsible for managing the search queries and displaying the search results. It listens to user input and filters the notes in real-time.

## Modal Progress HUD ⏳

**Description:**  
A loading spinner is displayed when a note is being added, using a `ModalProgressHUD` widget. This provides feedback to the user during long-running operations. 🔄

**Implementation:**  
The app uses the `modal_progress_hud_nsn` package to show a loading spinner when notes are being saved.

---

## 📸 Screenshots
<p align="center">
  <img src="screenshot\home_view.png" width="45%" />
  <img src="screenshot\home_view_with_notes.png" width="45%" />
</p>
<p align="center">
  <img src="screenshot\Screenshot_1735176961.png" width="45%" />
  <img src="screenshot\search_not found_item.png" width="45%" />
</p>


## 🎬 Demo

> 🔗 check the demo post on [LinkedIn](https://www.linkedin.com/posts/azimramadan_flutter-mobiledevelopment-dart-activity-7278041724545814528-JlVv?utm_source=social_share_send&utm_medium=member_desktop_web&rcm=ACoAAEnUMDsBHOQmpv6_GP-fBGNNSeeDyOxGA6A)
---

## Installation 🚀

### Prerequisites:
- Flutter SDK 3.0 or higher
- Dart SDK 2.18 or higher
- Hive (for local storage)
- Flutter Bloc (for state management)

### Steps to Run:

1. **Clone the repository:**

   ```bash
   git clone https://github.com/azimramadan/notes-app.git

2. **Install Flutter Dependencies:**

   ```bash
   flutter pub get

3. **Run the Projec For Android Emulator:**

   ```bash
   flutter run

---

Feel free to explore, contribute, and use this project to enhance your Flutter skills! 😊
