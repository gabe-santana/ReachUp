import {Entity, Column, PrimaryGeneratedColumn, OneToMany, JoinColumn, PrimaryColumn} from 'typeorm';

@Entity('preferencia_cliente')
export default class ClientPreferences {
  @PrimaryColumn()
  email: string;
  @Column()
  name: string;
}