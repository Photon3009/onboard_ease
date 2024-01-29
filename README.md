<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

# OnboardEase

OnboardEase is a Flutter package that simplifies the creation of onboarding screens for your applications. With this package, you can easily customize your onboarding screens and provide a seamless introduction experience to your users.

## Features

- Highly customizable onboarding screens.
- Built-in page indicator.
- Simple and intuitive API.

## Environment

`sdk: ">=3.2.3 <4.0.0"`
`flutter: ">=1.17.0"`

## Installation

To install `onboard_ease`, add it to your `pubspec.yaml` file:

```yaml
dependencies:
  onboard_ease: ^0.0.1
```

Then, run `flutter pub get` to fetch the package.

## Usage

First, import the package in your Dart file:

```dart
dart import 'package:onboard_ease/onboard_ease.dart';
```

Next, create an instance of `CustomOnboardingScreen`:

```dart
OnboardEase( pages: <Widget>[ PageOne(), PageTwo(), PageThree(), ], indicatorDecoration: BoxDecoration(color: Colors.blue), context: context, )
```

In this example, `PageOne()`, `PageTwo()`, and `PageThree()` are widgets representing individual onboarding pages. Replace them with your own widgets.

## Example

Here's a basic example of how to use OnboardEase:

main.dart

```dart
import 'package:custom_onboarding/onboard_ease.dart';
import 'package:custom_onboarding/onboardingPages.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: OnboardEase(context: context, pages: [
        OnboardingPage(
            title: 'First Page',
            description: "This is the first page of our onboarding screen",
            imageUrl: "https://wallpapercave.com/wp/wp9188629.jpg"),
        OnboardingPage(
            title: 'Second Page',
            description: "This is the second page of our onboarding.",
            imageUrl:
                "https://e1.pxfuel.com/desktop-wallpaper/854/898/desktop-wallpaper-neutral-minimalist-aesthetic-minimalistic-summer.jpg"),
        OnboardingPage(
            title: 'Third Page',
            description: "This is the third page of our onboarding.",
            imageUrl:
                "https://i.pinimg.com/736x/89/2d/de/892dde1fc41eba573a249f9355878d77.jpg"),
        OnboardingPage(
            title: 'Last Page',
            description: "This is the last page of our onboarding.",
            imageUrl:
                "https://i.pinimg.com/564x/13/4d/5a/134d5a7c1b950b7fa5523006ccfabd5a.jpg")
      ]),
    );
  }
}

```

onBoardingPages.dart (not necessary file)

```dart
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;

  OnboardingPage({
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Expanded(
      child: Stack(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            imageUrl,
            width: screenWidth,
            height: screenHeight,
            fit: BoxFit.cover,
          ),
          Center(
            child: Column(
              children: [
                SizedBox(height: screenHeight / 1.5),
                Text(
                  title,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
                  child: Text(
                    description,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

```

In this example, `OnBoardingPage()` is the widget representing individual onboarding pages. Replace them with your own widgets. Additionally, users can customize the indicator decoration using the third parameter of OnboardEase().

## Issues and feedback

If you encounter any issues or have suggestions for improvement, please file an [issue](https://github.com/Photon3009/onboard_ease/issues/new). We appreciate your feedback and contributions.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.
