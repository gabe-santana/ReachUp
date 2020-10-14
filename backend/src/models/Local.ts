import {Entity, Column, PrimaryGeneratedColumn, ManyToOne, OneToMany, JoinColumn, PrimaryColumn} from 'typeorm';
import localType from './localType';
import Administrator from './Administrator';
import Beacon from './Beacon';

@Entity('local')
export default class Local {
  @PrimaryGeneratedColumn('increment')
  id: number;
  @ManyToOne(() => localType, localType => localType.id)
  @JoinColumn({name: 'type_id'})
  type: localType;
  @Column()
  name: string;
  @Column()
  floor: number;
  @Column()
  open: string;
  @Column()
  close: string;
  @OneToMany(() => Administrator, administrator => administrator.email, {
    cascade: ['insert', 'update']
  })
  @JoinColumn({name: 'adm_email'})
  adms: Administrator[];
  @OneToMany(() => Beacon, beacon => beacon.uuid, {
    cascade: ['insert', 'update']
  })
  @JoinColumn({name: 'beacon_uuid'})
  beacons: Beacon[];
  
}