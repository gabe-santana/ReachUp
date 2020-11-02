import { BeaconType } from '../Models/BeaconType';
import { Local } from '../Models/Local';

export module Beacon {
   export class clsBeacon {

     public UUID : string;
     public Type : BeaconType.clsBeaconType;
     public Local : Local.clsLocal;
     
     constructor(uuid : string, type : BeaconType.clsBeaconType,
      local : Local.clsLocal) {
       this.UUID = uuid;
       this.Type = type;
       this.Local = local;
     }
   }
}