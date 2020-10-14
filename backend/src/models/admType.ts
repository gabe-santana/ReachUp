import {Entity, Column, PrimaryGeneratedColumn, OneToMany, JoinColumn, PrimaryColumn} from 'typeorm';
import Administrator from './Administrator';

@Entity('tipo_administrador')
export default class admType {
  @PrimaryGeneratedColumn('increment')
  id: number;
  @Column()
  name: string;
  @OneToMany(() => Administrator, administrator => administrator.email, {
    cascade: ['insert', 'update']
  })
  @JoinColumn({name: 'administrator_id'})
  adms: Administrator[];
}