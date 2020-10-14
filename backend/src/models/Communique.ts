import {Entity, Column, PrimaryGeneratedColumn, ManyToOne, JoinColumn, PrimaryColumn} from 'typeorm';
import Local from './Local';
import CommuniqueType from './communiqueType';

@Entity('comunicado')
export default class Communique {
  @PrimaryGeneratedColumn('increment')
  id: number;
  @ManyToOne(() => Local, local => local.id)
  @JoinColumn({name: 'local_id'})
  local: Local;
  @ManyToOne(() => CommuniqueType, CommuniqueType => CommuniqueType.id)
  @JoinColumn({name: 'tpye_id'})
  type: CommuniqueType;
  @Column()
  description: string;
  @Column()
  start_date: Date;
  @Column()
  finish_date: Date;
}