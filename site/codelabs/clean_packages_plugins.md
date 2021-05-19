summary: Clean - External Dependency
id: clean_packages_plugins
categories: Mobile Development with Flutter
tags: Plugin, Package, UI, Test, Widget Test
status:  Active
authors: Alireza Khakpour

<style>
r { color: Red }
o { color: Orange }
g { color: Green }
</style>

# Clean Freamework and External Dependency

## Introduction

![Pub.dev](clean_packages_plugins/pub.png)

- **Package** : A package is a piece of software that adds capabilities to the Flutter app.
  - **Dart packages** : General packages written in Dart, contain Flutter specific functionality and thus have a dependency on the Flutter framework.
  - **Plugin packages** : A specialized Dart package that contains an API written in Dart code combined with one or more platform-specific implementations.

To access Pub is the package manager for the Dart programming language, containing reusable libraries & packages for Flutter, AngularDart, and general Dart programs.


## How select a good package


- High overall package score
- Prefer permissive license
- GitHub version tag matches the current version from pub.dev
- Feature completeness—and not marked as incomplete 
- Verified publisher
- General usability when it comes to the overview, docs, sample/example code, and API quality
- Good runtime behavior in terms of CPU and memory usage
- High quality dependencies
- Reputation of publisher



## How add a package to clean framework


![Presentation Layer](clean_packages_plugins/dependency.png)


> We should use a wrapper for plugin functionality. The usage of plugin is in bloc or use case, imagine for any reason in future we want to swap the plugin for something different. If we used it directly inside the Usecase we would need to change Lot of code. but by hiding 3rd party library an a class we control it, there won't much code to change at all.



```dart
  class PermissionHandlerPlugin extends ExternalDependency {
    Future<bool> isGrantedAccessCamera() async {
      var status = await Permission.camera.status;
      if (status.isGranted) {
        return true;
      } else {
        var reqStatus = await Permission.camera.request();
        return reqStatus.isGranted;
      }
    }
}

```




## How To Test a package wrapper method

- Test should verify back button action on the screen
  
 1. create a `MockPressenterAction` to cover presenter actions 

```dart
    class MockPermissionHandlerPlugin extends Mock
    implements PermissionHandlerPlugin {}
```

 2. with overridding the method to return a mock value

```dart
    class MockPermissionHandlerPlugin extends Mock
    implements PermissionHandlerPlugin {
  @override
  Future<bool> isGrantedAccessCamera() async {
    return true;
  }
}
```

 3. initiate mock package in order to Call the method that use the plugin

```dart
    MaterialApp testWidget = MaterialApp(
      home: ExampleScreen(
          viewModel: exampleViewModel,
          pressenterAction: mockPressenterAction),
    );
```

 4. Calls the method that execute the plugin method. we should expect the mthod run properlly
 
 

## Widget Test a package

 The purpose of this test is to ensure every interaction the user makes produces the expected result.

to test the package it self we can use their guidelines in their git repository 




