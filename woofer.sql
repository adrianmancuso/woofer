CREATE TABLE dogs(
	id serial4 primary key,
	user_name varchar(400),
	image_url text,
	age integer,
	bio varchar(1600),
	password_digest text
);
	-- breed
	-- location circle
	-- rating
	-- inbox foreign key[], left join with connections and private messages
	-- sent items

CREATE TABLE breeds(
	id serial4 primary key,
	breed_name varchar(400)
);

CREATE TABLE leashes(
	id serial4 primary key,
	dog_one_id
	dog_two_id
);

CREATE TABLE locations(
	id serial4 primary key,
	location_radius circle,
	inhabitant_id integer[] 
);

CREATE TABLE private_messages(
	id serial4 primary key,
	sender_id integer,
	recipient_id integer,
	body varchar(1500)
);

-- insert into dogs(user_name, image_url, age, bio, password_digest) values ('bobbydog', 'https://static.webshopapp.com/shops/024152/files/035868484/bobby-dog-collar-ibiza-silver.jpg', 12, 'I am a little dog with a big heart', 'boggy');
-- NOT DIGESTING PWORD;