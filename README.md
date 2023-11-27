# Authentication App

## Description
This is a Authentication base Application built with Flutter, Flutter_Bloc and Firebase

## App Apk can be found at apk folder
- apk/app-realease.apk
- apk/

## Features

- Sign in with email/password
- Create account with name, password, email and address
- Google Signin also added
- Signout account after login

### What is used in this project?
- <b>Flutter bloc </b>
    To implement the BLoC (Business Logic Component) design pattern.
- <b>Equatable</b>
    Use to check the equality for data classes
- <b>Get it</b>
    Service location used as dependency injection
- <b>Dartz</b>
    Functional Programming ` Either<Left,Right> `
- <b>GoRouter</b>
    Navigation package that help simplify routing
- <b>Firebase</b>
    A noSQL backend service for saving, storing, authenticating users
- <b>Shared Preferences</b>
    Persistent storage for simple data
- <b>Flutter and Dart</b>
    And obviously flutter and dart 😅

### Project Description

#### Data
The data layer is the outermost layer of the application and is responsible for communicating with the server-side or a local database and data management logic. It also contains repository implementations.

##### 1. Data Source

Describes the process of acquiring and updating the data.
Consist of remote and local Data Sources. Remote Data Source will perform HTTP requests on the API. At the same time, local Data sources will cache or persist data.
##### 2. Models

An entity will depend on the data acquired from the different data sources.
Serialization of JSON structure into Dart maps Entity objects to Models and vice-versa.
##### 3. Repository

The bridge between the Data layer and the Domain layer.
Actual implementations of the repositories in the Domain layer. Repositories are responsible for coordinating data from the different Data Sources.

<b> But in this project the Domain Layer wasn't use because it could make the project look cumbersome <b>

#### Presentation
The presentation layer is the most framework-dependent layer. It is responsible for all the UI and handling the events in the UI. It does not contain any business logic.

##### a. Widget (Screens/Views)

Widgets notify the events and listen to the states emitted from the Bloc.
##### b. BloC

Receive the events from the views and interact with use cases accordingly.
Emit the state according to the data received from the use cases.
Bloc does not know about the view at all. It communicates in the form of states and events only.

## Folder Structure

<b>The main purpose for this approach is the sole reason of acheiving true seperation of concern
e.g in this project the presentation folder or the UI doesn't have any knowledge of the backend or the state of the data coming from firebase instead it only communicates to the controller to show the different state of the data <b>

```
lib
├───core (bloc observers, validators, widgets)
│   |
│   ├───domain
│   ├───presentation
│   
|
│         
└─── Features (contains the different features of the app)
    ├─── auth (contains all code and folders that handles authentication and also displays the UI to the user through the presentation folder)
    ├─── home (The screen that shows when the user Login/Signup into the app, it displays all the user data)
    ├─── splash(the first screen that shows when the app loads)
|
|
└─── managers (contains navigation handler files, injection service and utils that are mandated for the development of the app)    
|
|─── main.dart
|
└─── firebase_options.dart
```

### Local Setup

- Create a firebase account if not already
- Create a new project in your firebase
- Go to settings and add android to your project
- You have the option of using flutter fire cli or u can download the google-services.json after configuring your platform configurations
- Create a firebase account if not already
- Go to settings and add android to your project.
- Remember the package name you give to your application.
- Download the ```google-services.json``` and place it in ```android/app``` folder.
- Now, in ```android/app/build.gradle``` file change line 37 to your own applicationId which you gave in step 5 above.
- Alternatively you can use the ```FlutterFire Cli``` to automatically configure this settings and file addition. You can check out the FlutterFire CLI on how to install and use it 
- In firebase, enable the ```Firestore Database```, and ```Authentication``` services. In the Authentication service make sure to add Email-Password and Google Auth providers for sign-in and sign-up features to work.
- Run ```flutter pub get```.
- Run ```flutter run``` to run the app in your android emulator/device.

