import { BlobService } from "./BlobService";

export module BlobToBase64 {

  export class clsBlobToBase64 extends BlobService.clsBlobService {
    public blob : Blob;
    constructor(){
      super();
    }

    public async handleBlob(){
      this.blob = await this.fetchBlob();
    }

    public async convertFromBlob(){
      this.handleBlob();
      const reader = new FileReader();
      reader.readAsBinaryString(this.blob);
      reader.onloadend = async () => {
        var base64String = reader.result;
        return base64String;
      }
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
      return blob;
    }
  }
}