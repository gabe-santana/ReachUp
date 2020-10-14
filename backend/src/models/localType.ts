import {Entity, Column, PrimaryGeneratedColumn, OneToMany, JoinColumn, PrimaryColumn} from 'typeorm';
import Local from './Local';

@Entity('tipo_local')
export default class localType {
  @PrimaryGeneratedColumn('increment')
  id: number;
  @Column()
  name: string;
  @OneToMany(() => Local, local => local.id, {
    cascade: ['insert', 'update']
  })
  @JoinColumn({name: 'local_id'})
  local: Local[];
}