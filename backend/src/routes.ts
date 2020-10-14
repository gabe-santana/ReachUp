import {Router} from 'express';
import AccountController from './controllers/AccountController';

const routes = Router();

routes.get(`/Account/Login?Email=${email}&Password=${password}&Role=${role}`, AccountController.Login);

export default routes; 