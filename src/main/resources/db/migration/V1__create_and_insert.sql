CREATE TABLE public.discipline
(
    name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT discipline_pkey PRIMARY KEY (name)
)
    WITH (
        OIDS = FALSE
        )
    TABLESPACE pg_default;

ALTER TABLE public.discipline
    OWNER to postgres;

CREATE TABLE public.students
(
    last_name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    first_name character varying(255) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT students_pkey PRIMARY KEY (last_name)
)
    WITH (
        OIDS = FALSE
        )
    TABLESPACE pg_default;

ALTER TABLE public.students
    OWNER to postgres;

CREATE TABLE public.grade
(
    id integer,
    student_last_name character varying(255) COLLATE pg_catalog."default",
    discipline_name character varying(255) COLLATE pg_catalog."default",
    grade integer,
    CONSTRAINT grade_pkey PRIMARY KEY (id),
    CONSTRAINT fk_discipline_name FOREIGN KEY (discipline_name)
        REFERENCES public.discipline (name) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT fk_student_last_name FOREIGN KEY (student_last_name)
        REFERENCES public.students (last_name) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
)
    WITH (
        OIDS = FALSE
        )
    TABLESPACE pg_default;

ALTER TABLE public.grade
    OWNER to postgres;