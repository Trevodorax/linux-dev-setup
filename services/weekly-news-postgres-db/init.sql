CREATE TABLE users
(
    id       bigserial                NOT NULL PRIMARY KEY,
    name     varchar(100)             NOT NULL,
    password bytea                    NOT NULL,
    created  timestamp with time zone NOT NULL,
    updated  timestamp with time zone NOT NULL
);

CREATE UNIQUE INDEX users_name_uindex ON users (name);

CREATE TABLE articles
(
    id      bigserial PRIMARY KEY,
    slug    text,
    title   text,
    content text,
    date    timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    active  boolean                  DEFAULT false,
    id_user bigint,
    CONSTRAINT articles_users_id_fk FOREIGN KEY (id_user)
        REFERENCES users (id)
        ON UPDATE CASCADE,
    created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);

CREATE UNIQUE INDEX articles_slug_uindex ON articles (slug);
