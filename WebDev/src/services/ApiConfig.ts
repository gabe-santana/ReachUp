export module ApiConfig {
  
  export class clsApiConfig {
    private readonly _url : string;
    private readonly _version : string;
    private readonly _license : string;
    private readonly _owner : string;
    private readonly _blobPath : string;

    constructor(){
      this._url = 'http://192.168.0.109:5000/api/';
      this._version = '1.0';
      this._license = 'MIT';
      this._owner = 'cSoft';
      this._blobPath = '';
      }

    public url() {
      return this._url;
    }

    public version() {
      return this._version;
    }

    public license() {
      return this._license;
    }

    public owner() {
      return this._owner;
    }

    public blobPath(){
      return this._blobPath;
    }
  }
}