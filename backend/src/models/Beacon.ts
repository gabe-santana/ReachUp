import {Entity, Column, PrimaryGeneratedColumn, ManyToOne, JoinColumn, PrimaryColumn} from 'typeorm';
import beaconType from './beaconType';
import Local from './Local';

@Entity('beacon')
export default class Beacon {
  @PrimaryColumn()
  uuid: string;
  @ManyToOne(() => beaconType, beaconType => beaconType.id)
  @JoinColumn({name: 'type_id'})
  type: beaconType;
  @ManyToOne(() => Local, local => local.id)
  @JoinColumn({name: 'local_id'})
  local : Local;
}