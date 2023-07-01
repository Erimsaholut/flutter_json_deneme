# My Project

This project demonstrates the usage of JSON data and widget integration in Flutter.

## Description

The project showcases how to load JSON data and dynamically create widgets based on the data in a Flutter application. It utilizes the `dart:convert` library to decode the JSON file and extract the required information. The loaded JSON data is used to create custom widgets called "message balloons" that are displayed in the app.

## Features

- Loads JSON data from a file
- Decodes the JSON data using `dart:convert`
- Creates custom widget, `MessageBalloon`, to display messages
- Dynamically adds message balloons based on the loaded JSON data
- Allows adding new messages with a button click
- Provides a reset button to clear the chat

## Installation

1. Clone the repository: `git clone https://github.com/Erimsaholut/flutter_json_deneme.git`
2. Navigate to the project directory: `cd flutter_json_deneme`
3. Install the dependencies: `flutter pub get`
4. Run the application: `flutter run`

## Usage

1. Ensure you have a JSON file with the required structure (e.g., `sample.json`) in the `assets` folder of your project.
2. Update the file path in the code to match your JSON file's location.
3. Run the application on an emulator or device.
4. The app will load the JSON data and display the initial set of message balloons.
5. Click the "New message" button to add a new message balloon.
6. Click the "Reset Chat" button to clear the chat and start over.

Feel free to modify the code and JSON data according to your requirements.

## Contribution

Contributions to this project are welcome! If you encounter any issues or have suggestions for improvements, please feel free to open an issue or submit a pull request.

## License

This project is licensed under the [MIT License](LICENSE).
