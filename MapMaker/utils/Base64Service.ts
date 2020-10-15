import { createWriteStream } from 'fs';
import {readFile} from 'fs';
import { read, writeFile, } from 'fs/promises';
import { BlobToBase64 } from './blobToBase64';

export module Base64Service {

  export class clsBase64Service extends BlobToBase64.clsBlobToBase64 {
    protected readonly _path : string;
    constructor(){
       super();
       this._path = './src/files/base64';
    }

    public saveBase64(base64 : string | Uint8Array) {
      /*return await writeFile(
        `${this._path}/base64.txt`, 
        base64, 
        { encoding: 'base64', }
      );*/

      let writeStream = createWriteStream(`${this._path}/base64.txt`);
      writeStream.write(base64, 'base64');
      writeStream.on('finish', () => {
        console.log('wrote all data to file');
      });
      writeStream.end;
   }

   public getBase64() {
    readFile(`${this._path}/base64.txt`, 'base64', (err, data) => {
      if (err){
        return false;
      }
      return this.convertToBlob(data);
    });
   }
 }
}