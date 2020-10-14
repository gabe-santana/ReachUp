import express from 'express';
import path from 'path';
import cors from 'cors';

import 'express-async-errors';

import databaseConnection from './databaseConnection';
import routes from './routes';
import errorHandler from './errors/handler';

const app = express();
app.use(cors());

app.use(express.json());
const connection = new databaseConnection();
app.use(connection.createConnection);
app.use(routes);
app.use('/uploads', express.static(path.join(__dirname, '..', 'uploads')));
app.use(errorHandler);

app.listen(8000);