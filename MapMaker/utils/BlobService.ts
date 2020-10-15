import { ApiConfig } from "../src/services/ApiConfig";
import { ApiConnection } from "../src/services/ApiConnection";

export module BlobService {
  
  export class clsBlobService extends ApiConnection.clsApiConnection {
     constructor(){
        super();
        //const path = new ApiConfig.clsApiConfig().blobPath();
     }

     public async fetchBlob() : Promise<Blob> {
       return await this.httpGetBlob('Map/GetImage', null);
     }

     public async saveBlob(blob : Blob) {
       
     }

     public async putBlob(blob : Blob) {
       return await this.httpPutBlob('Map/PutImage', blob, null);
    }
  }
}