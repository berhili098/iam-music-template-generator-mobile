


          
# iammusic

A Flutter application that generates stylized text using a custom music font.

## Features

- Generate text with a unique music-themed font style
- Real-time preview of the generated text
- Save generated text as images to your device's gallery
- Customizable text input

## ⚠️ Important Note

The image saving functionality does not work on iOS and Android simulators. This is a limitation of the simulators and not an issue with the app. To test the image saving feature, please use a physical device.

## Getting Started

### Prerequisites

- Flutter SDK
- iOS/Android development environment set up
- Physical device for testing image saving functionality

### Installation

1. Clone the repository
2. Run `flutter pub get` to install dependencies
3. Connect a physical device or start a simulator
4. Run `flutter run` to start the application

### Dependencies

The project uses several key Flutter packages:
- `flutter_hooks` - For state management
- `flutter_image_gallery_saver` - For saving images to the gallery
- `permission_handler` - For handling storage permissions

## Project Structure

The project follows a simple architecture with the following key components:

- `main.dart` - App initialization and theme setup
- `my_home_page.dart` - Main UI with text input and preview functionality
- `text_downloader_helper.dart` - Image saving functionality implementation

## Usage

1. Launch the app
2. Enter your desired text in the input field
3. Preview the text with the music font styling
4. Save the generated text as an image (requires physical device)

## Resources

For help getting started with Flutter development:
- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)
- [Online documentation](https://docs.flutter.dev/)

## License

This project is licensed under standard Flutter project terms.

## Contributing

Feel free to submit issues and enhancement requests.