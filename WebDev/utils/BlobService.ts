import { ApiConnection } from "../src/services/ApiConnection";
import {readFile} from 'fs';
import { writeFile } from 'fs/promises';

export module BlobService {
  
  export class clsBlobService extends ApiConnection.clsApiConnection {
     constructor(){
        super();
     }

     public async fetchBlob() {
       return await this.httpGetBlob('Map/GetImage', null);
     }

     public async putBlob(blob : Blob) {
       return await this.httpPutBlob('Map/PutImage', blob, null);
    }
  }
}