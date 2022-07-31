-- Need to add subgenus
-- Need to add physical descriptions
-- Need to add range and substrate notes

drop table if exists Mushrooms;
CREATE TABLE Mushrooms (
  mush_id varchar(11) not null primary key,
  species varchar(255) not null,
  common_name varchar(255),
  edible varchar(255),
  associated_trees varchar(255),
  mush_notes text
);

drop table if exists Genera;
CREATE TABLE Genera (
  genus_id int not null primary key,
  genus_name varchar(255) not null,
  genus_common_name varchar(255),
  genus_notes text
);

drop table if exists Mushrooms_Genera;
CREATE TABLE Mushrooms_Genera (
  mush_id varchar(11) not null,
  genus_id int not null,
  foreign key (mush_id)
    references Mushrooms (mush_id),
  foreign key (genus_id)
    references Genera (genus_id),
  primary key (mush_id, genus_id)
);

drop table if exists MorphologicGroups;
create table MorphologicGroups (
  group_id int not null primary key,
  group_name varchar(255) not null,
  group_notes text
);

drop table if exists Mushrooms_MorphologicGroups;
create table Mushrooms_MorphologicGroups (
  mush_id varchar(11) not null,
  group_id int not null,
  PRIMARY KEY (mush_id, group_id),
  FOREIGN KEY (mush_id)
    REFERENCES Mushrooms (mush_id),
  FOREIGN KEY (group_id)
    REFERENCES MorphologicGroups (group_id)
);

INSERT INTO MorphologicGroups (group_id, group_name, group_notes) VALUES
  (1, 'Light-Spored Gilled Mushrooms', NULL),
  (2, 'Pink-Spored Gilled Mushrooms', NULL),
  (3, 'Brown-Spored Gilled Mushrooms', NULL),
  (4, 'Dark-Spored Gilled Mushrooms', NULL),
  (5, 'Boletes', NULL),
  (6, 'Spine-Fungi', NULL),
  (7, 'Club-, Coral-, and Fan-like Fungi', NULL),
  (8, 'Polypores and Crust-Fungi', NULL),
  (9, 'Puffballs, Earthballs, and Earthstars', NULL),
  (10, 'Jelly-like Fungi', NULL),
  (11, 'Morels, False Morels, and Elfin Saddles', NULL),
  (12, 'Cup-Fungi', NULL),
  (13, 'Truffles and False Truffles', NULL),
  (14, 'Odds and Ends', NULL);

  INSERT INTO Genera (genus_id, genus_name, genus_common_name, genus_notes) VALUES
    (100,'Cantharellus', 'Chantarelles', NULL),
    (101,'Craterellus', 'Chantarelles', NULL),
    (102,'Gomphus', 'Chantarelles', NULL),
    (103,'Polyozellus', 'Chantarelles', NULL),
    (104,'Russula', NULL, NULL),
    (105,'Lactarius', 'Milk-Caps', NULL),
    (106,'Hygrocybe', 'Wax-Caps', NULL),
    (107,'Camarophyllus', 'Wax-Caps', NULL),
    (108,'Hygrophorus', 'Wax-Caps', NULL),
    (109,'Chlorophyllum', NULL, NULL),
    (110,'Lepiota', NULL, NULL),
    (111,'Leucoagaricus', NULL, NULL),
    (112,'Cystoderma', NULL, NULL),
    (113,'Amanita', NULL, NULL);

