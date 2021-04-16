# flutter_bloc_boilerplate

**语言: [英语](README.md), 中文 (这个文件).**

## 介绍

在我学习Flutter期间，我一直使用的是flutter_bloc状态管理框架，于是想一边学习一边写一个flutter_bloc的Starter项目，不仅可以帮助自己学习，也可以帮助他人快速搭建框架。搭建这个框架之前我搜索了很多类似的框架，发现都比较简单，没有一个涵盖项目该有的通用的东西，于是萌发了自己写一个的想法。下面让我逐一介绍。

## 技术 & 项目介绍

使用Flutter 2.x搭建的一套包含预定义的文件夹结构、样式主题、API访问、状态管理、路由 & 依赖等的框架。项目结构清晰，可以很方便的作为Flutter的模板项目来使用。使用技术包括但不限于[Flutter](https://flutter.cn/)、[Dart](https://dart.dev/)、[flutter_bloc](https://pub.dev/packages/flutter_bloc)等。

<p align='center'>
    <img src="https://github.com/KevinZhang19870314/flutter_bloc_boilerplate/blob/master/assets/screenshot/2.jpg" width="187" heght="333" />
    <img src="https://github.com/KevinZhang19870314/flutter_bloc_boilerplate/blob/master/assets/screenshot/3.jpg" width="187" heght="333" />
    <img src="https://github.com/KevinZhang19870314/flutter_bloc_boilerplate/blob/master/assets/screenshot/4.jpg" width="187" heght="333" />
    <img src="https://github.com/KevinZhang19870314/flutter_bloc_boilerplate/blob/master/assets/screenshot/5.jpg" width="187" heght="333" />
    <img src="https://github.com/KevinZhang19870314/flutter_bloc_boilerplate/blob/master/assets/screenshot/6.jpg" width="187" heght="333" />
</p>

## 安装 & 使用

**Step 1:**

Fork本项目到自己的仓库：

```
git clone https://github.com/KevinZhang19870314/flutter_bloc_boilerplate.git
```

**Step 2:**

用VS Code打开项目文件夹，执行以下命令安装依赖包：

```
flutter pub get
```

**Step 3:**

打开lib文件夹下的main.dart文件，F5 或者 Ctrl + F5运行项目，然后就可以开始开发调试了。

## 文件夹结构

下面是项目文件夹结构(只介绍lib下面的文件夹)

```
lib/
|- api - 全局Restful api请求，包括请求拦截器等
   |- interceptor - 拦截器，包括request、response、err拦截
   |- api.dart - Restful api导出文件
|- blocs - BLoC处理业务逻辑
   |- auth - auth模块处理登录&注册等业务逻辑
   |- home - home模块加载用户信息等
   |- blocs.dart - BLoC导出文件
|- models - 各种结构化实体类，分为request和response两种类型的实体
   |- models.dart - 实体类导出文件
|- modules - 业务模块文件夹
   |- auth - 登录&注册模块
   |- home - 首页模块
   |- splash - splash模块
   |- modules.dart - 模块导出文件
|- routes - 路由模块
   |- modules - 每个模块的路由配置信息
      |- i_app_route.dart - 抽象路由类
   |- app_routes.dart - 路由名称
   |- app_routes_factory.dart - 路由工厂类，处理各种模块路由配置
   |- route_path.dart - 路由名称静态类
   |- routes.dart - 路由导出文件
|- Shared - 全局共享文件夹，包括静态变量、全局services、utils、全局Widget等
   |- shared.dart - 全局共享导出文件
|- theme - 主题文件夹
|- app.dart - 全局app文件
|- main.dart - main入口文件
```

## 其他

在编写过程中，因为涉及到Restful api的调用，这里我使用了[REQ|RES](https://reqres.in/)提供的免费测试api。

测试使用的用户如下:
  
    邮箱: "eve.holt@reqres.in",
    密码: "pistol"