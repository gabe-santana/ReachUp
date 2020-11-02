import { Admin } from '../Models/Admin';
import { Beacon } from '../Models/Beacon';

export module Local {
  export class clsLocal {

    public id : number;
    public type : number;
    public name : string;
    public floor : number;
    public admins : Array<Admin.clsAdmin>;
    public beacons : Array<Beacon.clsBeacon>;

    constructor(id : number, type: number, name : string, floor : number,
     admins: null, beacons : null ){
      this.id = id;
      this.type = type;
      this.name = name;
      this.floor = floor;
      this.admins = new Array<Admin.clsAdmin>();
      this.beacons = new Array<Beacon.clsBeacon>();
    }
  }
}