insert into Mushrooms (mush_id, species, common_name, edible, associated_trees, mush_notes) values
  -- Chanterelles
  ('m0001', 'formosus', 'Pacific Golden Chanterelle', 'Yes', NULL, NULL),
  ('m0002', 'cascadensis', NULL, NULL, 'Sitka spruce and shore pine at the coast; Engelmann spruce in the mountains', NULL),
  ('m0003', 'subalbidus', 'White Chanterelle', NULL, 'Forests with douglas fir and hemlock', 'Prefers older forests more than C. formusus and C. cascadensis'),
  ('m0004', 'tubaeformis', 'Winter Chanterelle', 'Yes', 'Prefers mossy rotten wood', NULL),
  ('m0005', 'clavatus', 'Pig\s Ear', 'Yes', 'Conifer forests', 'Prone to insect infestation'),
  ('m0006', 'flocossus', 'Wooly Chanterelle', 'No, recommended avoid', 'Conifer forests', NULL),
  ('m0007', 'kauffmanii', NULL, 'No, recommended avoid', 'Old-growth conifer forests', NULL),
  ('m0008', 'multiplex', 'Blue Chanterelle, Black Chanterelle', 'Yes', 'Old-growth conifer forests', 'Don\t overcollect because of rarity'),
  -- Russula
  ('m0009', 'adusta', NULL, 'Unknown', 'Conifers', NULL),
  ('m0010', 'amoenolens', NULL, 'Unknown', 'Under trees in parks / landscaped settings', NULL),
  ('m0011', 'brevipes', NULL, 'Unknown', NULL, 'Found by trails and forest service roads'),
  ('m0012', 'crassotunicata', NULL, 'Unknown', 'Old-growth forests', NULL),
  ('m0013', 'crenulata', NULL, 'Unknown', 'Conifers and hardwoods, variety of forests', NULL),
  ('m0014', 'fragilis', NULL, 'Unknown', NULL, NULL),
  ('m0015', 'laurocerasi', NULL, 'Unknown', NULL, NULL),
  ('m0016', 'nigricans', NULL, 'Unknown', NULL, NULL),
  ('m0017', 'occidentalis', NULL, 'Unknown', 'Under conifers in the Cascades', NULL),
  ('m0018', 'queletii', NULL, 'Unknown', NULL, NULL),
  ('m0019', 'rosacea', NULL, 'Edible cooked, but not good', 'Groups under pines', NULL),
  ('m0020', 'stuntzii', NULL, 'Unknown', NULL, NULL),
  ('m0021', 'xerampelina', NULL, 'Yes', NULL, NULL),
  -- Lactarius (Milk-Caps)
  ('m0022', 'delisiosus', NULL, 'Yes, but not delicious', NULL, NULL);


insert into Mushrooms_Genera (mush_id, genus_id) values
  -- Chanterelle
  ('m0001', 100),
  ('m0002', 100),
  ('m0003', 100),
  ('m0004', 101), -- Craterellus tubaeformis
  ('m0005', 102), -- Gomphus clavatus, p. 45
  ('m0006', 102), -- Gomphus flocossus, p. 46
  ('m0007', 102), -- Gomphus kauffmanii, p. 47
  ('m0008', 103), -- Polyozellus multiplex, p. 47
  -- Russula
  ('m0009', 104), -- Russula adusta, p. 49
  ('m0010', 104), -- Russula amoenolens, p. 49
  ('m0011', 104), -- Russula brevipes, p. 50
  ('m0012', 104), -- Russula crassotunicata, p. 50
  ('m0013', 104), -- Russula crenulata, p. 50
  ('m0014', 104), -- Russula fragilis, p. 51
  ('m0015', 104), -- Russula laurocerasi, p. 52
  ('m0016', 104), -- Russula nigricans, p. 52
  ('m0017', 104), -- Russula occidentalis, p. 52
  ('m0018', 104), -- Russula queletii, p. 53
  ('m0019', 104), -- Russula rosacea, p. 53
  ('m0020', 104), -- Russula stuntzii, p. 54
  ('m0021', 104), -- Russula xerampelina, p. 54
  -- Lactarius
  ('m0022', 105); -- Lactarius delisiosus, p. 55

insert into Mushrooms_MorphologicGroups (mush_id, group_id) values
  -- Chanterelle
  ('m0001', 1),
  ('m0002', 1),
  ('m0003', 1),
  ('m0004', 1),
  ('m0005', 1),
  ('m0006', 1),
  ('m0007', 1),
  ('m0008', 1),
  -- Russula
  ('m0009', 1),
  ('m0010', 1),
  ('m0011', 1),
  ('m0012', 1),
  ('m0013', 1),
  ('m0014', 1),
  ('m0015', 1),
  ('m0016', 1),
  ('m0017', 1),
  ('m0018', 1),
  ('m0019', 1),
  ('m0020', 1),
  ('m0021', 1),
  -- Lactarius
  ('m0022', 1);

select * from Mushrooms;
select * from Genera;
select * from Mushrooms_Genera;
select * from MorphologicGroups;
select * from Mushrooms_MorphologicGroups;
