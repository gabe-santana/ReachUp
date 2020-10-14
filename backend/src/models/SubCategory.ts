import {Entity, Column, PrimaryGeneratedColumn, ManyToOne, JoinColumn, PrimaryColumn} from 'typeorm';
import Category from './Category';

@Entity('sub_categoria')
export default class SubCategory {
  @PrimaryGeneratedColumn('increment')
  id: number;
  @ManyToOne(() => Category, category => category.id)
  @JoinColumn({name: 'category_id'})
    category: Category;
  @Column()
  name: string;
}