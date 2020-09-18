# ReachUp!

ReachUp's a mobile application for indoor location, provides blind and visually impaired an interaction experience in the mall, using voice tools the users can search by stores, bathrooms, restaurants and so on. Besides that, the application offers tools for shopkeepers publish their promotions or communicated and mall managers 
receive a user visit reports by the mall.

## How it works?

This application uses BLE Beacons for detect aproximities locates , if you don't understand what beacons are, [checkout](https://kontakt.io/beacon-basics/what-is-a-beacon/). 
The beacons send smalls packages through a bluetooth low energy broadcasting containing the parameters:

- Unique hexadecimal id called by **UUID**;
- **RSSI/TxPower** (required for calculate accuracy distance);
- **Minor/Major** (required for "concept relation" among beacons);

> Behind these beacon features, new features emerge on app/system responsible for guiding the users by location.

## How is it being built?

We're using:

- **MySQL database** for data storage/management;
- **ASP.NET Core 3.0 Web API** for web service (RESTful WebAPI);
- **HTML + CSS/SASS + JQuery** for website;
- **Flutter** for cross-platfor mobile app (Android/iOS);
- **Flame - Flutter Lib (for render a real-time map of local);

## Progress Project

- [x] Database
- [x] WebAPI **(completed, but always on edit and rising)**
- [0] Unity2D Assets **(not anymore)**
- [ ] Web Application **(in progress)**
- [ ] Cross-Platform Mobile App **(in progress)**

## Contributing

For now, this project is being developed for a Term Paper, so we are paying more attention to our team and advisors but
later *Pull requests* will be welcome. 

> **For major changes, please open an issue first to discuss what you would like to change.** 

## License

- [MIT](https://choosealicense.com/licenses/mit/)
