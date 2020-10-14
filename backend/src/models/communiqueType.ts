import {Entity, Column, PrimaryGeneratedColumn, OneToMany, JoinColumn, PrimaryColumn} from 'typeorm';
import Communique from './Communique';

@Entity('tipo_feedback')
export default class feedbackType {
  @PrimaryGeneratedColumn('increment')
  id: number;
  @Column()
  name: string;
  @OneToMany(() => Communique, communique => communique.id, {
    cascade: ['insert', 'update']
  })
  @JoinColumn({name: 'feedback_id'})
  communiques: Communique[];
}