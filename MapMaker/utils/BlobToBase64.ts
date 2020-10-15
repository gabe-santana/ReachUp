import { BlobService } from "./BlobService";
import {Base64Service} from './Base64Service';

export module BlobToBase64 {

  export class clsBlobToBase64 extends BlobService.clsBlobService {
    public blob : Blob;
    constructor(){
      super();
    }

    public async convertFromBlob() {
      this.blob = await this.fetchBlob();
      let base64String = '';
      const reader = new FileReader();
      reader.readAsBinaryString(this.blob);
      reader.onloadend = async () => {
        base64String = reader.result.toString();
      }
      return new Base64Service.clsBase64Service().saveBase64(base64String);
    }

    public async convertToBlob(base64 : string, contentType='', sliceSize = 512) {
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
    }
  }
}