import { ApiConfig } from "../src/services/ApiConfig";
import { ApiConnection } from "../src/services/ApiConnection";

export module Blob {
  
  export class clsBlob extends ApiConnection.clsApiConnection {
     constructor(){
        super();
        //const path = new ApiConfig.clsApiConfig().blobPath();
     }

     public async fetchBlob() : Promise<Blob> {
       return await this.httpGetBlob('Blob/Get', null);
     }

     public async putBlob(blob : Blob) {
       return await this.httpPutBlob('Blob/Put', blob, null);
    }
  }
}