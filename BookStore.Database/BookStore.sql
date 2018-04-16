--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

CREATE DATABASE "BookStore" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.utf8' LC_CTYPE = 'en_US.utf8';

\connect "BookStore"

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: author; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE author (
    id integer NOT NULL,
    name character varying(100)
);


ALTER TABLE author OWNER TO postgres;

--
-- Name: book; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE book (
    id integer NOT NULL,
    isbn character varying(20),
    name character varying(200),
    description character varying(500),
    published_date timestamp without time zone,
    price integer,
    stock integer,
    category_id character varying(10),
    author_id integer
);


ALTER TABLE book OWNER TO postgres;

--
-- Name: category; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE category (
    id character varying(10) NOT NULL,
    name character varying(100)
);


ALTER TABLE category OWNER TO postgres;

--
-- Name: customer; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE customer (
    id integer NOT NULL,
    name character varying(100),
    address character varying(100),
    city character varying(100),
    postal_code character varying(5)
);


ALTER TABLE customer OWNER TO postgres;

--
-- Name: order; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "order" (
    id integer NOT NULL,
    customer_id integer,
    order_on timestamp without time zone,
    amount integer
);


ALTER TABLE "order" OWNER TO postgres;

--
-- Name: order_item; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE order_item (
    id integer NOT NULL,
    order_id integer,
    book_id integer,
    quantity integer,
    price integer
);


ALTER TABLE order_item OWNER TO postgres;

--
-- Data for Name: author; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY author (id, name) FROM stdin;
5	wahana komputer 
7	jogiyanto HM. 
382	Robert D. Mason
412	James T. McClave
667	Wing Wahyu Winarno
701	Thomas Pyzdek
816	Noor Ms Bakry
847	Muhammad
887	Mudrajad Kuncoro
1030	Fandy Tjiptono
1144	Hamdy A. Taha
1145	Soehardi Sigit
1146	Suratman
1165	Donald R. Cooper
1520	S. Nasution
1592	Sutrisno Hadi
1700	P. J. Suwarno
1877	Stewart V. Hoover
2135	Lembaga Penelitian Unair
2212	Morissan
2439	Wahyu Wibowo
2859	Jonathan Sarwono
2889	Joseph F. Hair
3102	uma Sekaran
3329	Nur Iriawan
3358	Triton Prawira Budi
3362	Murti Sumarni
3374	I Made Wirartha
3375	Suliyanto
3454	Anwar Sanusi
3566	Dermawan Wibisono
3816	Jong Jek Siang
3997	Himpunan Evaluasi Pendidikan UNY
4203	Kenneth S. Bordens
4306	John W. Creswell
4471	M. Ridho Syabibi
4476	John J. Shaughnessy
4485	Ida Bagoes Mantra
4490	Neil J. Salkind
4508	H.A. Oramahi
4510	 Hartono
4901	Imam Robandi
5408	Rebecca B. Rubin
5437	J. Supranto
6024	willy abdillah
6258	supriyanto 
6524	Moh. Nazir
6827	Haryadi Sarjono
6829	Imam  Gunawan
6830	Supranto 
6832	deni darmawan
6834	Sugiyono 
6878	Sukandarrumidi 
6961	Sukestiyarno 
7026	Mohammad Farhan Qudratullah
7029	Sumanto 
7136	Victorianus Aries Siswanto
7165	Urip Santoso
7173	Sunardi 
7213	 Yuliansyah
7270	Anis Fuad
7498	W. Lawrence Neuman
7516	 Suwartono
7649	Husaini Usman
7653	 Mardalis
7657	Cholid Narbuko
7704	M. Berndtsson
7848	Mahfud Sholihin
7914	Sudaryono 
8007	Duwi Priyatno
8065	Tedi Rusman
8080	Shalin Hai-Jew
8174	William Chang
8207	Patrisius Istiarto Djiwandono
8261	M.Burhan Bungin
8264	M. Djunaidi Ghony
8266	Andi Prastowo
8270	Rulam Ahmadi
8271	 Eriyanto
8272	A. Muri Yusuf
8294	Abuzar Asra
8334	Nanang Martono
8402	Sylvia Saraswati
8436	Haris Herdiansyah
8563	I Ketut Swarjana
8572	M. Sopiyudin Dahlan
8576	Akhyar Yusuf Lubis
8585	Syofian Siregar
8601	 Afrizal
8700	Kemas Ali Hanafiah
8707	Yuming Lin
8925	Nurlina T. Muhyiddin
8985	Momon Sudarma
9093	Ardial 
9156	Sari Wahyuni
9170	Samiaji Sarosa
9173	Yusuf Zainal Abidin
9199	Nusa  Putra
9225	Grahita Chandrarin
9299	Jonathan Lazar
9459	Riduwan 
9462	Hamid Patilima
\.


