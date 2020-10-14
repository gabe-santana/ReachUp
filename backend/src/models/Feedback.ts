import {Entity, Column, PrimaryGeneratedColumn, ManyToOne, JoinColumn, PrimaryColumn} from 'typeorm';
import client from './Client';
import feedbackType from './feedbackType';

@Entity('cliente')
export default class Client {
  @PrimaryGeneratedColumn('increment')
  id: number;
  @ManyToOne(() => feedbackType, feedbackType => feedbackType.id)
  @JoinColumn({name: 'type_id'})
  type: feedbackType;
  @ManyToOne(() => client, client => client.email)
  @JoinColumn({name: 'type_id'})
  client: client;
  @Column()
  description: string;
  @Column()
  date: Date;
  @Column()
  starsAmount: number;
}