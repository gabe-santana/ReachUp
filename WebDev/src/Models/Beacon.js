class Beacon {
    UUID;
    Type;
    BeaconLocal;
     
     constructor(uuid, type = -1, beaconLocal = {}) {
       this.UUID = uuid;
       this.Type = type;
       this.BeaconLocal = beaconLocal;
     }
   }
