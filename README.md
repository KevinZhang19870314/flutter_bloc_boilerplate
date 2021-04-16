# flutter_bloc_boilerplate

**Language: English (this file), [Chinese](README.zh-cn.md).**

## Introduction

During my study of Flutter, I have been using the flutter_bloc state management framework, so I want to write a flutter_bloc Starter project while learning, which can not only help myself learn, but also help others to quickly build the framework. Before building this framework, I searched many similar frameworks, and found that they were relatively simple, and none of them covered the common things that the project should have, so I sprouted the idea of ​​writing one by myself. Let me introduce them one by one below.

## Technology & Project Introduction

Use Flutter 2.x to build a set of frameworks containing predefined folder structure, style themes, API access, state management, routing & dependencies, etc. The project structure is clear, and it can be easily used as a Flutter template project. Technologies used include but are not limited to [Flutter](https://flutter.cn/), [Dart](https://dart.dev/), [flutter_bloc](https://pub.dev/packages/flutter_bloc) Wait.

<p align='center'>
    <img src="https://github.com/KevinZhang19870314/flutter_bloc_boilerplate/blob/main/assets/screenshot/2.jpg" width="187" heght="333" />
    <img src="https://github.com/KevinZhang19870314/flutter_bloc_boilerplate/blob/main/assets/screenshot/3.jpg" width="187" heght="333" />
    <img src="https://github.com/KevinZhang19870314/flutter_bloc_boilerplate/blob/main/assets/screenshot/4.jpg" width="187" heght="333" />
    <img src="https://github.com/KevinZhang19870314/flutter_bloc_boilerplate/blob/main/assets/screenshot/5.jpg" width="187" heght="333" />
    <img src="https://github.com/KevinZhang19870314/flutter_bloc_boilerplate/blob/main/assets/screenshot/6.jpg" width="187" heght="333" />
</p>

## Installation & Use

**Step 1:**

Fork this project to your own warehouse:

```
git clone https://github.com/KevinZhang19870314/flutter_bloc_boilerplate.git
```

**Step 2:**

Open the project folder with VS Code and execute the following command to install the dependency package:

```
flutter pub get
```

**Step 3:**

Open the main.dart file in the lib folder, F5 or Ctrl + F5 to run the project, and then you can start developing and debugging.

## Folder structure

The following is the project folder structure (only the folders under lib are introduced)

```
lib/
|- api-Global Restful api requests, including request interceptors, etc.
   |- interceptor - interceptor, including request, response, err interception
   |- api.dart - Restful api export file
|- blocs-BLoC handles business logic
   |- auth - The auth module handles business logic such as login & registration
   |- home - home module loads user information, etc.
   |- blocs.dart - BLoC export file
|- models - Various structured entity classes, divided into request and response entities
   |- models.dart - entity class export file
|- modules - business module folder
   |- auth - Login & Registration Module
   |- home - Home module
   |- splash - splash module
   |- modules.dart - module export file
|- routes - routing module 
   |- modules - routing configuration information for each module
      |- i_app_route.dart - abstract routing class
   |- app_routes.dart - route name
   |- app_routes_factory.dart - routing factory class, processing various module routing configuration
   |- route_path.dart - route name static class
   |- routes.dart - route export file
|- Shared-Global shared folders, including static variables, global services, utils, global Widgets, etc.
   |- shared.dart - global shared export file
|- theme - theme folder
|- app.dart - global app file
|- main.dart - main entry file
```

## Other

In the writing process, because it involves the call of Restful api, here I used the free test api provided by [REQ|RES](https://reqres.in/).

The users used in the test are as follows:
  
    Email: "eve.holt@reqres.in",
    Password: "pistol"