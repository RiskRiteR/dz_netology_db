create table if not exists styles_music (
	id SERIAL primary key,
	name_style VARCHAR(50) unique not null
);

create table if not exists musicians (
	id SERIAL primary key,
	alias VARCHAR(50) unique not null
);

create table if not exists albums (
	id SERIAL primary key,
	name_album VARCHAR(50) unique not NULL,
	release_yaer INT not null
);

create table if not exists tracks (
	id SERIAL primary key,
	name_track VARCHAR(50) unique not null,
	duration TIME not null,
	album INT not null references albums(id)
);

create table if not exists collections (
	id SERIAL primary key,
	name_collection VARCHAR(50) unique not null,
	release_yaer INT not null
);

create table if not exists styles_musicians (
	id_musician INT not null references musicians(id),
	id_style_music INT not null references styles_music(id)
);

create table if not exists albums_musicians (
	id_album INT not null references albums(id),
	id_musician INT not null references musicians(id)
);

create table if not exists tracks_collections (
	id_collection INT not null references collections(id),
	id_track INT not null references tracks(id)
);