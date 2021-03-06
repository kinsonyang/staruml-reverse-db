-- Database: user
-- DROP TABLE public.person CASCADE;
-- DROP TABLE public.dog CASCADE;
-- DROP TABLE public.department CASCADE;

CREATE TABLE public.department (
    id integer NOT NULL,
    sysid integer NOT NULL,
    name varchar(128) NOT NULL,
    PRIMARY KEY (id, sysid)
);

CREATE TABLE public.person (
    id bigint NOT NULL,
    name varchar(32) NOT NULL,
    age integer NOT NULL,
    identity_card_no char(16) NOT NULL,
    driver_licence_no char(16),
    department_id integer,
    department_sysid integer,
    PRIMARY KEY (id),
    FOREIGN KEY (department_id, department_sysid) REFERENCES department (id, sysid)
);

ALTER TABLE public.person
    ADD UNIQUE (identity_card_no, driver_licence_no);

CREATE TABLE public.dog (
    id bigint NOT NULL,
    name varchar(32) NOT NULL,
    owner bigint,
    chip_no char(128) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (owner) REFERENCES person (id)
);
