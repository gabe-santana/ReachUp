$document.ready(function(){

    import { clsReachUpWebAPI } from '..models/ReachUpWebAPI.js';

    export class clsBeaconTypeRepository {
        api = new clsReachUpWebAPI();

        async get()
        {
           const beaconTypes = await this.api.httpGet('BeaconType/Get');
           return beaconTypes;
        }
    } 

})