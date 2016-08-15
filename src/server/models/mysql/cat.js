'use strict';

import MySQL from './mysql';
import Image from './image';

export default class Cat extends MySQL {
    constructor(args) {
        const {
            id,
            color_id,
            breed_id,
            mother_id,
            father_id,
            gender,
            owner_id,
            breeder_id,
            name,
            date_of_birth,
            hidden,
            is_for_sale,
            is_my_star,
            video_id,
            show_pedigree,
            is_new_born,
            pedigree_number,
            my_star_rank,
            for_sale_rank,
            new_born_rank,
            title_id,
            rank,
            ...other
        } = args;

        super(other);

        this.id = id;
        this.colorId = color_id;
        this.breedId = breed_id;
        this.motherId = mother_id;
        this.fatherId = father_id;
        this.gender = gender;
        this.ownerId = owner_id;
        this.breederId = breeder_id;
        this.name = name;
        this.dateOfBirth = date_of_birth;
        this.hidden = hidden;
        this.isForSale = is_for_sale;
        this.isMyStar = is_my_star;
        this.videoId = video_id;
        this.showPedigree = show_pedigree;
        this.isNewBorn = is_new_born;
        this.pedigreeNumber = pedigree_number;
        this.myStarRank = my_star_rank;
        this.forSaleRank = for_sale_rank;
        this.newBornRank = new_born_rank;
        this.titleId = title_id;
        this.rank = rank;
        this.images = [];
    }

    static load(id) {
        return new Promise((resolve, reject) => {
            const connection = Cat.getConnection();
            connection.query("SELECT * FROM cats WHERE id=?", [id], function(err, rows, fields){
                if (rows.length > 1) {
                    Cat.warnMultipleColumnsInSelect(arguments);
                }
                resolve( new Cat(rows[0]) );
            });
        });
    }

    static loadCatsForSale(){
        const cats = [];
        return new Promise((resolve, reject) => {
            const connection = Cat.getConnection();
            connection.query(`
                SELECT * 
                FROM cats 
                WHERE is_for_sale = 'y'`,
                (err, rows, fields) => {
                    rows.forEach((row) => {
                        const cat = new Cat(row);
                        cats.push(cat.initDependencies());
                    });
                    Promise.all(cats).then(catsForSale => {
                        resolve(catsForSale);
                    });
                }
            );
        });
    }

    initDependencies() {
        return new Promise((resolve, reject) => {
            const promises = [
                Image.getImagesForCat(this.id)
            ];

            Promise.all(promises).then( values => {
                this.images = values[0];
                resolve(this);
            });
        });
    }
}
