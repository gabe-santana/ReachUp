import {Entity, Column, PrimaryGeneratedColumn, ManyToOne, JoinColumn, PrimaryColumn} from 'typeorm';
import admType from './admType';
import Local from './Local';

@Entity('administrador')
export default class Administrator {
  @PrimaryColumn()
  email: string;
  @Column()
  name: string;
  @Column()
  password: string;
  @ManyToOne(() => admType, admType => admType.id)
  @JoinColumn({name: 'type_id'})
  type: admType;
  @ManyToOne(() => Local, local => local.id)
  @JoinColumn({name: 'local_id'})
  local: Local;
}