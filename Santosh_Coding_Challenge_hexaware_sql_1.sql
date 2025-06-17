use virtual_art_gallery;

-- creating artsist table

create table Artists(
    ArtistId int Auto_increment primary key,
    Name varchar(250) not null,
    Biography text,
    Nationality varchar(100)
    );
    
-- creating categories table 
    
create table Categories(
     categoryId Int Auto_increment  primary key,
     Name varchar(100) Not null
     );
     
-- creating  artworks table

create Table Artwork(
      Artworkid int auto_increment primary key,
      title varchar(255) not null,
      ArtistId  int,
      categoryId int,
      year int,
      description text,
      imageurl varchar(255),
      foreign key (categoryId) references Categories(categoryId),
      foreign key (ArtistId) references Artists(ArtistId)
      );
      
-- creating exhibition table
    
create table Exhibition(
	Exhibitionid int auto_increment primary key,
	title varchar(255) not null,
    startdate date,
    enddate date,
    description text
    );
   
-- creating exhibitonArtworks

create table ExhibitionArtworks(
      Exhibitionid int,
      Artworkid int,
      primary key(Exhibitionid,Artworkid),
      foreign key (Exhibitionid) references Exhibition(Exhibitionid),
      foreign key (Artworkid) references Artwork(Artworkid)
      );

-- Insert into Artists
insert into Artists ( Name, Biography, Nationality) values
    ('Pablo Picasso', 'Renowned Spanish painter and sculptor.', 'Spanish'),
    ('Vincent van Gogh', 'Dutch post-impressionist painter.', 'Dutch'),
    ('Leonardo da Vinci', 'Italian polymath of the Renaissance.', 'Italian');

insert into Artists (Name, Biography, Nationality) values
('Claude Monet', 'Founder of French Impressionist painting.', 'French'),
('Frida Kahlo', 'Mexican painter known for self-portraits.', 'Mexican'),
('Salvador Dalí', 'Spanish surrealist artist.', 'Spanish'),
('Edvard Munch', 'Norwegian painter of "The Scream".', 'Norwegian');

-- Insert into Categories
insert into Categories (Name) values
    ('Painting'),
    ('Sculpture'),
    ('Photography');
    
insert into  Categories (Name) values
('Digital Art'),
('Modern Sculpture'),
('Classical Painting');


-- Insert into Artworks
insert Artwork ( title, ArtistId, CategoryId, year, description, imageurl) values
    ('Starry Night', 2, 1, 1889, 'A famous painting by Vincent van Gogh.', 'starry_night.jpg'),
    ('Mona Lisa', 3, 1, 1503, 'The iconic portrait by Leonardo da Vinci.', 'mona_lisa.jpg'),
    ('Guernica', 1, 1, 1937, 'Pablo Picasso\'s powerful anti-war mural.', 'guernica.jpg');

insert into Artwork (Title, ArtistID, CategoryID, Year, Description, ImageURL) values
('Water Lilies', 1, 3, 1906, 'Famous water lily series by Monet.', 'water_lilies.jpg'),
('The Two Fridas', 2, 1, 1939, 'Double self-portrait by Frida Kahlo.', 'two_fridas.jpg'),
('The Persistence of Memory', 3, 1, 1931, 'Melting clocks by Dalí.', 'persistence_memory.jpg'),
('The Scream', 4, 3, 1893, 'Iconic expressionist painting by Munch.', 'the_scream.jpg'),
('Self Portrait with Thorn Necklace', 2, 1, 1940, 'Another self-portrait by Frida.', 'thorn_necklace.jpg'),
('Galatea of the Spheres', 3, 1, 1952, 'Dalí’s 3D-like atomic painting.', 'galatea.jpg'),
('Impression, Sunrise', 1, 3, 1872, 'Inspired Impressionism movement.', 'sunrise.jpg');


-- Insert into Exhibitions
insert into  Exhibition (Title, StartDate, EndDate, Description) values
    ('Modern Art Masterpieces', '2023-01-01', '2023-03-01', 'A collection of modern art masterpieces.'),
    ('Renaissance Art', '2023-04-01', '2023-06-01', 'A showcase of Renaissance art treasures.');
    
insert into  Exhibition (Title, StartDate, EndDate, Description) values
('Impressionist Highlights', '2023-07-01', '2023-09-30', 'Featuring the pioneers of Impressionism.'),
('Surrealist Showcase', '2023-10-01', '2023-12-31', 'Exploring the surreal and dreamlike.'),
('Powerful Portraits', '2024-01-01', '2024-03-31', 'Portrait-focused masterpieces.');


-- Insert into ExhibitionArtworks
insert into ExhibitionArtworks (Exhibitionid, Artworkid) values
    (1, 1),
    (1, 2),
    (1, 3),
    (2, 2);

