<img src="https://img.shields.io/github/issues/0G4briel/ReachUp">
<img src="https://img.shields.io/github/forks/0G4briel/ReachUp">
<img src="https://img.shields.io/github/directory-file-count/0G4briel/ReachUp">
<img src="https://img.shields.io/github/last-commit/0G4briel/ReachUp">

# ReachUp!


>ReachUp (the end can sounds like "shop") is a mobile application for indoor location, provides blind and visually impaired an interaction experience in the mall, using voice tools the users can search by stores, bathrooms, restaurants and so on. Besides that, the application offers tools for shopkeepers publish their promotions or communicated and mall managers 
>receive a user visit reports by the mall.


## How it works?

This application uses BLE Beacons for detect aproximities locates , if you don't understand what beacons are, [checkout](https://kontakt.io/beacon-basics/what-is-a-beacon/). 
The beacons send smalls packages through a bluetooth low energy broadcasting containing the parameters:

- Unique hexadecimal id called by **UUID**;
- **RSSI/TxPower** (required for calculate accuracy distance);
- **Minor/Major** (required for "concept relation" among beacons);

> Behind these beacon features, new features emerge on app/system responsible for guiding the users by location.

## How does it affect people's lives?

Many people go to the mall for any reason, thinking on it, ReachUp helps these people with offering a lot of indoor mapping features, not only useful for 
blind and visually impaired users, but for anyone that need help to get to a place faster like wheelchair, hearing impaired, olders, 
lost children and people like me who just want more agility on a daily basis.

![anglais-chiffres-TOP](https://user-images.githubusercontent.com/59267719/93686508-1487d380-fa8d-11ea-9b3a-a8523c20918a.png)

# Installation

## For users

> For now, haven't any network structure in the web for hosting databases and web services, come back later 🤚

***ReachUp will be available for Android and iOS platform!***	

## For developers

1. [MySQL Server](https://www.mysql.com/downloads/)
2. [.NET Services (We recommend Visual Studio too)](https://dotnet.microsoft.com/download)
3. You will need a package manager, we recommeend: [NPM (Node.js)](https://nodejs.org/en/download/), [Yarn](https://classic.yarnpkg.com/en/docs/install/#windows-stable) or 
[Chocolatey](https://chocolatey.org)
4. [Flutter Framework](https://flutter.dev/docs/get-started/install)
5. Babel - for transpilation of TypeScript  to JavaScript [Install and config](https://ccoenraets.github.io/es6-tutorial/setup-babel),
[Transpile all](https://babeljs.io/docs/en/babel-parser)

> Make sure you have all dependencies for Android [Android Studio](https://developer.android.com/studio) and iOS [XCode](https://developer.apple.com/xcode/) that will be 
necessary to installation step 4. 


### WebAPI ASP.NET Core 3.0 Dependencies

```
dotnet add package JWT --version 7.2.2
dotnet add package Microsoft.AspNetCore.Server.Kestrel --version 2.2.0
```


### Flutter Dependencies

```
dependencies:
  flutter:
    sdk: flutter
  dio: ^3.0.8
  mobx: ^0.4.0
  flutter_mobx: ^0.3.4
  provider: ^4.0.1
  path_provider: ^1.5.0
  font_awesome_flutter:  ^8.8.1
  flutter_beacon: ^0.3.0
  http: ^0.12.0+2
```
# Developing Info

## How is it being built?

We're using:

- **MySQL Database: MySQL Workbench** for data storage/management;
- **NoSQL (non-relational database)** for local data storage/management in Flutter App;
- **ASP.NET Core 3.0 MVC Web API** for web services (RESTful WebAPI);
- **ASP.NET Core 3.0 MVC Web Application**: C#/Razor (Backend)\ HTML + CSS + JavaScript + Bootstrap (Frontend);
- **Flutter: Dart + Java + Objective-C** for cross-platfor mobile app (Android/iOS);
- **Flame: Flutter Lib** for render a real-time map of local;
- **TS + JS MVC MapMaker Web Application**: HTML + CSS + JavaScript (Frontend) \ TypeScript (Backend).

## Project Progress

- [x] Database **(completed, but always on edit and rising)**
- [x] WebAPI **(completed, but always on edit and rising)**
- [ ] Web Application - coding **(idling)**
- [ ] Web Application - design **(on God's hands)**
- [ ] Cross-Platform Mobile App **(main functionality almost ready)**
- [X] MapMaker - for the developers **(debug errors)**

## About Officers Contributors

We're TI students in [Centro Paula Souza](https://www.cps.sp.gov.br) technical schools organization and this projects are our Term Paper that we decided make it open-source!

## Contributing

For now, this project is being developed for a Term Paper, so we are paying more attention to our team and advisors but
later *Pull requests* will be welcome. 

- Fork:
[Fork ReachUp](https://github.com/0G4briel/ReachUp/fork)

- Watch/ Follow:
[Watch ReachUp](https://github.com/0G4briel/ReachUp/subscription)

- Create Issues:
[Create Issue in ReachUp](https://github.com/0G4briel/ReachUp/issues/new)

## Our Partnership

We are anxiously waiting for a craft from [Praiamar Shopping](http://www.praiamarshopping.com.br) to record the project working on there, and a lending of the local plants so that everything works correctly. Meanwhile, our database is densely populated with all mall locations, for testing and academic or commercial presentation purposes.

## License

- [MIT](https://choosealicense.com/licenses/mit/)

![ReachUp](https://user-images.githubusercontent.com/59267719/93685984-a55cb000-fa89-11ea-9dfe-4a4906088e3a.png)

