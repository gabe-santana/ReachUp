/// <reference path='../Models/MallPlan.ts'/>

import { MallPlan } from "../Models/MallPlan";

export module MallPlanController {

    export class clsMallPlanController extends MallPlan.clsMallPlan {
         constructor(){
           super();
         }
        
         public async getMap() {
            return await this.get();
         }

         public async putMap()
         {
            return await this.put();
         }

         
         public async getMapImages()
         {
            return await this.getImages();
         }

         public async getFloor(floor : number)
         {
            return await this.getFloorImage(floor);
         }
     }
}