insert into ExhibitionArtworks (Exhibitionid, Artworkid) values
(1, 4),  
(2, 1),  
(2, 4),  
(3, 1),  
(3, 4),  
(3, 3); 

-- DQL Query Usage
select * from Artists;
select * from Categories;
select * from Artwork;
select * from Exhibition;
select * from ExhibitionArtworks;

/* 
1. Retrieve the names of all artists along with
 the number of artworks they have in the gallery, 
 and list them in descending order of the number of artworks.
 */
 
 select s.name ,count(s.artistid) as number_of_artworks from Artists s 
 left join Artwork k on s.artistid=k.artistid 
 group by s.artistid,s.name order by number_of_artworks desc ;
 
 /*
 2. List the titles of artworks created by artists
 from 'Spanish' and 'Dutch' nationalities, 
 and order them by the year in ascending order.
 */
 
 select title as Title,year from artwork s left join artists v 
 on  s.artistid=v.artistid where v.Nationality 
 in ('Spanish','Dutch') order by s.year ;
 
 /*
 3. Find the names of all artists who have artworks in 
 the 'Painting' category, and the number of 
 artworks they have in this category.
 */
 
 select s.name as Aristname,count(k.artworkid) as number_of_artworks from Artists s join artwork k 
 on s.artistid=k.artistid join categories c on k.categoryid=c.categoryid
 where c.name='painting' group by s.name,k.artworkid;
 
 /*
 4. List the names of artworks from the 'Modern Art Masterpieces'
 exhibition, along with their artists and categories.
 */
 
 select ar.Name as ArtistName from Exhibition e
join  ExhibitionArtworks ea on e.ExhibitionID = ea.ExhibitionID
join Artwork a on ea.ArtworkID = a.ArtworkID
join Artists ar on a.ArtistID = ar.ArtistID
join Categories c on a.CategoryID = c.CategoryID
where e.Title = 'Modern Art Masterpieces';

-- 5. Find the artists who have more than two artworks in the gallery.

select s.name as artitsname, count(v.artistid) as count from artists s 
join artwork v on s.artistid=v.artistid group by v.artistid,s.name having count(v.artistid)>2;

/*
6. Find the titles of artworks that were exhibited in both 'Modern Art Masterpieces' and 'Renaissance Art' exhibitions.
*/
select distinct(a.title )as artworktitle from artwork a
join exhibitionartworks ea on a.artworkid = ea.artworkid
join exhibition e on ea.exhibitionid = e.exhibitionid
where e.title in ('modern art masterpieces', 'renaissance art')
;


-- 7. Find the total number of artworks in each category.

select c.name as category_name,count(k.artworkid) as number_of_artworks from artwork k 
join categories c on k.categoryid=c.categoryid group by c.name;

-- 8. List artists who have more than 3 artworks in the gallery.

select s.name,count(k.artistid) as count from artists s join artwork k 
on s.artistid=k.artistid group by 
s.name,k.artistid having count(k.artistid)>3;

-- 9. Find the artworks created by artists from a specific nationality (e.g., Spanish).

select k.title as title  from artwork k join artists v on  k.artistid=v.artistid where v.nationality='spanish';
select k.title as title  from artwork k join artists v on  k.artistid=v.artistid where v.nationality='dutch';

-- 10.  List exhibitions that feature artwork by both Vincent van Gogh and Leonardo da Vinci.

select e.title as TitleName from Exhibition e
join  ExhibitionArtworks ea on e.ExhibitionID = ea.ExhibitionID
join Artwork a on ea.ArtworkID = a.ArtworkID
join Artists ar on a.ArtistID = ar.ArtistID
join Categories c on a.CategoryID = c.CategoryID
where ar.name in ('Vincent van Gogh','Leonardo da Vinci');

-- 11.Find all the artworks that have not been included in any exhibition

select e.title as TitleName from Exhibition e
join  ExhibitionArtworks ea on e.ExhibitionID = ea.ExhibitionID
join Artwork a on ea.ArtworkID = a.ArtworkID
join Artists ar on a.ArtistID = ar.ArtistID
join Categories c on a.CategoryID = c.CategoryID
WHERE ar.name in ('Vincent van Gogh','Leonardo da Vinci');

-- 12. List artists who have created artworks in all available categories.

Select ar.Name from Artists ar join Artwork aw on ar.ArtistID = aw.ArtistID
group by ar.ArtistID, ar.Name
having count(distinct aw.CategoryID) = (select count(*) from Categories);

-- 13. List the total number of artworks in each category.

select c.name,count(k.categoryid) from categories  c 
left join artwork k on c.categoryid=k.categoryid group by c.name,k.categoryid;