--
-- Data for Name: book; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY book (id, isbn, name, description, published_date, price, stock, category_id, author_id) FROM stdin;
123	0029467500	Operations Research; An Introduction Fourth Edition		2011-11-01 13:22:36.967	100	20	001.4	1144
124	0201168804	Simulation: a Problem-Solving Approach		2013-11-15 12:53:27.883	100	20	001.432	1877
125	9780071266369	Research Design and Methods: A Process Approach, 7e		2016-10-03 13:51:55.88	100	20	001.42	4203
126	9780128053904	Research Methods in Human-Computer Interaction, 2nd Edition		2017-11-22 10:21:59.233	100	20	001.42	9299
127	9780135025536	Exploring Research, 7e		2018-01-19 08:08:05.003	100	20	001.4	4490
128	9780321645111	Statistics for Business and Economics (11th Edition)		2017-03-02 15:23:51.077	100	20	001.422	412
129	9780495793441	Communication Research: Strategies and Sources, 7ed		2016-09-22 14:37:03.64	100	20	001.4	5408
130	9781119165552	Research Methods For Business: A Skill Building Approach		2017-10-25 12:03:07.167	100	20	001.42	3102
131	9781292020235	Social Research Methods : Qualitative and Quantitative Approaches		2015-06-04 13:34:42.427	100	20	001.42	7498
132	9781292021904	Multivariate Data Analysis : Pearson New International Edition		2017-12-04 09:44:28.813	100	20	001.42	2889
133	9781452274614	Research Design : Qualitative, Quantitative, and Mixed Methods Approaches, fourth edition		2017-02-27 14:57:11.557	100	20	001.42	4306
134	9781466644625	Packaging Digital Information for Enhanced Learning and Analysis: Data Visualization, Spatialization, and Multidimensionality		2017-03-18 12:06:54.033	100	20	001.4226	8080
135	9781848000087	Thesis Projects : A Guide for Students in Computer Science and Information Systems, 2nd Edition		2017-03-02 14:55:55.24	100	20	001.42	7704
136	9786020946375	Metode Penelitian Survei		2017-12-02 10:34:48.453	100	20	001.42	8294
137	9786021186015	Metode Penelitian Kuantitatif, Kualitatif Dan Penelitian Gabungan		2017-10-13 14:19:04.82	100	20	001.42	8272
138	9786021286173	Menulis Skripsi / Tesis dalam 60 Hari		2016-05-30 15:26:34.787	100	20	001.42	887
139	9786021521434	Petunjuk Praktis Penelitian Ilmiah Untuk Menyusun Skripsi, Tesis dan Disertasi		2017-07-06 13:20:01.2	100	20	001.42	6830
140	9786022172611	Paradigma dan Model Penelitian Komunikasi		2017-10-03 14:04:42.147	100	20	001.42	9093
141	9786022172840	Metode Penelitian Kualitatif: Teori & Praktik		2018-04-02 13:53:40.23	100	20	001.42	6829
142	9786022295846	Research Design: Pendekatan Metode Kualitatif, Kuantitatif, dan Campuran (Edisi 4)		2018-01-11 10:49:01.687	100	20	001.42	4306
143	9786022419952	Metodologi Penulisan Ilmiah : Teknik Penulisan Esai, Skripsi, Tesis dan Disertasi untuk Mahasiswa		2017-04-05 15:33:24.097	100	20	001.42	8174
144	9786022620303	Petunjuk Praktis Penyusunan Dokumen		2015-08-20 12:55:23.423	100	20	001.42	7173
145	9786022621492	Panduan Praktis Penelitian Kualitatif		2017-02-06 13:29:06.94	100	20	001.42	7270
146	9786022622574	Metodologi Penelitian Geografi		2017-09-22 15:04:37.827	100	20	001.42	8985
147	9786022624844	Kiat Menyusun Proposal Penelitian		2017-05-31 11:50:20.143	100	20	001.42	7165
148	9786022625339	Statistika Penelitian : Aplikasinya dengan SPSS		2017-07-17 09:58:07.257	100	20	001.422	8065
149	9786022710431	Menelaah Validitas Penelitian Observasional (Seri-19)		2017-01-18 10:21:13.327	100	20	001.42	8572
150	9786022806516	Meneliti Itu Tidak Sulit : Metodologi Penelitian Sosial dan Pendidikan Bahasa		2016-11-21 14:39:56.777	100	20	001.42	8207
151	9786024250980	Metodologi Penelitian		2017-10-13 14:50:47.027	100	20	001.42	7914
152	9786027825390	Metode Penelitian Hukum : Dilengkapi Tata Cara & Contoh Penulisan Karya Ilmiah Bidang Hukum		2018-03-27 11:28:43.347	100	20	001.42	1146
153	9786027825666	Metode Penelitian Manajemen : Pendekatan Kuantitatif, Kualitatif, Kombinasi (Mixed Methods), Penelitian Tindakan (Action Research), Penelitian Evaluasi		2018-03-27 09:52:28.76	100	20	001.42	6834
154	9786027825840	Cara Mudah Menyusun : Skripsi, Tesis, dan Disertasi		2018-04-02 13:53:40.047	100	20	001.42	6834
155	9786027874824	Metodologi Penelitian Kualitatif		2017-11-27 10:36:48.867	100	20	001.42	8270
156	9786027985018	Metodologi Penelitian Kuantitatif		2017-12-19 09:35:01.887	100	20	001.42	8261
157	9786028055062	Metodologi Penelitian Psikologi		2017-01-16 14:19:12.973	100	20	001.42	4476
158	9786028055512	SPSS 16.0 : Analisis Data Statistika dan Penelitian		2017-12-02 11:29:37.41	100	20	001.422	4510
159	9786028361125	Metode dan Teknik Menyusun Proposal Penelitian : Untuk Mahasiswa S-1, S-2 dan S-3		2018-03-27 09:38:49.72	100	20	001.42	9459
160	9786028545174	Teknik Mudah dan Cepat Melakukan Analisis Data Penelitian Dengan SPSS dan Tanya Jawab Ujian Pendadaran		2017-05-12 08:43:45.697	100	20	001.4	8007
161	9786028730662	Analisis Isi : pengantar Metodologi Untuk Penelitian Ilmu Komunikasi & Ilmu-Ilmu Sosial Lainnya		2018-03-16 09:56:42.1	100	20	001.42	8271
162	9786028730990	Metode Penelitian Survei		2017-12-20 14:10:55.973	100	20	001.42	2212
163	9786029324402	Statistika Deskriptif (Untuk Mahasiswa, Dosen dan Umum)		2017-10-27 11:33:40.54	100	20	001.4	7029
164	9786029413700	Metode Penelitian Kuantitatif: Dilengkapi dengan Perbandingan Perhitungan Manual & SPSS		2018-02-26 09:54:36.043	100	20	001.42	8585
165	9786029413755	Metodologi Penelitian Sosial & Ekonomi: Format-format Kuantitatif dan Kualitatif untuk Studi Sosiologi, Kebijakan Publik, Komunikasi, Manajemen, dan Pemasaran		2016-11-29 14:22:18.12	100	20	001.42	8261
166	9789790103139	Tata Permainan Bahasa: Karya Tulis Ilmiah		2017-10-03 09:50:17.14	100	20	001.42	2439
167	9789790104280	Metodologi Penelitian Sosial Ed.2		2017-10-03 14:48:32.35	100	20	001.42	7649
168	9789790612051	Metodologi Penelitian Bisnis		2018-03-05 09:39:43.92	100	20	001.42	3454
169	9789790615540	Structural Equation Modeling : Sebuah Pengantar, Aplikasi untuk Penelitian Bisnis		2017-09-14 09:41:29.273	100	20	001.422	6827
170	9789790615694	Qualitative Research Method : Theory And Practice, E2		2017-10-09 14:17:01.47	100	20	001.42	9156
171	9789790615786	Manajemen dan Analisis Data Kualitatif dengan Perangkat Lunak NVivo		2015-07-13 12:31:50.91	100	20	001.42	7213
172	9789790616622	Metode Penelitian Bisnis Buku 2 Edisi 12		2018-01-19 08:08:04.927	100	20	001.42	1165
173	9789790617438	Metodologi Penelitian Ekonomi dan Sosial:Teori,Konsep, dan Rencana Proposal		2018-02-23 09:51:58.247	100	20	001.42	8925
174	9789790617452	Metode Penelitian untuk Bisnis (e6) 1		2018-01-19 08:08:04.893	100	20	001.42	3102
175	9789790617469	Metode Penelitian untuk Bisnis (e6) 2		2018-01-19 08:08:04.91	100	20	001.42	3102
176	9789790617711	Metode Riset Akuntansi : Pendekatan Kuantitatif		2018-03-16 09:03:31.97	100	20	001.42	9225
177	9789790620926	Metodologi Riset Bisnis		2015-03-18 12:13:57.57	100	20	001.42	6258
178	9789790624306	Metode Riset Campur Sari		2017-10-17 10:36:39.03	100	20	001.42	9199
179	9789790625204	Metodologi Penelitian Sosial : Pendekatan Kualitatif dan Kuantitatif, ed.7		2017-11-20 15:21:25.157	100	20	001.42	7498
180	9789790625471	PENELITIAN KUALITATIF DASAR-DASAR EDISI 2		2017-10-13 14:01:00.23	100	20	001.42	9170
181	9789790765610	Metode Penelitian Komunikasi: Penelitian Kuantitatif Teori & Aplikasi		2017-12-22 10:59:32.043	100	20	001.42	9173
182	9789792545982	Cara Mudah Menyusun Proposal, Skripsi, Tesis, Disertasi		2018-03-28 12:00:03.113	100	20	001.42	8402
183	9789792548358	Memahami Metode-Metode Penelitian : Suatu Tinjauan Teoritis & praktis		2018-03-10 11:14:09.16	100	20	001.42	8266
184	9789792548501	Metode Penelitian Kualitatif: Dalam Perspektif Rancangan Penelitian		2018-02-06 15:33:44.54	100	20	001.42	8266
185	9789792548655	Metode Penelitian Bahasa		2016-12-28 11:07:28.76	100	20	001.42	847
186	9789792549294	Metodologi Penelitian Kualitatif, ed.revisi		2017-02-06 13:29:06.753	100	20	001.42	8264
187	9789792900415	Metode Riset Untuk Desain Komunikasi Visual		2018-03-03 12:54:27.133	100	20	001.42	2859
188	9789792902075	Mudah Menulis Karya Ilmiah Dengan Ednote X		2014-03-10 13:58:57.447	100	20	001.42	667
189	9789792903645	Becoming The Winner: Riset, Menulis Ilmiah, Publikasi Ilmiah, dan Presentasi		2016-02-03 14:44:15.69	100	20	001.42	4901
190	9789792903751	Metodologi Penelitian Sistem Informasi : Pedoman dan Contoh Melakukan Penelitian di Bidang Sistem Teknologi Informasi		2018-03-28 15:19:21.34	100	20	001.4	7
191	9789792921243	Strategi Melakukan Riset : Kuantitatif, Kualitatif, Gabungan		2016-12-07 12:54:58.35	100	20	001.42	2859
192	9789792923346	Dasar-dasar Metodologi Penelitian		2018-03-28 12:00:03.473	100	20	001.42	7516
193	9789792923360	Statistika Dasar		2018-03-22 14:43:42.98	100	20	001.4	6961
194	9789792938746	Panduan Penyusunan Skripsi, Tesis & Disertasi		2018-03-28 15:23:50.077	100	20	001.42	3566
195	9789792942675	Analisis SEM-PLS dengan Warp PLS 3.0 untuk Hubungan Non linier dalam Penelitian Sosial dan Bisnis + CD		2017-12-06 08:32:50.253	100	20	001.4	7848
196	9789792943481	Eviews: Cara Operasi Dan Prosedur Analisis		2016-09-16 08:53:43.953	100	20	001.422	2859
197	9789792950281	Metodologi Riset Di Bidang TI (Panduan Praktis, Teori dan Contoh Kasus)		2018-02-20 10:21:39.52	100	20	001.42	7914
198	9789792950847	Membuat Skripsi, Tesis, Dan Disertasi dengan Partial Least Square SEM ( PLS-SEM)		2018-01-03 08:33:58.15	100	20	001.42	2859
199	9789792952162	Partial Least Square (PLS) :  Alternatif Structural Equation Modeling (SEM) Dalam Penelitian Bisnis		2018-03-22 13:14:47.42	100	20	001.4	6024
200	9789792954470	Metodologi Penelitian Kesehatan Edisi Revisi		2017-01-17 14:23:13.553	100	20	001.42	8563
201	9789793477503	Filsafat Penelitian dan Metode Penelitian Sosial		2017-09-28 15:35:58.947	100	20	001.42	4485
202	9789793925882	Penelitian Kualitatif : Komunikasi Ekonomi Kebijakan Publik dan Ilmu Sosial Lainnya, ed.2		2017-10-25 14:09:02.813	100	20	001.42	8261
203	9789794205082	Metodologi Penelitian: Petunjuk Praktis Untuk Peneliti Pemula		2018-03-26 14:02:18.637	100	20	001.42	6878
204	9789794501733	Metode Penelitian		2018-03-28 12:00:16.823	100	20	001.42	6524
205	9789794501735	Metode Penelitian		2018-01-23 10:59:18.117	100	20	001.42	6524
206	9789795260165	Metode Penelitian Suatu Pendekatan Proposal		2017-11-23 14:02:10.22	100	20	001.42	7653
207	9789795262039	Buku Penuntun Pembuatan Tesis, Skripsi, Disertasi, Makalah		2017-11-15 12:39:49.567	100	20	001.42	1520
208	9789795262350	Metode Research (Penelitian Ilmiah)		2017-03-13 08:50:55.29	100	20	001.4	1520
209	9789795262351	Metode research (penelitian ilmiah)		2017-08-08 09:53:54.39	100	20	001.42	1520
210	9789796911103	The Six Sigma Handbook Panduan lengkap untuk Greenbelt, Blackbelts, dan manajer pada semua tingkat		2013-09-19 14:00:56.35	100	20	001.44	701
211	9789796921454	Metode Penelitian Kuantitatif		2018-01-19 08:08:04.86	100	20	001.42	6832
212	9789797310165	Kiat Jitu Sukses Menyusun Skripsi		2017-09-18 09:43:14.383	100	20	001.42	3816
213	9789797314576	Bimbingan Menulis Skripsi dan Thesis Jilid 2		2016-04-07 15:18:53.79	100	20	001.42	1592
214	9789797317126	Kiat Jitu Menyusun Skripsi Jurusan Informatika/Komputer		2014-09-30 13:22:58.733	100	20	001.42	3816
215	9789797568559	Strategi dan Langkah-langkah Penelitian		2016-11-02 09:43:37.583	100	20	001.42	7136
216	9789797631116	Mengolah Data Statistik dengan Mudah Menggunakan Minitab 14		2012-03-19 15:29:53.127	100	20	001.422	3329
217	9789797631154	SPSS 13.0 Terapan; Riset Statistik Parametrik		2017-03-17 10:47:18.983	100	20	001.422	3358
218	9789797631390	Metodologi Penelitian Bisnis		2018-01-22 15:38:28.88	100	20	001.42	3362
219	9789797631536	Metode Riset Bisnis		2014-03-19 15:02:54.43	100	20	001.42	3375
220	9789797631659	Pedoman Penulisan Usulan Penelitian, Skripsi dan Tesis		2018-03-28 12:00:03.297	100	20	001.42	3374
221	9789797633271	Kiat Jitu Menyusun Skripsi Jurusan Informatika / Komputer		2017-12-09 10:32:07.477	100	20	001.42	3816
222	9789797635893	Panduan Aplikatif Menyusun Tulisan Ilmiah Dengan Microsoft Word 2003		2015-10-07 08:22:45.717	100	20	001.42	5
223	9789797694883	Rancangan Percobaan Teori & Aplikasi		2017-02-09 15:24:36.283	100	20	001.42	8700
224	9789797696115	Wawancara, Observasi, dan Focus Groups : Sebagai Instrumen Penggalian Data Kualitatif		2017-07-20 09:58:11.133	100	20	001.42	8436
225	9789797696870	Teori Dan Metodologi Ilmu Pengetahuan Sosial Budaya Kontemporer		2017-01-18 11:18:21.2	100	20	001.01	8576
226	9789797697303	Metode Penelitian Kualitatif		2017-07-31 08:50:05.8	100	20	001.42	8601
227	9789797697495	Metode Penelitian Kuantitatif : Analisis Isi dan Analisis Data Sekunder		2018-03-28 12:00:12.383	100	20	001.42	8334
228	9789798433559	Metode Penelitian Kualitatif		2018-03-27 11:44:43.057	100	20	001.42	9462
229	9789798547539	Statistika		2018-04-02 10:14:50.88	100	20	001.4	7026
230	9789813100442	Opinion Analysis for Online Review : East China Normal University Scientific Reports Vol.4 (Subseries on Data Science and Engineering)		2017-03-20 14:48:34.633	100	20	001.4	8707
231	9792120084	Pengantar Metodologi Penelitian Sosial-Bisnis-Manajemen		2014-06-03 10:21:10.483	100	20	001.42	1145
232	9792120308	Materi Pelatihan Structural Equation Modeling ( Pemodelan Persamaan Struktural ) Angkatan V		2010-05-25 10:16:38.2	100	20	001.42	2135
233	9792120315	Pancasila: Uraian Singkat Ajaran Pancasila dan Soal Jawab Pancasila untuk Persiapan Ujian Negara Perguruan Tinggi Swasta		2015-10-01 12:34:29.87	100	20	001.432	816
234	979411387526010	Teknik Statistika untuk Bisnis dan Ekonomi		2010-08-13 13:34:41.403	100	20	001.422	382
235	9794971235	Hamengku Buwono IX dan Sistem Birikrasi Pemerintahan Yogyakarta 1942-1974		2012-03-17 12:41:42.3	100	20	001.432	1700
236	979526107X	Metodologi Penelitian : Memberi bekal teoretis pada mahasiswa tentang metodologi penelitian serta diharapkan dapat melaksanakan penelitian dengan langkah-langkah yang benar		2017-11-24 08:51:11.83	100	20	001.42	7657
237	979533641x	Strategi Riset Lewat Internet		2014-05-22 13:56:12.81	100	20	001.42	1030
238	9796880679	Statistik Teori dan Aplikasi		2017-07-06 13:20:01.14	100	20	001.422	5437
239	979731457X	Bimbingan Menulis Skripsi dan Thesis Jilid 1		2017-10-25 14:08:43.073	100	20	001.42	1592
240	9799398096	Studi Kelayakan Proyek: Teknik dan Prosedur Penyusunan Laporan		2016-08-18 15:03:09.333	100	20	001.432	1146
241	9799791118834	Analisis Data Dengan SPSS & SAS		2015-06-04 14:16:23.427	100	20	001.422	4508
242	JUR-31	Jurnal Penelitian dan Evaluasi Pendidikan, No.1 Tahun VIII, 2006		2010-05-25 10:16:38.2	100	20	001.4	3997
243	JUR-32	Jurnal Penelitian dan Evaluasi Pendidikan, No 2, Tahun VIII, 2006		2010-05-25 10:16:38.2	100	20	001.4	3997
245	0029467500X	Operations Research; An Introduction Fourth Edition TESSS	NULL	2018-04-04 00:00:00	100	20	001.4	1144
246	0029467500X	Operations Research; An Introduction Fourth Edition TESSS	NULL	2018-04-04 00:00:00	100	20	001.4	1144
247	0029467500X	Operations Research; An Introduction Fourth Edition TESSS API gateway	NULL	2018-04-04 00:00:00	100	20	001.4	1144
\.


