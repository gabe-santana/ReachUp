class Beacon {
    UUID;
    BeaconType;
    Local;
     
     constructor(uuid, type = -1, local = -1) {
       this.UUID = uuid;
       this.BeaconType = type;
       this.Local = local;
     }
   }
