import {Entity, Column, PrimaryGeneratedColumn, OneToMany, JoinColumn, PrimaryColumn} from 'typeorm';
import Feedback from './Feedback';

@Entity('tipo_feedback')
export default class feedbackType {
  @PrimaryGeneratedColumn('increment')
  id: number;
  @Column()
  name: string;
  @OneToMany(() => Feedback, feedback => feedback.id, {
    cascade: ['insert', 'update']
  })
  @JoinColumn({name: 'feedback_id'})
  feedbacks: Feedback[];
}