--
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY category (id, name) FROM stdin;
001.01	Theory of Knowledge/Teori Ilmu Pengetahuan
001.4	Research
001.42	Research Methods/Metode Penelitian
001.422	Statistical Methods
001.4226	Presentation of statistical data
001.432	Historical method: include case studies
001.44	Support Of And Incentives For Research
\.


--
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY customer (id, name, address, city, postal_code) FROM stdin;
2	Ana Trujillo Emparedados y helados	Avda. de la Constitución 2222	México D.F.	05021
3	Antonio Moreno Taquería	Mataderos  2312	México D.F.	05023
6	Blauer See Delikatessen	Forsterstr. 57	Mannheim	68306
7	Blondesddsl père et fils	24, place Kléber	Strasbourg	67000
8	Bólido Comidas preparadas	C/ Araquil, 67	Madrid	28023
9	Bon app'	12, rue des Bouchers	Marseille	13008
12	Cactus Comidas para llevar	Cerrito 333	Buenos Aires	1010
13	Centro comercial Moctezuma	Sierras de Granada 9993	México D.F.	05022
14	Chop-suey Chinese	Hauptstr. 29	Bern	3012
17	Drachenblut Delikatessen	Walserweg 21	Aachen	52066
18	Du monde entier	67, rue des Cinquante Otages	Nantes	44000
20	Ernst Handel	Kirchgasse 6	Graz	8010
22	FISSA Fabrica Inter. Salchichas S.A.	C/ Moralzarzal, 86	Madrid	28034
23	Folies gourmandes	184, chaussée de Tournai	Lille	59000
25	Frankenversand	Berliner Platz 43	München	80805
26	France restauration	54, rue Royale	Nantes	44000
27	Franchi S.p.A.	Via Monte Bianco 34	Torino	10100
28	Furia Bacalhau e Frutos do Mar	Jardim das rosas n. 32	Lisboa	1675
29	Galería del gastrónomo	Rambla de Cataluña, 23	Barcelona	08022
30	Godos Cocina Típica	C/ Romero, 33	Sevilla	41101
32	Great Lakes Food Market	2732 Baker Blvd.	Eugene	97403
33	GROSELLA-Restaurante	5ª Ave. Los Palos Grandes	Caracas	1081
35	HILARION-Abastos	Carrera 22 con Ave. Carlos Soublette #8-35	San Cristóbal	5022
36	Hungry Coyote Import Store	City Center Plaza 516 Main St.	Elgin	97827
37	Hungry Owl All-Night Grocers	8 Johnstown Road	Cork	NULL
39	Königlich Essen	Maubelstr. 90	Brandenburg	14776
40	La corne d'abondance	67, avenue de l'Europe	Versailles	78000
41	La maison d'Asie	1 rue Alsace-Lorraine	Toulouse	31000
43	Lazy K Kountry Store	12 Orchestra Terrace	Walla Walla	99362
44	Lehmanns Marktstand	Magazinweg 7	Frankfurt a.M.	60528
45	Let's Stop N Shop	87 Polk St. Suite 5	San Francisco	94117
46	LILA-Supermercado	Carrera 52 con Ave. Bolívar #65-98 Llano Largo	Barquisimeto	3508
47	LINO-Delicateses	Ave. 5 de Mayo Porlamar	I. de Margarita	4980
48	Lonesome Pine Restaurant	89 Chiaroscuro Rd.	Portland	97219
49	Magazzini Alimentari Riuniti	Via Ludovico il Moro 22	Bergamo	24100
52	Morgenstern Gesundkost	Heerstr. 22	Leipzig	04179
54	Océano Atlántico Ltda.	Ing. Gustavo Moncada 8585 Piso 20-A	Buenos Aires	1010
55	Old World Delicatessen	2743 Bering St.	Anchorage	99508
56	Ottilies Käseladen	Mehrheimerstr. 369	Köln	50739
57	Paris spécialités	265, boulevard Charonne	Paris	75012
58	Pericles Comidas clásicas	Calle Dr. Jorge Cash 321	México D.F.	05033
59	Piccolo und mehr	Geislweg 14	Salzburg	5020
60	Princesa Isabel Vinhos	Estrada da saúde n. 58	Lisboa	1756
63	QUICK-Stop	Taucherstraße 10	Cunewalde	01307
64	Rancho grande	Av. del Libertador 900	Buenos Aires	1010
65	Rattlesnake Canyon Grocery	2817 Milton Dr.	Albuquerque	87110
66	Reggiani Caseifici	Strada Provinciale 124	Reggio Emilia	42100
68	Richter Supermarkt	Grenzacherweg 237	Genève	1203
69	Romero y tomillo	Gran Vía, 1	Madrid	28001
70	Santé Gourmet	Erling Skakkes gate 78	Stavern	4110
71	Save-a-lot Markets	187 Suffolk Ln.	Boise	83720
73	Simons bistro	Vinbæltet 34	Kobenhavn	1734
74	Spécialités du monde	25, rue Lauriston	Paris	75016
75	Split Rail Beer & Ale	P.O. Box 555	Lander	82520
77	The Big Cheese	89 Jefferson Way Suite 2	Portland	97201
78	The Cracker Box	55 Grizzly Peak Rd.	Butte	59801
79	Toms Spezialitäten	Luisenstr. 48	Münster	44087
80	Tortuga Restaurante	Avda. Azteca 123	México D.F.	05033
82	Trail's Head Gourmet Provisioners	722 DaVinci Blvd.	Kirkland	98034
83	Vaffeljernet	Smagsloget 45	Århus	8200
84	Victuailles en stock	2, rue du Commerce	Lyon	69004
85	Vins et alcools Chevalier	59 rue de l'Abbaye	Reims	51100
86	Die Wandernde Kuh	Adenauerallee 900	Stuttgart	70563
87	Wartian Herkku	Torikatu 38	Oulu	90110
89	White Clover Markets	305 - 14th Ave. S. Suite 3B	Seattle	98128
90	Wilman Kala	Keskuskatu 45	Helsinki	21240
1	Alfreds Futterkiste	Obere Str. 57	Berlin	12209
\.


