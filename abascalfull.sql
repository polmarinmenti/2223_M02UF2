DROP TABLE IF EXISTS characters_weapons;
DROP TABLE IF EXISTS characters_armours;
DROP TABLE IF EXISTS characters_items;
DROP TABLE IF EXISTS weapons_materials;
DROP TABLE IF EXISTS armours_materials;
DROP TABLE IF EXISTS items;
DROP TABLE IF EXISTS armours;
DROP TABLE IF EXISTS weapons;
DROP TABLE IF EXISTS items_types;
DROP TABLE IF EXISTS weapons_types;
DROP TABLE IF EXISTS armours_types;
DROP TABLE IF EXISTS materials;
DROP TABLE IF EXISTS stats;
DROP TABLE IF EXISTS characters;


CREATE TABLE characters(
   	 id_character INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
   	 name VARCHAR(32),
   	 age INT UNSIGNED,
   	 race VARCHAR(16),
  	 gender CHAR(1),
  	 class VARCHAR(16),
  	 height FLOAT,
 	 weight FLOAT,
 	 origin TEXT,
 	 description TEXT
);

INSERT INTO characters (name,age,race,gender,class,height,weight,origin) 
VALUES 	("Payoh",64,"Cambiapieles","L","Dictador",1.75,80,"RUM"),
	("Yuca",27,"Sirenido","F","Cryptolay",1,40,"PUR"),
	("Yulen",104,"No-muerto","D","Minero",0.85,25,"NDE"),
	("Josema",3000,"Deidad","T","Procrastinador",3,"0","PER");

CREATE TABLE stats(
   	 id_stat INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
   	 agility FLOAT,
   	 hp FLOAT,
   	 hp_max INT,
   	 xp FLOAT,
   	 xp_max INT,
   	 mp FLOAT,
   	 mp_max INT,	
   	 `level` INT,
   	 physic_attack FLOAT,
   	 physic_defense FLOAT,
   	 magic_attack FLOAT,
   	 magic_defense FLOAT,
   	 stamina FLOAT,
   	 stamina_max INT,
   	 intel INT,
   	 stealth INT,
   	 luck INT,
   	 faith INT,
   	 velocity INT,
   	 dexterity INT,
   	 strenght INT,
    	 tenacity INT,
   	 vigor INT,
   	 charisma INT,
   	 critical_rate INT,
   	 id_character INT UNSIGNED,FOREIGN KEY (id_character) REFERENCES characters (id_character)
);

INSERT INTO stats (agility,hp,hp_max,xp,xp_max,mp,mp_max,`level`,physic_attack,physic_defense,magic_attack,magic_defense,stamina,stamina_max,intel,stealth,luck,faith,velocity,dexterity,strenght,tenacity,vigor,charisma,critical_rate,id_character)
VALUES 	(900,950,0,820,0,300,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1),
	(75,0,0,500,0,700,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,3),
	(1000,1000,0,999,0,1000,0,69,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4),
	(200,600,0,150,0,750,0,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2);

CREATE TABLE materials (
	id_material INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	material CHAR (16),
	color CHAR (6),
	cost FLOAT
);

INSERT INTO materials (material,color,cost) 
VALUES 	("Obsidiana","000000",40),
	("Carne","ffff00",10),
	("Pana","ffdddd",50),
	("Goma sagrada","ffffff",1000),
	("Metal","cccccc",1),
	("Cuero","ddddaa",20),
	("Madera","dddaa",10),
	("Plumas de angel","ffffff",10000),
	("Materia oscura","000000",40),
	("Hueso","cccccc",10);

CREATE TABLE armours_types (
	id_armour_type INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	type VARCHAR(24),
	description TEXT,
	icon VARCHAR(16)
);

INSERT INTO armours_types (type) VALUES ("Heavy"),("Light"),("Medium");

CREATE TABLE weapons_types (
	id_weapon_type INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	type VARCHAR(24),
	descritiopn TEXT,
	icon VARCHAR(16)
    );
INSERT INTO weapons_types (type) VALUES ("Melee"),("Ranged");

CREATE TABLE items_types (
	id_item_type INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	type VARCHAR(24),
	description TEXT,
	icon VARCHAR(24)
);
INSERT INTO items_types (type) VALUES ("Washing material"),("Potion"),("Valuable"),("Artifact");

CREATE TABLE items (
	id_item INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	item VARCHAR(24),
    	cost FLOAT,
    	`key` BOOLEAN,
  	rarity INT,
   	weight FLOAT,
   	height FLOAT,
   	width FLOAT,
    	durability INT,
    	description TEXT,
   	dissassemble BOOLEAN,
   	fusionable BOOLEAN,
  	id_item_type INT UNSIGNED,
  	FOREIGN KEY (id_item_type) REFERENCES items_types (id_item_type)
    );

