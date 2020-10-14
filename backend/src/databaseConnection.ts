import 'reflect-metadata';
import {createConnection} from 'typeorm';

export default class databaseConnection {
  createConnection(){
    type: 'mysql',
    host: 'localhost',
    port: 3306,
    username: 'root',
    password: 'root',
    database: 'mysql',
    synchronize: true,
    logging: false,
  }
}