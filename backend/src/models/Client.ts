import {Entity, Column, PrimaryGeneratedColumn, OneToMany, JoinColumn, PrimaryColumn} from 'typeorm';
import Feedback from './Feedback';
import ClientPreferences from './ClientPreferences';


  //createConnection(){};

@Entity('cliente')
export default class Client {
   constructor(email : string, name : string, password : string){
      this.email = email;
      this.name = name;
      this.password = password;
   }
  @PrimaryColumn()
  email: string;
  @Column()
  name: string;
  @Column()
  password: string;
  @OneToMany(() => Feedback, feedback => feedback.id, {
    cascade: ['insert', 'update']
  })
  @JoinColumn({name: 'feedback_id'})
  feedback: Feedback[];
}