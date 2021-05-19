summary: Clean - Presenter and Bloc
id: clean_presenter_bloc
categories: Mobile Development with Flutter
tags: Clean Framework, Flutter, Clean Architecture
status:  Active
authors: Alireza Khakpour

<style>
r { color: Red }
o { color: Orange }
g { color: Green }
</style>

# Clean - The Presenter and BLoC
 
## Introduction



- **Presenter** : Creates Screen based on `BuildContext`, `BLoC`, and `ViewModel`
- **BLoC** : 





## Presenter



**Feature Widget**
: is a `StatelessWidget` that describes the feature user interface by initializing the BLoc and associate a presenter to the `BLoC`.

**Presenter** creates three different state of the screen such as Loading Screen, Error Screen and Screen, also manages all screen actions


```dart
    class ExamplePresenter extends Presenter<ExampleBloc, ExampleViewModel, ExampleScreen>  {     
      
        @override
        ExampleScreen buildScreen(BuildContext context, ExampleBloc  bloc, ExampleViewModel viewModel) {...    

        @override
        Stream<DepositCheckCardViewModel> getViewModelStream (ExampleBloc bloc) {...

        @override
        Widget buildLoadingScreen(BuildContext context) {...

        @override
        Widget buildErrorScreen(BuildContext context, Object? error) {...
    }
```



 `getViewModelStream` Method
  : `BLoc` listener handle view model changes 

  `buildLoadingScreen` Method
  : Creat the loading screen 

  `buildErrorScreen` Method
  : Creat error screen 

  `buildScreen` Method
  : Creat the screen by passing associated `viewModel` 

```dart
      @override
      DepositCheckCardScreen buildScreen(BuildContext   context,
          ExampleBloc bloc, ExampleViewModel  viewModel) {
        return ExampleScreen(
          viewModel: viewModel,
          pressenterActions: ExamplePressenterActions(),
        );
      }
```
All screen action could handle in a separated action class

```dart
    class ExamplePressenterActions {
      
      DepositCheckCardPressenterActions();

      navigateToDetail(BuildContext context) {
        CFRouterScope.of(context).push(Router.detailRoute);
      }
    }
```

## BLoC


## How To Test Presenter


## Sample Presenter Test


## How To Test BLoC

## Sample BLoC Test



