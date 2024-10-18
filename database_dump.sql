--
-- PostgreSQL database dump
--

-- Dumped from database version 12.20 (Ubuntu 12.20-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 17.0 (Ubuntu 17.0-1.pgdg20.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: testuser
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO testuser;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: testuser
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auth_group_id_seq OWNER TO testuser;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: testuser
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: testuser
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO testuser;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: testuser
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auth_group_permissions_id_seq OWNER TO testuser;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: testuser
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: testuser
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO testuser;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: testuser
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auth_permission_id_seq OWNER TO testuser;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: testuser
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: testuser
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO testuser;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: testuser
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO testuser;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: testuser
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auth_user_groups_id_seq OWNER TO testuser;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: testuser
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: testuser
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auth_user_id_seq OWNER TO testuser;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: testuser
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: testuser
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO testuser;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: testuser
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNER TO testuser;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: testuser
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: testuser
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO testuser;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: testuser
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.django_admin_log_id_seq OWNER TO testuser;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: testuser
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: testuser
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO testuser;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: testuser
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.django_content_type_id_seq OWNER TO testuser;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: testuser
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: testuser
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO testuser;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: testuser
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.django_migrations_id_seq OWNER TO testuser;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: testuser
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: testuser
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO testuser;

--
-- Name: token_blacklist_blacklistedtoken; Type: TABLE; Schema: public; Owner: testuser
--

CREATE TABLE public.token_blacklist_blacklistedtoken (
    id bigint NOT NULL,
    blacklisted_at timestamp with time zone NOT NULL,
    token_id bigint NOT NULL
);


ALTER TABLE public.token_blacklist_blacklistedtoken OWNER TO testuser;

--
-- Name: token_blacklist_blacklistedtoken_id_seq; Type: SEQUENCE; Schema: public; Owner: testuser
--

CREATE SEQUENCE public.token_blacklist_blacklistedtoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.token_blacklist_blacklistedtoken_id_seq OWNER TO testuser;

--
-- Name: token_blacklist_blacklistedtoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: testuser
--

ALTER SEQUENCE public.token_blacklist_blacklistedtoken_id_seq OWNED BY public.token_blacklist_blacklistedtoken.id;


--
-- Name: token_blacklist_outstandingtoken; Type: TABLE; Schema: public; Owner: testuser
--

CREATE TABLE public.token_blacklist_outstandingtoken (
    id bigint NOT NULL,
    token text NOT NULL,
    created_at timestamp with time zone,
    expires_at timestamp with time zone NOT NULL,
    user_id integer,
    jti character varying(255) NOT NULL
);


ALTER TABLE public.token_blacklist_outstandingtoken OWNER TO testuser;

--
-- Name: token_blacklist_outstandingtoken_id_seq; Type: SEQUENCE; Schema: public; Owner: testuser
--

CREATE SEQUENCE public.token_blacklist_outstandingtoken_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.token_blacklist_outstandingtoken_id_seq OWNER TO testuser;

--
-- Name: token_blacklist_outstandingtoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: testuser
--

ALTER SEQUENCE public.token_blacklist_outstandingtoken_id_seq OWNED BY public.token_blacklist_outstandingtoken.id;


--
-- Name: videos_video; Type: TABLE; Schema: public; Owner: testuser
--

CREATE TABLE public.videos_video (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    description text,
    video_file_url character varying(200) NOT NULL,
    uploader_id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    thumbnail_url character varying(200)
);


ALTER TABLE public.videos_video OWNER TO testuser;

--
-- Name: videos_video_id_seq; Type: SEQUENCE; Schema: public; Owner: testuser
--

CREATE SEQUENCE public.videos_video_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.videos_video_id_seq OWNER TO testuser;

--
-- Name: videos_video_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: testuser
--

ALTER SEQUENCE public.videos_video_id_seq OWNED BY public.videos_video.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: testuser
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: testuser
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: testuser
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: testuser
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: testuser
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: testuser
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: testuser
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: testuser
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: testuser
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: token_blacklist_blacklistedtoken id; Type: DEFAULT; Schema: public; Owner: testuser
--

ALTER TABLE ONLY public.token_blacklist_blacklistedtoken ALTER COLUMN id SET DEFAULT nextval('public.token_blacklist_blacklistedtoken_id_seq'::regclass);


--
-- Name: token_blacklist_outstandingtoken id; Type: DEFAULT; Schema: public; Owner: testuser
--

ALTER TABLE ONLY public.token_blacklist_outstandingtoken ALTER COLUMN id SET DEFAULT nextval('public.token_blacklist_outstandingtoken_id_seq'::regclass);


--
-- Name: videos_video id; Type: DEFAULT; Schema: public; Owner: testuser
--

ALTER TABLE ONLY public.videos_video ALTER COLUMN id SET DEFAULT nextval('public.videos_video_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: testuser
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: testuser
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: testuser
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add video	7	add_video
26	Can change video	7	change_video
27	Can delete video	7	delete_video
28	Can view video	7	view_video
29	Can add blacklisted token	8	add_blacklistedtoken
30	Can change blacklisted token	8	change_blacklistedtoken
31	Can delete blacklisted token	8	delete_blacklistedtoken
32	Can view blacklisted token	8	view_blacklistedtoken
33	Can add outstanding token	9	add_outstandingtoken
34	Can change outstanding token	9	change_outstandingtoken
35	Can delete outstanding token	9	delete_outstandingtoken
36	Can view outstanding token	9	view_outstandingtoken
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: testuser
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$260000$tBNMjqHgN3pkwjQI49KDwT$cPP8HR/ti0f/rfKqTBzTGZ0M5OuvHPWqVzNfCSA98JQ=	2024-10-16 15:32:48.356783+08	t	admin			admin@gmail.com	t	t	2024-10-16 15:22:16.612109+08
3	pbkdf2_sha256$260000$EggtunPntcwo338QIBG3Om$774PoYY9HDbSOhGMp7iZQoS5DWKhEe61ZgGIgQOxz+o=	\N	f	test			test@gmail.com	f	t	2024-10-16 18:30:11.104526+08
2	pbkdf2_sha256$600000$qVJoll4E9rp2fCbjFBSGL5$dF/boka0gbd6xLrffZbLC++7HhUkMzUh2iXP25nGKWU=	\N	f	newuser			newuser@example.com	f	t	2024-10-16 15:32:25.965098+08
4	pbkdf2_sha256$600000$ZLa91FSSsTKncb9kGSt0US$CRB2afEwieqxYrN1X8VYRV8yByZ7cWbzqX4Hv8uGU2U=	\N	f	newuser1			newuser@example.com	f	t	2024-10-18 15:04:26.979701+08
5	pbkdf2_sha256$600000$9WlYQBvda5DoUqcS8MK7rm$7wpApcCocs5rCbL8jkTEtH+7dQnGXB9Lg7W9QsneS5Y=	\N	f	newuser2			newuser@example.com	f	t	2024-10-18 17:34:51.856378+08
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: testuser
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: testuser
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: testuser
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: testuser
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	videos	video
8	token_blacklist	blacklistedtoken
9	token_blacklist	outstandingtoken
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: testuser
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2024-10-15 17:11:20.449887+08
2	auth	0001_initial	2024-10-15 17:11:20.505729+08
3	admin	0001_initial	2024-10-15 17:11:20.522839+08
4	admin	0002_logentry_remove_auto_add	2024-10-15 17:11:20.531778+08
5	admin	0003_logentry_add_action_flag_choices	2024-10-15 17:11:20.540865+08
6	contenttypes	0002_remove_content_type_name	2024-10-15 17:11:20.557509+08
7	auth	0002_alter_permission_name_max_length	2024-10-15 17:11:20.569176+08
8	auth	0003_alter_user_email_max_length	2024-10-15 17:11:20.578393+08
9	auth	0004_alter_user_username_opts	2024-10-15 17:11:20.586534+08
10	auth	0005_alter_user_last_login_null	2024-10-15 17:11:20.599576+08
11	auth	0006_require_contenttypes_0002	2024-10-15 17:11:20.601641+08
12	auth	0007_alter_validators_add_error_messages	2024-10-15 17:11:20.613081+08
13	auth	0008_alter_user_username_max_length	2024-10-15 17:11:20.649488+08
14	auth	0009_alter_user_last_name_max_length	2024-10-15 17:11:20.657682+08
15	auth	0010_alter_group_name_max_length	2024-10-15 17:11:20.666515+08
16	auth	0011_update_proxy_permissions	2024-10-15 17:11:20.67471+08
17	auth	0012_alter_user_first_name_max_length	2024-10-15 17:11:20.683117+08
18	sessions	0001_initial	2024-10-15 17:11:20.693484+08
19	token_blacklist	0001_initial	2024-10-15 18:30:32.784355+08
20	token_blacklist	0002_outstandingtoken_jti_hex	2024-10-15 18:30:32.793748+08
21	token_blacklist	0003_auto_20171017_2007	2024-10-15 18:30:32.805765+08
22	token_blacklist	0004_auto_20171017_2013	2024-10-15 18:30:32.818561+08
23	token_blacklist	0005_remove_outstandingtoken_jti	2024-10-15 18:30:32.82806+08
24	token_blacklist	0006_auto_20171017_2113	2024-10-15 18:30:32.838814+08
25	token_blacklist	0007_auto_20171017_2214	2024-10-15 18:30:32.892929+08
26	token_blacklist	0008_migrate_to_bigautofield	2024-10-15 18:30:32.930038+08
27	token_blacklist	0010_fix_migrate_to_bigautofield	2024-10-15 18:30:32.944919+08
28	token_blacklist	0011_linearizes_history	2024-10-15 18:30:32.946707+08
29	token_blacklist	0012_alter_outstandingtoken_user	2024-10-15 18:30:32.956285+08
30	videos	0001_initial	2024-10-15 18:30:32.972823+08
33	videos	0003_auto_20241017_0834	2024-10-17 16:34:51.845623+08
37	videos	0003_auto_20241017_0842	2024-10-17 16:42:23.26062+08
40	videos	0001_create_video_model	2024-10-17 20:14:33.566126+08
41	videos	0002_video_created_at	2024-10-17 20:14:33.577995+08
42	videos	0003_video_thumbnail_url	2024-10-17 20:14:33.593853+08
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: testuser
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
ugstidpw85t7i8iswkt9tqihwfynbo42	.eJxVjEEOwiAQRe_C2hCnOAgu3fcMZGAGqRpISrsy3l2bdKHb_977LxVoXUpYu8xhYnVRoA6_W6T0kLoBvlO9NZ1aXeYp6k3RO-16bCzP6-7-HRTq5VujP0MenLUIIjIY5OyBOZ0Sg2U4ekpZIEf0HNEIcEb0LpJkJ2KQ1PsD9CY5BQ:1t0yWW:IMFhvdfbO-P92ftIfdLTqSPyUfg6f5VB1ib-T0OaDrQ	2024-10-30 15:32:48.359222+08
\.


--
-- Data for Name: token_blacklist_blacklistedtoken; Type: TABLE DATA; Schema: public; Owner: testuser
--

COPY public.token_blacklist_blacklistedtoken (id, blacklisted_at, token_id) FROM stdin;
\.


--
-- Data for Name: token_blacklist_outstandingtoken; Type: TABLE DATA; Schema: public; Owner: testuser
--

COPY public.token_blacklist_outstandingtoken (id, token, created_at, expires_at, user_id, jti) FROM stdin;
1	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcyOTE1MDUyNiwiaWF0IjoxNzI5MDY0MTI2LCJqdGkiOiI0Y2M2ZDA1NDMzOWQ0YTI2OGI0ODUwMjU3MzEzNGIyYSIsInVzZXJfaWQiOjJ9.0x-LFjVSadx6xyNXlkYKD-I6WON2MUG-e_bYrMPblR4	2024-10-16 15:35:26.26849+08	2024-10-17 15:35:26+08	2	4cc6d054339d4a268b48502573134b2a
2	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcyOTE1MDU0NSwiaWF0IjoxNzI5MDY0MTQ1LCJqdGkiOiJhN2UxZjk5NWU1Yjg0NzJlOTVmNTY5MTZjOWM4NzI1ZiIsInVzZXJfaWQiOjJ9.dr22nLK7onooxrYaZgv_tioifYko77CwbOM2j2ZHJq8	2024-10-16 15:35:45.042291+08	2024-10-17 15:35:45+08	2	a7e1f995e5b8472e95f56916c9c8725f
3	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcyOTE1MTI4NiwiaWF0IjoxNzI5MDY0ODg2LCJqdGkiOiI2MzBmNTJjNjA3ZjM0ZjhkOWRiYTU2YjAyY2Y5MTcxMSIsInVzZXJfaWQiOjJ9.-0JyqwZnN-m9EKgvmctTF1RAMsys25UKKozdXzj-Dfo	2024-10-16 15:48:06.46862+08	2024-10-17 15:48:06+08	2	630f52c607f34f8d9dba56b02cf91711
4	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcyOTE1MTc5NywiaWF0IjoxNzI5MDY1Mzk3LCJqdGkiOiJkMWFiNGQwYjE5YjQ0MTczYTM5MjIzMmFhYzZjMDgzNSIsInVzZXJfaWQiOjJ9.YQB4j-qeAOCy85sPKUUrQtdgyaAHBMSM5syJRG3SNfs	2024-10-16 15:56:37.949248+08	2024-10-17 15:56:37+08	2	d1ab4d0b19b44173a392232aac6c0835
5	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcyOTE1MjIyOCwiaWF0IjoxNzI5MDY1ODI4LCJqdGkiOiI2NmY0MzRlZDgwYTQ0NzNkOTc3NjIwYTljN2JlZmVmZiIsInVzZXJfaWQiOjJ9.YwFDj3mJvUYQ2J2lZ7m42psI7qVahmUgeXnmjiphl2E	2024-10-16 16:03:48.43879+08	2024-10-17 16:03:48+08	2	66f434ed80a4473d977620a9c7befeff
6	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcyOTE1MjU4MCwiaWF0IjoxNzI5MDY2MTgwLCJqdGkiOiIxYWEzZWZmNzZkZTQ0NThhOWJiMTY1ZWVmODYyNmIyMyIsInVzZXJfaWQiOjJ9.m_sPQ75TDovi2I5HkykWXsDVtzGhu9uWyF4mmf2rjkE	2024-10-16 16:09:40.460873+08	2024-10-17 16:09:40+08	2	1aa3eff76de4458a9bb165eef8626b23
7	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcyOTE2MDcxNiwiaWF0IjoxNzI5MDc0MzE2LCJqdGkiOiI4Yzc2YjI0M2Q0ZTM0NzZkOGFhNDQxOGMyZmUzZWNjZSIsInVzZXJfaWQiOjJ9.wLZOu4vcxb3GiHMhAvTJN5DhOnmI6c_R0pSNKUWRaEM	2024-10-16 18:25:16.739284+08	2024-10-17 18:25:16+08	2	8c76b243d4e3476d8aa4418c2fe3ecce
8	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcyOTE2MTAxOSwiaWF0IjoxNzI5MDc0NjE5LCJqdGkiOiJhM2NiYjdlZjBhZjM0NjNiYmU3YzljYWYzMDk3NmQyNCIsInVzZXJfaWQiOjN9.N2WVCLhmQn3tVH8k6dQ8-3VDWdBJ4YzxH9Lp0PXJLXc	2024-10-16 18:30:19.984498+08	2024-10-17 18:30:19+08	3	a3cbb7ef0af3463bbe7c9caf30976d24
9	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcyOTE2MTM5OSwiaWF0IjoxNzI5MDc0OTk5LCJqdGkiOiJiZTQ5OGU2NjVkNGI0NTEwOGM5YjA4YTg1MmYxODM0ZCIsInVzZXJfaWQiOjJ9.23P9HuCWhhOvwQZNh48UiPR74H0L4r3Oe86htHH8IxE	2024-10-16 18:36:39.322947+08	2024-10-17 18:36:39+08	2	be498e665d4b45108c9b08a852f1834d
10	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcyOTE2MTg0NSwiaWF0IjoxNzI5MDc1NDQ1LCJqdGkiOiI5ZjBjYzhiMTkzZWQ0YjAwYmU2YjJmZGI1ZTlmOWIzYSIsInVzZXJfaWQiOjJ9.Rtd3khEQzxr-S11g6M_nZ_D4JPvTu7BxcR8hk2B1Bqs	2024-10-16 18:44:05.199073+08	2024-10-17 18:44:05+08	2	9f0cc8b193ed4b00be6b2fdb5e9f9b3a
11	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcyOTE2MjEzNywiaWF0IjoxNzI5MDc1NzM3LCJqdGkiOiJmYmM4NGViMjRhNDQ0YTZkOWQwM2U0MTRkYmM1MzM1YiIsInVzZXJfaWQiOjJ9.CQVB0mmpYi2tlow_75L85TP3afE-BcT6OrQJ0XbstqY	2024-10-16 18:48:57.629043+08	2024-10-17 18:48:57+08	2	fbc84eb24a444a6d9d03e414dbc5335b
12	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcyOTE2MjIxMywiaWF0IjoxNzI5MDc1ODEzLCJqdGkiOiI5MGQ0NmFhOTM5NzM0MGRlOGU5Y2QyZTIxN2JhZmYyOSIsInVzZXJfaWQiOjJ9.4CGdluR5m2fsU0REwWhl9PPjEVRAPrQ61aBvK63Boas	2024-10-16 18:50:13.84302+08	2024-10-17 18:50:13+08	2	90d46aa9397340de8e9cd2e217baff29
13	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcyOTE2MjM3OCwiaWF0IjoxNzI5MDc1OTc4LCJqdGkiOiJiN2VkMTg4MDNlZTA0NDg3YjA0Njc5MjdhNDU1ZDIxMSIsInVzZXJfaWQiOjJ9.7R6ECHp6wDPpcHJwEL6TP2b3_Kunp66GhxM0qErqlHE	2024-10-16 18:52:58.953488+08	2024-10-17 18:52:58+08	2	b7ed18803ee04487b0467927a455d211
14	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcyOTE2MjQ1MSwiaWF0IjoxNzI5MDc2MDUxLCJqdGkiOiIwNDNmZWJiYTg1NzY0NDcyODFlYjUyMTU5MzQxMTcyMyIsInVzZXJfaWQiOjJ9.IsyHrWqiAiSbvqetsxYiEh2cj4SEsmbtCgD6ol5SbVQ	2024-10-16 18:54:11.288096+08	2024-10-17 18:54:11+08	2	043febba8576447281eb521593411723
15	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcyOTE2MjY3NiwiaWF0IjoxNzI5MDc2Mjc2LCJqdGkiOiI3ZjJhMjc5MGEwNGE0NmI3YWI2OTFkZWY3N2MxNTA1OCIsInVzZXJfaWQiOjJ9.VofEhMflXvG0rvf9bAl61Y3A1WK_0dFI1sGH4ZBLBDw	2024-10-16 18:57:56.583417+08	2024-10-17 18:57:56+08	2	7f2a2790a04a46b7ab691def77c15058
16	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcyOTE2MjcwNCwiaWF0IjoxNzI5MDc2MzA0LCJqdGkiOiI2NzJkYzQ5ZWNhMjE0NmE0YjQyMmE4MjAwMTg4NzljOCIsInVzZXJfaWQiOjJ9.7iB-PhJKWnvn9VFddf2zkI0CH8q4mmkW_U7C460lgHE	2024-10-16 18:58:24.931714+08	2024-10-17 18:58:24+08	2	672dc49eca2146a4b422a820018879c8
17	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcyOTE2MzI4OSwiaWF0IjoxNzI5MDc2ODg5LCJqdGkiOiJhMDZjZTFiZWNiZDI0ZWIyODcwODAxMGMyOTRlMzhmZCIsInVzZXJfaWQiOjJ9.2OC60u9OxGuhXtOb5aMjlGNkaDW0ms1sE_huUFD9nE4	2024-10-16 19:08:09.229868+08	2024-10-17 19:08:09+08	2	a06ce1becbd24eb28708010c294e38fd
18	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcyOTE2MzYyNywiaWF0IjoxNzI5MDc3MjI3LCJqdGkiOiJjMTY2NDExZDkwOGM0MDU2OTM5NGI0N2IxOWVlYmZhNiIsInVzZXJfaWQiOjJ9.8lNUTay_pqrHsTHkLTc9zSU_BL6H2E0GssiCnlPkIc0	2024-10-16 19:13:47.618999+08	2024-10-17 19:13:47+08	2	c166411d908c40569394b47b19eebfa6
19	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcyOTE2Mzk5OSwiaWF0IjoxNzI5MDc3NTk5LCJqdGkiOiIzZTQ4OTRjYTM3OTY0NDU5YjRiYWVlYzNlODcwYzA1ZCIsInVzZXJfaWQiOjJ9.uOM468XxaJ3_bDffRlF3IkftezsPcyxbOYGLGuxryn4	2024-10-16 19:19:59.299954+08	2024-10-17 19:19:59+08	2	3e4894ca37964459b4baeec3e870c05d
20	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcyOTE2NTQ0NSwiaWF0IjoxNzI5MDc5MDQ1LCJqdGkiOiIyNzAwYjQwM2NhYTA0NGRmOTE4NzNlYzg5OTYwZTgxNSIsInVzZXJfaWQiOjJ9.I9bfHqcsk7cBNGbBjFLF6uYpUL1uy9pbNLi_qq0xETw	2024-10-16 19:44:05.120974+08	2024-10-17 19:44:05+08	2	2700b403caa044df91873ec89960e815
21	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcyOTE2OTA4MywiaWF0IjoxNzI5MDgyNjgzLCJqdGkiOiJiZDViMzc3Mjg1ZTU0N2FhYWQ0YTcwMmNkZTY2YmFkNCIsInVzZXJfaWQiOjJ9.Tq2jUxSoN9kpJ1A_2AMRiwpRfWXlCuTBwO6V1IcdwcA	2024-10-16 20:44:43.65698+08	2024-10-17 20:44:43+08	2	bd5b377285e547aaad4a702cde66bad4
22	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcyOTE2OTY4NSwiaWF0IjoxNzI5MDgzMjg1LCJqdGkiOiJjMzUzMDcwNzc4OWI0NTBiOTZjODg2NTAzZTE0MDRlOSIsInVzZXJfaWQiOjJ9.-M0ozaLTeBSGqL5ueBDNLKkBUq3y1mYmLKYyHCtjdoo	2024-10-16 20:54:45.200997+08	2024-10-17 20:54:45+08	2	c3530707789b450b96c886503e1404e9
23	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcyOTE2OTk2OCwiaWF0IjoxNzI5MDgzNTY4LCJqdGkiOiJjYWI1NzQ3MGZmNWI0N2JiYWE0MWU1NDVkZjgzNGYxMyIsInVzZXJfaWQiOjJ9.kIXNYZNHKdqTLPz2k7VtYakWel7QoKEM0FcJeU0_F9c	2024-10-16 20:59:28.282842+08	2024-10-17 20:59:28+08	2	cab57470ff5b47bbaa41e545df834f13
24	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcyOTE3MDE3MCwiaWF0IjoxNzI5MDgzNzcwLCJqdGkiOiI0NmE5OTk5MWZhNWY0MjBkODBmMWU3NTAzZmZjM2ZiZSIsInVzZXJfaWQiOjJ9.BoeIsQmwGcar0U3LPtSOxojdGHrGSIYgCahF1IR31_I	2024-10-16 21:02:50.990714+08	2024-10-17 21:02:50+08	2	46a99991fa5f420d80f1e7503ffc3fbe
25	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcyOTE3MDUxNywiaWF0IjoxNzI5MDg0MTE3LCJqdGkiOiJkYjNiYTdkMGJiYTI0NTk2OWZhYjk0YTlkODk2YjMxOCIsInVzZXJfaWQiOjJ9.9XTf2LqJMgE9Q4RK1IR4PcJHULhOkpicyGMQ94cP2iE	2024-10-16 21:08:37.267364+08	2024-10-17 21:08:37+08	2	db3ba7d0bba245969fab94a9d896b318
26	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcyOTIzMjk5OSwiaWF0IjoxNzI5MTQ2NTk5LCJqdGkiOiIxOTNiMjU5YjlhYjI0YjI2YjU3OTBiNTk0NjBjNzhmMCIsInVzZXJfaWQiOjJ9.kZwIE5Wa0IHg2YGZu1THwM4Bl3IBhmRYmkeP0C74HPY	2024-10-17 14:29:59.543757+08	2024-10-18 14:29:59+08	2	193b259b9ab24b26b5790b59460c78f0
27	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcyOTIzMzY0MSwiaWF0IjoxNzI5MTQ3MjQxLCJqdGkiOiJlYzViYTU1Y2QwMWQ0NDY4ODZhMzY1MDVmNzQ1NjhhZiIsInVzZXJfaWQiOjJ9.pdGhgYaq5M2T9aPmp0J1xJbpkBSWPnxWLWuSpZL_qtc	2024-10-17 14:40:41.873933+08	2024-10-18 14:40:41+08	2	ec5ba55cd01d446886a36505f74568af
28	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcyOTIzMzg1MSwiaWF0IjoxNzI5MTQ3NDUxLCJqdGkiOiIyMzMwZTlkZjMyOWM0ZmZiYTljOGI4NjE4Yjk1MjY2MiIsInVzZXJfaWQiOjJ9.sllDEoOO5ZmnkLs6xfVSbBvFFZQwXk3vntgeWvtmO9Q	2024-10-17 14:44:11.255205+08	2024-10-18 14:44:11+08	2	2330e9df329c4ffba9c8b8618b952662
29	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcyOTIzNDcwOCwiaWF0IjoxNzI5MTQ4MzA4LCJqdGkiOiI1Y2Q4NGEyMzAyZTc0NWIxYWI1NDM1ZWNjMTdlOTU3YiIsInVzZXJfaWQiOjJ9.LPAWgBeQwChOEOFnR8RfHht4bzaIn46MqTAvCXq-NjM	2024-10-17 14:58:28.366639+08	2024-10-18 14:58:28+08	2	5cd84a2302e745b1ab5435ecc17e957b
30	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcyOTIzNTI3NiwiaWF0IjoxNzI5MTQ4ODc2LCJqdGkiOiJlMTQ1YjNiODlmNGY0ZjY0ODI1M2JiNDUxY2JkYmFhYSIsInVzZXJfaWQiOjJ9.c6UV66CQwy6yu3kMY24eO1wBHPNzAv6eeCbmwFCPKmg	2024-10-17 15:07:56.400915+08	2024-10-18 15:07:56+08	2	e145b3b89f4f4f648253bb451cbdbaaa
31	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcyOTIzNTg3NywiaWF0IjoxNzI5MTQ5NDc3LCJqdGkiOiJjZWRkNDM4NjQyZDg0OTY4OGYwYzY5MWE0NmZhMTQ0NCIsInVzZXJfaWQiOjJ9.GTTAnZf01nMOl3n-_TWbcNz2VQjaokjWzc0K4l1uQok	2024-10-17 15:17:57.02066+08	2024-10-18 15:17:57+08	2	cedd438642d849688f0c691a46fa1444
32	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcyOTIzNjA5OCwiaWF0IjoxNzI5MTQ5Njk4LCJqdGkiOiI0Y2E1N2E3YWIxNGE0Yjk4OTdlOTBmZjQ2N2E0NTU4OCIsInVzZXJfaWQiOjJ9.GW0p4s93E7z_8ss0OvwZSb9OKdYfIlw2G8xPtZuncOg	2024-10-17 15:21:38.892097+08	2024-10-18 15:21:38+08	2	4ca57a7ab14a4b9897e90ff467a45588
33	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcyOTIzNjY3MiwiaWF0IjoxNzI5MTUwMjcyLCJqdGkiOiIwZTIwOTJiZGJlNTM0N2MyYjk2NDVkNTk4YmQxZGRhNiIsInVzZXJfaWQiOjJ9.xlhsAGss7ts2iyacu9pfnZPk2dyGRq-YU8MrvImbPGc	2024-10-17 15:31:12.14637+08	2024-10-18 15:31:12+08	2	0e2092bdbe5347c2b9645d598bd1dda6
34	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcyOTIzNzI1MiwiaWF0IjoxNzI5MTUwODUyLCJqdGkiOiI0YzY5NzMxZGI0NWQ0ZmVmYTk2OTM5M2IzODRkZmQyNCIsInVzZXJfaWQiOjJ9.up9esbrF8bnvTop1wWEeEGQEJPJmVZQ61J7uJ2OVlNU	2024-10-17 15:40:52.551055+08	2024-10-18 15:40:52+08	2	4c69731db45d4fefa969393b384dfd24
35	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcyOTIzNzk1NiwiaWF0IjoxNzI5MTUxNTU2LCJqdGkiOiI3NThmYmI4NjQ3ZGQ0ZmE1YjdiMzA5ODZlODJlNjNiMCIsInVzZXJfaWQiOjJ9.wAoCN04ceUBwjr3jtVgGLBHib5axNbLkoOx8-H9WCBk	2024-10-17 15:52:36.609177+08	2024-10-18 15:52:36+08	2	758fbb8647dd4fa5b7b30986e82e63b0
36	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcyOTIzODY2NSwiaWF0IjoxNzI5MTUyMjY1LCJqdGkiOiI2NTg2Mzg2YzllZWM0ZTcxYjA3N2FkMTNiYzI4YmU4MiIsInVzZXJfaWQiOjJ9.qz0lqI8vozW3Vue7TkAOuiiP0RYAyRIuwXfpCbuPt0U	2024-10-17 16:04:25.813572+08	2024-10-18 16:04:25+08	2	6586386c9eec4e71b077ad13bc28be82
37	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcyOTIzODg3NiwiaWF0IjoxNzI5MTUyNDc2LCJqdGkiOiI4YzQwMGI4YmI3MzQ0ZjQ2YTlhZDdhNzE3OTNkZGU3OSIsInVzZXJfaWQiOjJ9.4fvqI_45X7m23jLhYjKfiMH-G04SIvSMraXcXxZxhMg	2024-10-17 16:07:56.408849+08	2024-10-18 16:07:56+08	2	8c400b8bb7344f46a9ad7a71793dde79
38	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcyOTIzOTEwNiwiaWF0IjoxNzI5MTUyNzA2LCJqdGkiOiJhODRjNjBhZWUzNDk0ZjMwOWJlOGY1NTAzYTEyNGU0MiIsInVzZXJfaWQiOjJ9.PzTpf9rRmKUCrKvvwxMTAPMRdnxRuRkf4BO0IPbjDv0	2024-10-17 16:11:46.891801+08	2024-10-18 16:11:46+08	2	a84c60aee3494f309be8f5503a124e42
39	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcyOTIzOTIzMiwiaWF0IjoxNzI5MTUyODMyLCJqdGkiOiIyZjYxNGJlMmYwOGU0MGY5OWIwYTk0ZjEzMzZhNDg0YSIsInVzZXJfaWQiOjJ9.cxtXnUyCHR1QOCsf88kYCEhg6Htf0bq5k2zNVbhgn5c	2024-10-17 16:13:52.409596+08	2024-10-18 16:13:52+08	2	2f614be2f08e40f99b0a94f1336a484a
40	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcyOTIzOTc3OSwiaWF0IjoxNzI5MTUzMzc5LCJqdGkiOiIyYTY5OGM2MGI0ZTU0NDBjYTY2NmE4N2UxYTI3ZGIyOSIsInVzZXJfaWQiOjJ9.w8vcPLVFt3XPA25z29wL3CQEY71YnapS1AMa78XtXj8	2024-10-17 16:22:59.112497+08	2024-10-18 16:22:59+08	2	2a698c60b4e5440ca666a87e1a27db29
41	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcyOTI0MDQwOCwiaWF0IjoxNzI5MTU0MDA4LCJqdGkiOiIxOTc5MjRiNDYwMDA0MjZmYWMwMzUwZDRjYzRiMzdkYyIsInVzZXJfaWQiOjJ9.NdPr5_xQ1V_ObaPKmMVvLUteFdGkUy1sr7UIrc_1yrQ	2024-10-17 16:33:28.959451+08	2024-10-18 16:33:28+08	2	197924b46000426fac0350d4cc4b37dc
42	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcyOTI0MDUwNywiaWF0IjoxNzI5MTU0MTA3LCJqdGkiOiJiNDk3NmYyNjFjZmY0OGFhODdiYTBiZTUxNWIyOGUxNSIsInVzZXJfaWQiOjJ9.O3ynbcGU8SUb3miIbocf7Ee6vaneLW3XRxs5ki7eiV4	2024-10-17 16:35:07.258947+08	2024-10-18 16:35:07+08	2	b4976f261cff48aa87ba0be515b28e15
43	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcyOTI0MDc0NSwiaWF0IjoxNzI5MTU0MzQ1LCJqdGkiOiI0ZTFjYzBhNDI0MTk0MGZhYjJmNTRhNDYwZDhlYzFiMyIsInVzZXJfaWQiOjJ9.TiMfIUkuFRJW1SvtUFcVsEXPs4XcNEWEpp0l4lPjj10	2024-10-17 16:39:05.21226+08	2024-10-18 16:39:05+08	2	4e1cc0a4241940fab2f54a460d8ec1b3
44	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcyOTI0MDk2MSwiaWF0IjoxNzI5MTU0NTYxLCJqdGkiOiI2MWI1OGVmZDIzMjI0OTBhOGFlMzkwZjIwOWJiNjNjYSIsInVzZXJfaWQiOjJ9.9MyATAV2CH3I8BSvgMdjiaW20kXwbv36SsUO9baPDo8	2024-10-17 16:42:41.979018+08	2024-10-18 16:42:41+08	2	61b58efd2322490a8ae390f209bb63ca
45	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcyOTI0MDk4MywiaWF0IjoxNzI5MTU0NTgzLCJqdGkiOiI1M2YwMWVjNDExMTM0ZTc0ODZhNTA0YWUyN2U2MWYzMSIsInVzZXJfaWQiOjJ9.Gb_gkUCxfypxVWf6aj2a22RwLstFRiA2WsVs81hfG_U	2024-10-17 16:43:03.941984+08	2024-10-18 16:43:03+08	2	53f01ec411134e7486a504ae27e61f31
46	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcyOTI0MjUzMywiaWF0IjoxNzI5MTU2MTMzLCJqdGkiOiJmMjRhYWY1NWQwN2E0NGMzYTAxNGFiMmEzYjE4YzQ1ZSIsInVzZXJfaWQiOjJ9.WoGlfqjbBr_cMuNn1MaliuVtsQABVviVxaqUKAJutvU	2024-10-17 17:08:53.049831+08	2024-10-18 17:08:53+08	2	f24aaf55d07a44c3a014ab2a3b18c45e
47	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcyOTI0MjcxOCwiaWF0IjoxNzI5MTU2MzE4LCJqdGkiOiIyNDYxZjJkNTBmYzQ0OWEyOWJiZjFiYmI1ODNlMzIyZiIsInVzZXJfaWQiOjJ9.ynFSA_0TBwDyj8_q6hhpqIinxn8SRY9Ow-wKKHMFGI0	2024-10-17 17:11:58.062629+08	2024-10-18 17:11:58+08	2	2461f2d50fc449a29bbf1bbb583e322f
48	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcyOTI0MjkyMSwiaWF0IjoxNzI5MTU2NTIxLCJqdGkiOiJjYzU2Y2ZiMGI4MGE0NzhmYjgxZmJjMTM5ODRlZWJjMCIsInVzZXJfaWQiOjJ9.l0f41C8xwtZ57fqKmrV1CKs_NRKpBGmNPBajcAa0cVg	2024-10-17 17:15:21.276932+08	2024-10-18 17:15:21+08	2	cc56cfb0b80a478fb81fbc13984eebc0
49	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcyOTI0MzE4OCwiaWF0IjoxNzI5MTU2Nzg4LCJqdGkiOiJhZDE3ZmZhOTIzNzE0ZTRhYmVhNjBkNWNjMzNlODk4NCIsInVzZXJfaWQiOjJ9.881lTBnhBhdbj3GHTwu_7WQ_obyskUmwIy3puAqx_7k	2024-10-17 17:19:48.481512+08	2024-10-18 17:19:48+08	2	ad17ffa923714e4abea60d5cc33e8984
50	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcyOTI0MzMxOSwiaWF0IjoxNzI5MTU2OTE5LCJqdGkiOiIzYzYxZDg3MjYzYzY0NzkwYTRjYWFiMzQ0MGQ2MGYxOSIsInVzZXJfaWQiOjJ9.a7T-HS94nP227UVLsLmaafwqslMqIvHUdih4fYwnGdU	2024-10-17 17:21:59.653047+08	2024-10-18 17:21:59+08	2	3c61d87263c64790a4caab3440d60f19
51	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcyOTI0MzY5MiwiaWF0IjoxNzI5MTU3MjkyLCJqdGkiOiJlM2EzZGVmODQ5YjI0N2U4YWU5N2M0MzcyNWU3Njg2ZiIsInVzZXJfaWQiOjJ9.Z5FSaUIb4WR8tErpT6e5ScSOhOWYzlVPqwivlvCKNOM	2024-10-17 17:28:12.686642+08	2024-10-18 17:28:12+08	2	e3a3def849b247e8ae97c43725e7686f
52	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcyOTI0Mzc4MCwiaWF0IjoxNzI5MTU3MzgwLCJqdGkiOiI1YWU4ZDY3YjdlMGI0ZmRlOTVkY2E4OWRiMzllODIwYyIsInVzZXJfaWQiOjJ9.gcud8T8naKFZKoRrtOnRUQs2zmBPrWAPXHuoiC8EJE0	2024-10-17 17:29:40.178704+08	2024-10-18 17:29:40+08	2	5ae8d67b7e0b4fde95dca89db39e820c
53	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcyOTI0NDEwNCwiaWF0IjoxNzI5MTU3NzA0LCJqdGkiOiI1YWI5M2RjNjI0ZjQ0NzlkOTAxYzVhYWI3NjRhZDcyNiIsInVzZXJfaWQiOjJ9.M3MmkDHLm1ra3mnINmC5eIbX2Uk5BSAb1w6GWPhbfII	2024-10-17 17:35:04.089452+08	2024-10-18 17:35:04+08	2	5ab93dc624f4479d901c5aab764ad726
54	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcyOTI0NDI3NiwiaWF0IjoxNzI5MTU3ODc2LCJqdGkiOiJiZDcyOGU5M2U5NDE0OWEyODY5ZDZmMDYwOTFhYTY0YyIsInVzZXJfaWQiOjJ9.lEu-W4_DOZ1uHt6S6rwMe7XvQub5nI3j8V6L0_nLnFk	2024-10-17 17:37:56.918707+08	2024-10-18 17:37:56+08	2	bd728e93e94149a2869d6f06091aa64c
55	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcyOTI0NDQxNSwiaWF0IjoxNzI5MTU4MDE1LCJqdGkiOiJjYjcxOGRkZTBiN2I0MThmYjRkMTc1MjI5MGVlOGNhZCIsInVzZXJfaWQiOjJ9.kcsp5O22OB9daBtBgQLVv1gGllj8ydz-d1OdF-abViU	2024-10-17 17:40:15.689782+08	2024-10-18 17:40:15+08	2	cb718dde0b7b418fb4d1752290ee8cad
56	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcyOTI0NDcyOCwiaWF0IjoxNzI5MTU4MzI4LCJqdGkiOiI2ODU3NmU2ZjhiN2E0OTY1ODFkN2ZiMDhlN2Y3ZTcwZiIsInVzZXJfaWQiOjJ9.cdy60nvVKOMUHGi-_1fjI_eaV4I_QyFRbsmEgSp2Wq8	2024-10-17 17:45:28.570948+08	2024-10-18 17:45:28+08	2	68576e6f8b7a496581d7fb08e7f7e70f
57	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcyOTI0NDk0MCwiaWF0IjoxNzI5MTU4NTQwLCJqdGkiOiJlNTZjNzYyMjJlZGE0ZWIwOWZmYzZjNzFlMzUxNzcxMCIsInVzZXJfaWQiOjJ9.GT56oksDYOFjcxLxA5CYLysB02uETWdZV9RXYs7Gw5Q	2024-10-17 17:49:00.940295+08	2024-10-18 17:49:00+08	2	e56c76222eda4eb09ffc6c71e3517710
58	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcyOTI0NDk4NiwiaWF0IjoxNzI5MTU4NTg2LCJqdGkiOiJjOTMxNTU4ZDI0ODg0M2QyOTczNTg2MDA3NjdjYWM1MyIsInVzZXJfaWQiOjJ9.PAc0VMJQ1DKDY2wZDKnUmm2fyfClcge5y1v8FHRfALw	2024-10-17 17:49:46.049062+08	2024-10-18 17:49:46+08	2	c931558d248843d297358600767cac53
59	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcyOTI0OTgxNCwiaWF0IjoxNzI5MTYzNDE0LCJqdGkiOiIzZTk3YjJiOTEwMjU0MzQxYjBjODQ5NzJmMmMzNTFkOCIsInVzZXJfaWQiOjJ9.oGHpz454xok0xgZZwSiMWKqjiCwxnT3gPSa5cqJgazM	2024-10-17 19:10:14.466697+08	2024-10-18 19:10:14+08	2	3e97b2b910254341b0c84972f2c351d8
60	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcyOTI1MDQxNywiaWF0IjoxNzI5MTY0MDE3LCJqdGkiOiIwNzI4MjM3MGNkNGI0M2E2ODcxMWI5Y2QxNDg5YmYxMyIsInVzZXJfaWQiOjJ9.6Qs10KAZ9f2zUMD7XMVOTfY0hfe41TSq7wMjVUA01kU	2024-10-17 19:20:17.410648+08	2024-10-18 19:20:17+08	2	07282370cd4b43a68711b9cd1489bf13
61	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcyOTI1MTM4NywiaWF0IjoxNzI5MTY0OTg3LCJqdGkiOiJlMmYzZjBlMTBiNmQ0ZmIzOGM0MmFjODVlYmQ1MjVmMiIsInVzZXJfaWQiOjJ9.4M-IDIa3hDCZf3U_IyoJLeDoCFwpRtAR2pK_0gKawyY	2024-10-17 19:36:27.19359+08	2024-10-18 19:36:27+08	2	e2f3f0e10b6d4fb38c42ac85ebd525f2
62	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcyOTI1MTUxOSwiaWF0IjoxNzI5MTY1MTE5LCJqdGkiOiI5ZDNlZWQ4NGYwYWQ0ZDM2YmRlNDM3OGZjMTEzNWUxNyIsInVzZXJfaWQiOjJ9.KfWDEoVZo47WXSt1E5VyHM07bueRr4vupDod6A8Axcg	2024-10-17 19:38:39.49124+08	2024-10-18 19:38:39+08	2	9d3eed84f0ad4d36bde4378fc1135e17
63	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcyOTI1MTYwOCwiaWF0IjoxNzI5MTY1MjA4LCJqdGkiOiIwOWFjMmRkODMzNmY0NWRmYTRmYWNhMjc0YjQ2ODZiYSIsInVzZXJfaWQiOjJ9.-VGWg41OrtN6jo4CCheaRXa1L7vFQAMicCtJ6y9_GB0	2024-10-17 19:40:08.760638+08	2024-10-18 19:40:08+08	2	09ac2dd8336f45dfa4faca274b4686ba
64	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcyOTI1MzY1MSwiaWF0IjoxNzI5MTY3MjUxLCJqdGkiOiJjZDFlMjAwYzE0ZGU0YTUyODk2Yjg0MGZhYTZmN2UyYiIsInVzZXJfaWQiOjJ9.xyI2750GiuBigWWMDU8tMHhtpH3Ve4SPNaVACdUN-rA	2024-10-17 20:14:11.525659+08	2024-10-18 20:14:11+08	2	cd1e200c14de4a52896b840faa6f7e2b
65	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcyOTI1Mzk3MiwiaWF0IjoxNzI5MTY3NTcyLCJqdGkiOiI0ZTA4ODUwZGZkZWM0YjRiODVjYzhmNmIzMzRlM2M0YSIsInVzZXJfaWQiOjJ9.o0FOdmUtB0OPL8G9aN4xbmwpouqU48InnSIRtyEKTWw	2024-10-17 20:19:32.448899+08	2024-10-18 20:19:32+08	2	4e08850dfdec4b4b85cc8f6b334e3c4a
66	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcyOTI1NDA0NiwiaWF0IjoxNzI5MTY3NjQ2LCJqdGkiOiJkYmIxN2RiZTgzZWY0ZTY5ODI2ZDI5MmI1YTRiZjI1NSIsInVzZXJfaWQiOjJ9.s9I3SDLiB4RnycMWAxWTMdKzMM7o9eINVEBHb-qSRV4	2024-10-17 20:20:46.28705+08	2024-10-18 20:20:46+08	2	dbb17dbe83ef4e69826d292b5a4bf255
67	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcyOTI1NzcwNywiaWF0IjoxNzI5MTcxMzA3LCJqdGkiOiJmZDY5ZGI4YzJmMDY0YTdhOTdlYTA5OTY3MmYxNDVkMSIsInVzZXJfaWQiOjJ9.cIj4v7CzUv2EZnsY8Qni0F_Tm1jcq6qaAbGaIN9eyag	2024-10-17 21:21:47.732193+08	2024-10-18 21:21:47+08	2	fd69db8c2f064a7a97ea099672f145d1
68	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcyOTMxODIwMywiaWF0IjoxNzI5MjMxODAzLCJqdGkiOiJjZDc1YWZlODQwMmU0NmEyOTM5Y2YzZThmNDNmZmQ3ZiIsInVzZXJfaWQiOjJ9.CTxxyuO_JMD3l4KSrBO5hLeNHe_BLnjQH1kGI69k_xo	2024-10-18 14:10:03.937797+08	2024-10-19 14:10:03+08	2	cd75afe8402e46a2939cf3e8f43ffd7f
69	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTcyOTMzMjYzNywiaWF0IjoxNzI5MjQ2MjM3LCJqdGkiOiJmNmVjNjNlZTMzNjc0OTlmYjdlNjMzODEyYjYwMDUyYSIsInVzZXJfaWQiOjJ9.PPywfXCOOGsawWXQJcF3xOuHR7hD6qmS4DTI642q7Nk	2024-10-18 18:10:37.981368+08	2024-10-19 18:10:37+08	2	f6ec63ee3367499fb7e633812b60052a
\.


--
-- Data for Name: videos_video; Type: TABLE DATA; Schema: public; Owner: testuser
--

COPY public.videos_video (id, title, description, video_file_url, uploader_id, created_at, thumbnail_url) FROM stdin;
1	New USer	TEst Description2	https://drive.google.com/uc?id=1AeR1Z8NtlMxiGXuyZzhkZHQYmlm8e7td	2	2024-10-17 20:17:13.507774+08	https://drive.google.com/uc?id=1O8vWGBEfdh7KEMkiMdWe0pkOALUwdSRi
2	New USer	TEst Description2	https://drive.google.com/uc?id=1ZhoC9-Dl5uRYRZuSju-I21WC05vS-Op6	2	2024-10-17 20:18:07.659589+08	https://drive.google.com/uc?id=1S4p39yrBcG5fPz_xBtGltB7XYh97SM9Z
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: testuser
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: testuser
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: testuser
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 36, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: testuser
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: testuser
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 5, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: testuser
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: testuser
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: testuser
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 9, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: testuser
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 42, true);


--
-- Name: token_blacklist_blacklistedtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: testuser
--

SELECT pg_catalog.setval('public.token_blacklist_blacklistedtoken_id_seq', 1, false);


--
-- Name: token_blacklist_outstandingtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: testuser
--

SELECT pg_catalog.setval('public.token_blacklist_outstandingtoken_id_seq', 69, true);


--
-- Name: videos_video_id_seq; Type: SEQUENCE SET; Schema: public; Owner: testuser
--

SELECT pg_catalog.setval('public.videos_video_id_seq', 2, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: testuser
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: testuser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: testuser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: testuser
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: testuser
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: testuser
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: testuser
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: testuser
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: testuser
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: testuser
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: testuser
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: testuser
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: testuser
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: testuser
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: testuser
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: testuser
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: testuser
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: token_blacklist_blacklistedtoken token_blacklist_blacklistedtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: testuser
--

ALTER TABLE ONLY public.token_blacklist_blacklistedtoken
    ADD CONSTRAINT token_blacklist_blacklistedtoken_pkey PRIMARY KEY (id);


--
-- Name: token_blacklist_blacklistedtoken token_blacklist_blacklistedtoken_token_id_key; Type: CONSTRAINT; Schema: public; Owner: testuser
--

ALTER TABLE ONLY public.token_blacklist_blacklistedtoken
    ADD CONSTRAINT token_blacklist_blacklistedtoken_token_id_key UNIQUE (token_id);


--
-- Name: token_blacklist_outstandingtoken token_blacklist_outstandingtoken_jti_hex_d9bdf6f7_uniq; Type: CONSTRAINT; Schema: public; Owner: testuser
--

ALTER TABLE ONLY public.token_blacklist_outstandingtoken
    ADD CONSTRAINT token_blacklist_outstandingtoken_jti_hex_d9bdf6f7_uniq UNIQUE (jti);


--
-- Name: token_blacklist_outstandingtoken token_blacklist_outstandingtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: testuser
--

ALTER TABLE ONLY public.token_blacklist_outstandingtoken
    ADD CONSTRAINT token_blacklist_outstandingtoken_pkey PRIMARY KEY (id);


--
-- Name: videos_video videos_video_pkey; Type: CONSTRAINT; Schema: public; Owner: testuser
--

ALTER TABLE ONLY public.videos_video
    ADD CONSTRAINT videos_video_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: testuser
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: testuser
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: testuser
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: testuser
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: testuser
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: testuser
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: testuser
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: testuser
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: testuser
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: testuser
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: testuser
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: testuser
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: testuser
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: token_blacklist_outstandingtoken_jti_hex_d9bdf6f7_like; Type: INDEX; Schema: public; Owner: testuser
--

CREATE INDEX token_blacklist_outstandingtoken_jti_hex_d9bdf6f7_like ON public.token_blacklist_outstandingtoken USING btree (jti varchar_pattern_ops);


--
-- Name: token_blacklist_outstandingtoken_user_id_83bc629a; Type: INDEX; Schema: public; Owner: testuser
--

CREATE INDEX token_blacklist_outstandingtoken_user_id_83bc629a ON public.token_blacklist_outstandingtoken USING btree (user_id);


--
-- Name: videos_video_uploader_id_cc735351; Type: INDEX; Schema: public; Owner: testuser
--

CREATE INDEX videos_video_uploader_id_cc735351 ON public.videos_video USING btree (uploader_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: testuser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: testuser
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: testuser
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: testuser
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: testuser
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: testuser
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: testuser
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: testuser
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: testuser
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: token_blacklist_blacklistedtoken token_blacklist_blacklistedtoken_token_id_3cc7fe56_fk; Type: FK CONSTRAINT; Schema: public; Owner: testuser
--

ALTER TABLE ONLY public.token_blacklist_blacklistedtoken
    ADD CONSTRAINT token_blacklist_blacklistedtoken_token_id_3cc7fe56_fk FOREIGN KEY (token_id) REFERENCES public.token_blacklist_outstandingtoken(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: token_blacklist_outstandingtoken token_blacklist_outs_user_id_83bc629a_fk_auth_user; Type: FK CONSTRAINT; Schema: public; Owner: testuser
--

ALTER TABLE ONLY public.token_blacklist_outstandingtoken
    ADD CONSTRAINT token_blacklist_outs_user_id_83bc629a_fk_auth_user FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: videos_video videos_video_uploader_id_cc735351_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: testuser
--

ALTER TABLE ONLY public.videos_video
    ADD CONSTRAINT videos_video_uploader_id_cc735351_fk_auth_user_id FOREIGN KEY (uploader_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

