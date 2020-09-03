ReachUp!
Term paper: Mobile application for indoor location provides blind and visually impaired an interaction experience in the mall, using voice tools for search by stores, bathrooms, restaurants and so on.

How it works?
This application uses BLE Beacons for detect aproximities locates , if you don't understand what beacons are, checkout https://kontakt.io/beacon-basics/what-is-a-beacon/ The beacons send smalls packages through a bluetooth low energy broadcasting containing a unique hexadecimal id called by UUUID and RSSI/TxPower (required for calculate accuracy distance).

behind these beacon functionalities, there are specifics functionalities responsible for guiding the users by location.

How it was build
We use MySQL database for data storage, ASP.NET Core 3.0 Web API for web service, and clients were build in php system (website) and flutter app (Android/iOS)