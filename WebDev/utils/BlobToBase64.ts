import { BlobService } from "./BlobService";
import {Base64Service} from './Base64Service';
import { readFileSync } from "fs";
import { writeFile } from "fs/promises";

export module BlobToBase64 {

  export class clsBlobToBase64 extends BlobService.clsBlobService {
    public blob : Blob;
    constructor(){
      super();
    }

     // Converte um arquivo blob para string base64
    /*public async convertFromBlob() {
      this.blob = await this.fetchBlob();
      let base64String = '';
      const reader = new FileReader();
      reader.readAsBinaryString(this.blob);
      reader.onloadend = async () => {
        base64String = reader.result.toString();
      }
      return new Base64Service.clsBase64Service().saveBase64(base64String);
    }*/

    // Converte uma imagem (como png) diretamente para string base64
    public async convertFromBlob() {
      //this.blob = await this.fetchBlob();
      var bitmap = readFileSync(`../src/files/images/imageToEncode.jpg`);
      return new Base64Service.clsBase64Service().saveBase64(
        Buffer.from(bitmap).toString('base64'));
    }


    // Converte string base64 para blob
    /*public async convertToBlob(base64 : string, contentType='', sliceSize = 512) {
      const byteCharacters = atob(base64);
      const byteArrays = [];

      for (let offset = 0; offset < byteCharacters.length; offset += sliceSize) {
        const slice = byteCharacters.slice(offset, offset + sliceSize);

        const byteNumbers = new Array(slice.length);
        for (let i = 0; i < slice.length; i++) {
          byteNumbers[i] = slice.charCodeAt(i);
        }

        const byteArray = new Uint32Array(byteNumbers);
        byteArrays.push(byteArray);
      }

      const blob = new Blob(byteArrays, {type: contentType});
      return await this.putBlob(blob);
    }*/

    // Converte uma string base64 diretamente para uma imagem (como png)
    public async convertToBlob(base64 : string){
      let image = base64.split(';base64,').pop();
      writeFile(
        `./src/files/images/image.png`, 
        image, 
        {encoding: 'base64'},
      )
    }
  }
}