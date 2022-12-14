-- This script was generated by a beta version of the ERD tool in pgAdmin 4.
-- Please log an issue at https://redmine.postgresql.org/projects/pgadmin4/issues/new if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE IF NOT EXISTS public.detail
(
    detail_id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    todolist_id integer NOT NULL,
    description character varying(280) COLLATE pg_catalog."default",
    CONSTRAINT detail_id PRIMARY KEY (detail_id)
);

CREATE TABLE IF NOT EXISTS public.todolist
(
    todolist_id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    user_id integer NOT NULL,
    list_title character varying(50) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT list_id PRIMARY KEY (todolist_id)
);

CREATE TABLE IF NOT EXISTS public.user
(
    user_id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    user_lastName character varying(150) COLLATE pg_catalog."default",
    user_firstName character varying(150) COLLATE pg_catalog."default",
    user_mail character varying(150) COLLATE pg_catalog."default" NOT NULL,
    user_mdp character varying(250) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT user_id PRIMARY KEY (user_id),
    CONSTRAINT user_mail UNIQUE (user_mail)
);

ALTER TABLE IF EXISTS public.detail
    ADD CONSTRAINT todolist_id FOREIGN KEY (todolist_id)
    REFERENCES public.todolist (todolist_id) MATCH SIMPLE
    ON UPDATE RESTRICT
    ON DELETE CASCADE;
CREATE INDEX IF NOT EXISTS get_fk
    ON public.detail(todolist_id);


ALTER TABLE IF EXISTS public.todolist
    ADD CONSTRAINT user_id FOREIGN KEY (user_id)
    REFERENCES public.user (user_id) MATCH SIMPLE
    ON UPDATE RESTRICT
    ON DELETE CASCADE;
CREATE INDEX IF NOT EXISTS create_fk
    ON public.todolist(user_id);

END;