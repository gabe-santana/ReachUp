$document.ready(function(){

    import { clsReachUpWebAPI } from '..models/ReachUpWebAPI.js';

    export class clsBeaconRepository {
        api = new clsReachUpWebAPI();

        async getAll(type)
        {
           const beacons = await this.api.httpGet('Beacon/GetAll?Type=' + type);
           return beacons;
        }

        async get(uuid)
        {
            const beacons = await this.api.httpGet('Beacon/Get?UUID=' + uuid);
            return beacons;
        }

        async post(beacon)
        {
           const httpStatus = await this.api.httpPost('Beacon/Post');
           return httpStatus;
        }

        async patch(beacon)
        {
           const httpStatus = await this.api.httpPatch('Beacon/Patch');
           return httpStatus;
        }

        async delete(uuid)
        {
           const httpStatus = await this.api.httpDelete('Beacon/Delete?UUID=' + uuid);
           return httpStatus;
        }

    } 

})