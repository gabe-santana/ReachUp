import {Entity, Column, PrimaryGeneratedColumn, OneToMany, JoinColumn, PrimaryColumn} from 'typeorm';
import SubCategory from './SubCategory';

@Entity('categoria')
export default class Category {
  @PrimaryGeneratedColumn('increment')
  id: number;
  @Column()
  name: string;
  @Column()
  description: string;
  @OneToMany(() => SubCategory, subCategory => subCategory.id, {
    cascade: ['insert', 'update']
  })
  @JoinColumn({name: 'sub_category_id'})
  subcategories: SubCategory[];
  
}