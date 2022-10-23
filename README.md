# Khana

Khana is a free, easily-accessible web/phone application that allows users to share food. Some of its main functions are:
  * Food share/Host food event
  * Food request
  * Receive tokens for sharing food
  * Spend the tokens to receive food


## Getting Started

FlutterFlow projects are built to run on the Flutter _stable_ release.

### IMPORTANT:

For projects with Firestore integration, you must first run the following commands to ensure the project compiles:

```
flutter pub get
flutter packages pub run build_runner build --delete-conflicting-outputs
```

This command creates the generated files that parse each Record from Firestore into a schema object.