-- 14. Find the artists who have more than 2 artworks in the gallery.

select s.name,count(k.artistid) from artists s join artwork k 
on s.artistid=k.artistid group by s.name,k.artistid having  count(k.artistid)>2;

/*
15. List the categories with the average year of artworks
 they contain, only for categories with more than 1 artwork.
 */
 
 select c.name,avg(s.year) from categories c  join artwork s on
 c.categoryid=s.categoryid group by c.name,s.categoryid having count(s.categoryid)>1;
 
-- 16. Find the artworks that were exhibited in the 'Modern Art Masterpieces' exhibition

select e.title as TitleName from artwork e
join  ExhibitionArtworks ea on e.artworkid = ea.artworkid
join exhibition a on ea.exhibitionid = a.exhibitionid where a.title ='Modern Art Masterpieces';

/*
17. Find the categories where the average year of artworks 
is greater than the average year of all artworks.
*/

select c.name,avg(v.year) as average from categories c 
left join artwork v on v.categoryid=c.categoryid group by c.name,c.categoryid having avg(v.year) > (select avg(year) from artwork);

/*
18. List the artworks that were not exhibited in any exhibition.
*/
select distinct(a.Title) AS ArtworkTitle from Artwork a
left join  ExhibitionArtworks ea on a.ArtworkID = ea.ArtworkID
where ea.ExhibitionID IS NULL;

/*
19. Show artists who have artworks in the same category as "Mona Lisa."
*/
select distinct( ar.name )as artistname from artwork a
join artists ar on a.artistid = ar.artistid
where a.categoryid = (select categoryid from artwork where title = 'mona lisa'
);

-- 20. List the names of artists and the number of artworks they have in the gallery.

select ar.name as artistname,count(a.artworkid) as artworkcount
from artists ar left join artwork a on ar.artistid = a.artistid
group by ar.artistid, ar.name;

-- after task doing all operation of sql

/*
doing DML operation 
1.alter table 
2.truncate table
3.drop table
*/

-- since i am using the foreign keys and values alter taple will affect it so i am creating new name and atlering it
-- 1.alter table

create table artist1(
    ArtistId int Auto_increment primary key,
    Name varchar(250) not null,
    Biography text,
    Nationality varchar(100)
    );
    
alter table artist1 add artistage int ;
alter table artist1 rename to artist3;

-- 2.truncate table

truncate table artist3;

-- 3.drop table

drop table artist3;

/*
Doing DML commands 
1.delete values
2.update
*/

-- 1. delete data

create table Artists2(
    ArtistId int Auto_increment primary key,
    Name varchar(250) not null,
    Biography text,
    Nationality varchar(100)
    );

insert into Artists2 ( Name, Biography, Nationality) values
('Pablo Picasso', 'Renowned Spanish painter and sculptor.', 'Spanish'),
('Vincent van Gogh', 'Dutch post-impressionist painter.', 'Dutch'),
('Leonardo da Vinci', 'Italian polymath of the Renaissance.', 'Italian'),
('Claude Monet', 'Founder of French Impressionist painting.', 'French'),
('Frida Kahlo', 'Mexican painter known for self-portraits.', 'Mexican'),
('Salvador Dalí', 'Spanish surrealist artist.', 'Spanish'),
('Edvard Munch', 'Norwegian painter of "The Scream".', 'Norwegian');

delete from artists2 where nationality ='spanish';
select * from artists2;

-- 2.update

update artists2 set name ='santosh' where nationality ='french';
select*from artists2;

/*
aggregate function
1.sum
2.max
3.min
*/

-- 1.sum

select sum(year) from artwork;

-- 2.max

select title ,max(year) from artwork group by title;

-- 3.min

select title ,min(year) from artwork group by title;

/*
function
1.datedifference
2.length
3.dateformat
*/

-- 1.datedifference
select title,startdate,enddate,datediff(enddate,startdate)  as datedifference from exhibition;

-- 2. length

select title,length(description) as descriptionlength from artwork;

-- 3.dateformat
select title,startdate,enddate,date_format(startdate,'%m') as month from exhibition;
select title,startdate,enddate,date_format(startdate,'%W') as day from exhibition;
select title,startdate,enddate,date_format(startdate,'%d') as date from exhibition;
select title,startdate,enddate,date_format(startdate,'%Y') as year from exhibition;

/*
where cause data
1.like
2.between
*/

select description from artwork where description like 'a%';
select name from artists where name like '%h';
select name from artists where name like '%gh';
select name from artists where name like '%ch';

-- between

select title,year from artwork where year  between 1900 and 1990;
select title,year from artwork where year not  between 1900 and 1990;