INSERT INTO items (item, cost,`key`,rarity,weight,height,width,durability,dissassemble,fusionable,id_item_type) 
VALUES 	("Omas Eife",50,1,700,5,1,2,5,0,1,1),
	("Healing Potion",150,0,80,5.5,2,4,2,1,1,2),
	("Black Pearl",800,0,600,10,2,2,100,0,0,3),
	("Mana Potion",175,0,90,5.5,2,4,2,1,1,2),
	("White Pearl",500,0,500,10,2,2,100,0,0,3),
	("Bandera de ESPAÑA",0,1,999999999,70,100,75,999999999,1,0,4);

CREATE TABLE weapons (
    	id_weapon INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,	
	weapon VARCHAR(24), 	
	grip INT,
	durability INT,
	distance FLOAT, 		
	quality INT,
	physic_defense FLOAT,
	physic_attack FLOAT,
	magic_attack FLOAT,
	magic_defense FLOAT,
	level_min INT,
	`level` INT,
	desciption TEXT,
	id_weapon_type INT UNSIGNED,
    	FOREIGN KEY (id_weapon_type) REFERENCES weapons_types (id_weapon_type)
);

INSERT INTO weapons (weapon,grip,durability,distance,quality,physic_defense,physic_attack,magic_attack,magic_defense,level_min,`level`,id_weapon_type) 
VALUES 	("Gratesword",2,400,10,150,80,200,0,0,2,2,1),
	("Sword",1,300,5,100,50,100,0,0,1,1,1),
	("Magic wand",1,300,120,100,0,25,75,30,1,1,2);

CREATE TABLE armours (
	id_armour INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
	armour VARCHAR(24),
	durability FLOAT,
	quality INT,
	magic_defense FLOAT,
	physic_defense FLOAT,
	magic_attack FLOAT,
	physic_attack FLOAT,
	hp_max INT,
	`level` INT,
	level_min INT,
	description TEXT,
	id_armour_type INT UNSIGNED,
	FOREIGN KEY (id_armour_type) REFERENCES armours_types (id_armour_type)
);

INSERT INTO armours (armour, durability,quality,magic_defense,physic_defense,magic_attack,physic_attack,hp_max,`level`,level_min,id_armour_type) 
VALUES 	("Chain armour",300,200,0,150,0,0,0,1,1,1),
	("Lether armour",200,50,0,50,0,0,0,1,1,2),
	("Half-plate magic armour",500,350,75,200,0,0,40,12,10,3);

CREATE TABLE weapons_materials (
  	  id_weapons_materials INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
  	  id_weapon INT UNSIGNED,
  	  id_material INT UNSIGNED,
  	  FOREIGN KEY (id_material) REFERENCES materials(id_material),
  	  FOREIGN KEY (id_weapon) REFERENCES weapons(id_weapon)
);
INSERT INTO weapons_materials (id_weapon,id_material) 
VALUES 	(1,5),
	(1,6),
	(1,3),
	(2,5),
	(2,7),
	(2,6),
	(3,7),
	(3,9);


CREATE TABLE characters_weapons (
    	id_character_weapon INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    	id_character INT UNSIGNED,
    	id_weapon INT UNSIGNED,
    	FOREIGN KEY (id_weapon) REFERENCES weapons (id_weapon),
    	FOREIGN KEY (id_character) REFERENCES characters (id_character)
);
CREATE TABLE characters_armours (
  	  id_character_armour INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
  	  id_character INT UNSIGNED,
  	  id_armour INT UNSIGNED,
  	  FOREIGN KEY (id_armour) REFERENCES armours (id_armour),
  	  FOREIGN KEY (id_character) REFERENCES characters (id_character)
);
CREATE TABLE characters_items (
   	 id_character_item INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
   	 id_character INT UNSIGNED,
   	 id_item INT UNSIGNED,
   	 FOREIGN KEY (id_item) REFERENCES items (id_item),
   	 FOREIGN KEY (id_character) REFERENCES characters (id_character)
);
INSERT INTO characters_weapons (id_character,id_weapon) 
VALUES 	(1,1),
	(2,3),
	(3,2),
	(4,1);

INSERT INTO characters_items (id_character,id_item) 
VALUES 	(1,3),
	(1,5),
	(2,4),
	(3,1),
	(3,2),
	(3,4),
	(4,6),
	(4,1);

INSERT INTO characters_armours (id_character,id_armour) 
VALUES 	(1,1),
	(2,2),
	(3,2),
	(4,3);

CREATE TABLE armours_materials (
    	id_armour_material INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    	id_armour INT UNSIGNED, 
    	id_material INT UNSIGNED,
   	FOREIGN KEY (id_armour) REFERENCES armours (id_armour),
       	FOREIGN KEY (id_material) REFERENCES materials (id_material)

);