--
-- Data for Name: order; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "order" (id, customer_id, order_on, amount) FROM stdin;
1	1	2018-04-01 00:00:00	10000
2	2	2018-04-02 00:00:00	20000
3	3	2018-04-03 00:00:00	30000
4	1	2018-04-04 00:00:00	40000
6	6	2018-04-06 00:00:00	60000
8	8	2018-04-08 00:00:00	80000
5	7	2018-04-05 00:00:00	50000
9	7	2018-04-09 00:00:00	90000
10	7	2018-04-10 00:00:00	100000
7	12	2018-04-07 00:00:00	70000
11	1	2018-04-12 00:00:00	50000
12	7	2018-04-12 00:00:00	150000
\.


--
-- Data for Name: order_item; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY order_item (id, order_id, book_id, quantity, price) FROM stdin;
\.


--
-- Name: author_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY author
    ADD CONSTRAINT author_pkey PRIMARY KEY (id);


--
-- Name: book_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY book
    ADD CONSTRAINT book_pkey PRIMARY KEY (id);


--
-- Name: category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- Name: customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (id);


--
-- Name: order_item_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY order_item
    ADD CONSTRAINT order_item_pkey PRIMARY KEY (id);


--
-- Name: order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "order"
    ADD CONSTRAINT order_pkey PRIMARY KEY (id);


--
-- Name: book_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY book
    ADD CONSTRAINT book_fk FOREIGN KEY (author_id) REFERENCES author(id);


--
-- Name: book_fk1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY book
    ADD CONSTRAINT book_fk1 FOREIGN KEY (category_id) REFERENCES category(id);


--
-- Name: order_item_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY order_item
    ADD CONSTRAINT order_item_fk FOREIGN KEY (order_id) REFERENCES "order"(id) ON DELETE CASCADE;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

