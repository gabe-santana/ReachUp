export module UserToken {

  export abstract class clsUser {
     public abstract getToken() : any;
     public abstract setToken(token: string) : any;
     public async todo(){};
  }

    export class clsUserToken extends clsUser {
         constructor(){
             super();
         }

         getToken(){
             const token = localStorage.getItem('token');
             if (token != null){
               return token;
             }
         }

         setToken(token : string){
             try{
                 localStorage.setItem('token', token);
             }
             catch{
                 return null;
             }
         }
     }
}

