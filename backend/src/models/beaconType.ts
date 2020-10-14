import {Entity, Column, PrimaryGeneratedColumn, OneToMany, JoinColumn, PrimaryColumn} from 'typeorm';
import Beacon from './Beacon';

@Entity('tipo_beacon')
export default class beaconType {
  @PrimaryGeneratedColumn('increment')
  id: number;
  @Column()
  name: string;
  @OneToMany(() => Beacon, beacon => beacon.uuid, {
    cascade: ['insert', 'update']
  })
  @JoinColumn({name: 'beacon_uuid'})
  beacons: Beacon[];
}