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

    // Salva string Base64 em txt
    public saveBase64(base64 : string | Uint8Array) {
      /*return await writeFile(
        `${this._path}/base64.txt`, 
        base64, 
        { encoding: 'base64', }
      );*/
      var date = new Date(),
          year = date.getFullYear(),
          month = date.getMonth(),
          day = date.getUTCDate(),
          hour = date.getHours(),
          minute = date.getMinutes(),
          second = date.getSeconds();

      let writeStream = createWriteStream(
        `${this._path}/base64-generated-on-date-${year}${month}${day}on-time-${hour}:${minute}:${second}.txt`);
      writeStream.write(base64, 'base64');
      writeStream.on('finish', () => {
        console.log('wrote all data to file');
      });
      writeStream.end;
   }

   // Pega arquivo txt com string base64
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