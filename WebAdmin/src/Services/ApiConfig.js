class clsApiConfig {
      _url;
      _version;
      _license;
       _owner;
  
      constructor(){
        this._url = 'http://localhost:5000/api/';
        this._version = '1.0';
        this._license = 'MIT';
        this._owner = 'cSoft';
        this._blobPath = '';
        }
  
       url() {
        return this._url;
      }
  
      version() {
        return this._version;
      }
  
       license() {
        return this._license;
      }
  
      owner() {
        return this._owner;
      }
    }