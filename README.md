# ReachUp!

<p>
<img alt="Csharp" src="https://img.shields.io/badge/-C%23-7022DC?style=flat-square&logo=c-sharp&logoColor=white" />
<img alt="DotNetCore" src="https://img.shields.io/badge/-.NET-7022DC?style=flat-square&logo=dot-net&logoColor=white" />
<img alt="JavaScript" src="https://img.shields.io/badge/-JavaScript-e0c050?style=flat-square&logo=javascript&logoColor=white" />
<img alt="TypeScript" src="https://img.shields.io/badge/-TypeScript-007ACC?style=flat-square&logo=typescript&logoColor=white" />
<img alt="Flutter" src="https://img.shields.io/badge/-Flutter-1a202c?style=flat-square&logo=Flutter&logoColor=white" />
<img alt="HTML5" src="https://img.shields.io/badge/-HTML5-E34F26?style=flat-square&logo=HTML5&logoColor=white" />
<img alt="CSS3" src="https://img.shields.io/badge/-CSS3-1572B6?style=flat-square&logo=CSS3&logoColor=white" />
<img alt="MySQL" src="https://img.shields.io/badge/-MySQL-1a202c?style=flat-square&logo=MySQL&logoColor=white" /> 
<img alt="NPM" src="https://img.shields.io/badge/-npm-red?style=flat-square&logo=npm&logoColor=white" />
<img alt="VS Code" src="https://img.shields.io/badge/-Code-1073C9?style=flat-square&logo=visual%20studio%20code&logoColor=white" />
<img src="https://img.shields.io/github/issues/0G4briel/ReachUp">
<img src="https://img.shields.io/github/forks/0G4briel/ReachUp">
<!--![Generated Button](https://raw.githubusercontent.com/0G4briel/ReachUp/image-data/badge.svg)-->
<img src="https://img.shields.io/github/languages/code-size/0G4briel/Reachup">
<img src="https://img.shields.io/github/last-commit/0G4briel/ReachUp">
</p>

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
lost children or any people who just want more agility on a daily basis.

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
6. To make HTTP requests to API: we recommend [Insomnia](https://insomnia.rest/download/)

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

### TypeScript Dev-Dependencies (VS Code Intellisense and Transpilation)

```
 typescript: ^4.0.3
 babel-cli: ^6.26.0
 babel-core: ^6.26.3
 babel-preset-es2015: ^6.24.1
```
### Environment Variables access with JS

```
dotenv: ^8.2.0
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
- [ ] Web Application - design **(on development)**
- [ ] Cross-Platform Mobile App **(main functionality ready)**
- [X] MapMaker - map module **(completed)**

## About Officers Contributors

We're TI students in [Centro Paula Souza](https://www.cps.sp.gov.br) technical schools organization and this projects are our Term Paper that we decided make it open-source!

## Contributing

For now, this project is being developed for a Term Paper, so we are paying more attention to our team and advisors but
later *Pull requests* will be welcome. 

- Fork:
[Fork ReachUp](https://github.com/0G4briel/ReachUp/fork)

- Watch/Follow:
[Watch ReachUp](https://github.com/0G4briel/ReachUp/subscription)

- Create Issues:
[Create Issue in ReachUp](https://github.com/0G4briel/ReachUp/issues/new)

- Approach us on our wiki:
[See our development histories](https://github.com/0G4briel/ReachUp/wiki)

## Our Partnership

We are anxiously waiting for a craft from [Praiamar Shopping](http://www.praiamarshopping.com.br) to record the project working on there, and a lending of the local plants so that everything works correctly. Meanwhile, our database is densely populated with all mall locations, for testing and academic or commercial presentation purposes.

## Contact us

<a target="_blank" href="mailto:csoft.company@gmail.com?subject=[GitHub]">
    <img alt="Gmail badge" src="https://img.shields.io/badge/-csoft.company@gmail.com-D14836?style=flat-square&logo=Gmail&logoColor=white" />
  </a>

## License

- [MIT](https://choosealicense.com/licenses/mit/)

![ReachUp](https://user-images.githubusercontent.com/59267719/93685984-a55cb000-fa89-11ea-9dfe-4a4906088e3a.png)

