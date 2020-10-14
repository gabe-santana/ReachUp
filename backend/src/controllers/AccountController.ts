import { Request, Response } from 'express';
import { getRepository } from 'typeorm';
import AccountView from '../views/account_view';
import Client from '../models/Client';
import Administrator from '../models/Administrator';

export default {
  async Login(request: Request, response : Response){
    const {email} = request.params;
    const {name} = request.params;
    const {password} = request.params;
    const client = new Client(email, name, password);
    const accountRepository = getRepository(Client);
    const account = await accountRepository.query(
      'logarUsuario', []);
    return response.json(AccountView.render(account));
  },

};