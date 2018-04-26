--
-- PostgreSQL database dump
--

-- Dumped from database version 10.3
-- Dumped by pg_dump version 10.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: object; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.object (
    id integer NOT NULL,
    label text
);


ALTER TABLE public.object OWNER TO postgres;

--
-- Name: object_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.object_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.object_id_seq OWNER TO postgres;

--
-- Name: object_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.object_id_seq OWNED BY public.object.id;


--
-- Name: object id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.object ALTER COLUMN id SET DEFAULT nextval('public.object_id_seq'::regclass);


--
-- Data for Name: object; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.object (id, label) FROM stdin;
1	dummy
2	tench
3	goldfish
4	great white shark
5	tiger shark
6	hammerhead
7	electric ray
8	stingray
9	cock
10	hen
11	ostrich
12	brambling
13	goldfinch
14	house finch
15	junco
16	indigo bunting
17	robin
18	bulbul
19	jay
20	magpie
21	chickadee
22	water ouzel
23	kite
24	bald eagle
25	vulture
26	great grey owl
27	European fire salamander
28	common newt
29	eft
30	spotted salamander
31	axolotl
32	bullfrog
33	tree frog
34	tailed frog
35	loggerhead
36	leatherback turtle
37	mud turtle
38	terrapin
39	box turtle
40	banded gecko
41	common iguana
42	American chameleon
43	whiptail
44	agama
45	frilled lizard
46	alligator lizard
47	Gila monster
48	green lizard
49	African chameleon
50	Komodo dragon
51	African crocodile
52	American alligator
53	triceratops
54	thunder snake
55	ringneck snake
56	hognose snake
57	green snake
58	king snake
59	garter snake
60	water snake
61	vine snake
62	night snake
63	boa constrictor
64	rock python
65	Indian cobra
66	green mamba
67	sea snake
68	horned viper
69	diamondback
70	sidewinder
71	trilobite
72	harvestman
73	scorpion
74	black and gold garden spider
75	barn spider
76	garden spider
77	black widow
78	tarantula
79	wolf spider
80	tick
81	centipede
82	black grouse
83	ptarmigan
84	ruffed grouse
85	prairie chicken
86	peacock
87	quail
88	partridge
89	African grey
90	macaw
91	sulphur-crested cockatoo
92	lorikeet
93	coucal
94	bee eater
95	hornbill
96	hummingbird
97	jacamar
98	toucan
99	drake
100	red-breasted merganser
101	goose
102	black swan
103	tusker
104	echidna
105	platypus
106	wallaby
107	koala
108	wombat
109	jellyfish
110	sea anemone
111	brain coral
112	flatworm
113	nematode
114	conch
115	snail
116	slug
117	sea slug
118	chiton
119	chambered nautilus
120	Dungeness crab
121	rock crab
122	fiddler crab
123	king crab
124	American lobster
125	spiny lobster
126	crayfish
127	hermit crab
128	isopod
129	white stork
130	black stork
131	spoonbill
132	flamingo
133	little blue heron
134	American egret
135	bittern
136	crane
137	limpkin
138	European gallinule
139	American coot
140	bustard
141	ruddy turnstone
142	red-backed sandpiper
143	redshank
144	dowitcher
145	oystercatcher
146	pelican
147	king penguin
148	albatross
149	grey whale
150	killer whale
151	dugong
152	sea lion
153	Chihuahua
154	Japanese spaniel
155	Maltese dog
156	Pekinese
157	Shih-Tzu
158	Blenheim spaniel
159	papillon
160	toy terrier
161	Rhodesian ridgeback
162	Afghan hound
163	basset
164	beagle
165	bloodhound
166	bluetick
167	black-and-tan coonhound
168	Walker hound
169	English foxhound
170	redbone
171	borzoi
172	Irish wolfhound
173	Italian greyhound
174	whippet
175	Ibizan hound
176	Norwegian elkhound
177	otterhound
178	Saluki
179	Scottish deerhound
180	Weimaraner
181	Staffordshire bullterrier
182	American Staffordshire terrier
183	Bedlington terrier
184	Border terrier
185	Kerry blue terrier
186	Irish terrier
187	Norfolk terrier
188	Norwich terrier
189	Yorkshire terrier
190	wire-haired fox terrier
191	Lakeland terrier
192	Sealyham terrier
193	Airedale
194	cairn
195	Australian terrier
196	Dandie Dinmont
197	Boston bull
198	miniature schnauzer
199	giant schnauzer
200	standard schnauzer
201	Scotch terrier
202	Tibetan terrier
203	silky terrier
204	soft-coated wheaten terrier
205	West Highland white terrier
206	Lhasa
207	flat-coated retriever
208	curly-coated retriever
209	golden retriever
210	Labrador retriever
211	Chesapeake Bay retriever
212	German short-haired pointer
213	vizsla
214	English setter
215	Irish setter
216	Gordon setter
217	Brittany spaniel
218	clumber
219	English springer
220	Welsh springer spaniel
221	cocker spaniel
222	Sussex spaniel
223	Irish water spaniel
224	kuvasz
225	schipperke
226	groenendael
227	malinois
228	briard
229	kelpie
230	komondor
231	Old English sheepdog
232	Shetland sheepdog
233	collie
234	Border collie
235	Bouvier des Flandres
236	Rottweiler
237	German shepherd
238	Doberman
239	miniature pinscher
240	Greater Swiss Mountain dog
241	Bernese mountain dog
242	Appenzeller
243	EntleBucher
244	boxer
245	bull mastiff
246	Tibetan mastiff
247	French bulldog
248	Great Dane
249	Saint Bernard
250	Eskimo dog
251	malamute
252	Siberian husky
253	dalmatian
254	affenpinscher
255	basenji
256	pug
257	Leonberg
258	Newfoundland
259	Great Pyrenees
260	Samoyed
261	Pomeranian
262	chow
263	keeshond
264	Brabancon griffon
265	Pembroke
266	Cardigan
267	toy poodle
268	miniature poodle
269	standard poodle
270	Mexican hairless
271	timber wolf
272	white wolf
273	red wolf
274	coyote
275	dingo
276	dhole
277	African hunting dog
278	hyena
279	red fox
280	kit fox
281	Arctic fox
282	grey fox
283	tabby
284	tiger cat
285	Persian cat
286	Siamese cat
287	Egyptian cat
288	cougar
289	lynx
290	leopard
291	snow leopard
292	jaguar
293	lion
294	tiger
295	cheetah
296	brown bear
297	American black bear
298	ice bear
299	sloth bear
300	mongoose
301	meerkat
302	tiger beetle
303	ladybug
304	ground beetle
305	long-horned beetle
306	leaf beetle
307	dung beetle
308	rhinoceros beetle
309	weevil
310	fly
311	bee
312	ant
313	grasshopper
314	cricket
315	walking stick
316	cockroach
317	mantis
318	cicada
319	leafhopper
320	lacewing
321	dragonfly
322	damselfly
323	admiral
324	ringlet
325	monarch
326	cabbage butterfly
327	sulphur butterfly
328	lycaenid
329	starfish
330	sea urchin
331	sea cucumber
332	wood rabbit
333	hare
334	Angora
335	hamster
336	porcupine
337	fox squirrel
338	marmot
339	beaver
340	guinea pig
341	sorrel
342	zebra
343	hog
344	wild boar
345	warthog
346	hippopotamus
347	ox
348	water buffalo
349	bison
350	ram
351	bighorn
352	ibex
353	hartebeest
354	impala
355	gazelle
356	Arabian camel
357	llama
358	weasel
359	mink
360	polecat
361	black-footed ferret
362	otter
363	skunk
364	badger
365	armadillo
366	three-toed sloth
367	orangutan
368	gorilla
369	chimpanzee
370	gibbon
371	siamang
372	guenon
373	patas
374	baboon
375	macaque
376	langur
377	colobus
378	proboscis monkey
379	marmoset
380	capuchin
381	howler monkey
382	titi
383	spider monkey
384	squirrel monkey
385	Madagascar cat
386	indri
387	Indian elephant
388	African elephant
389	lesser panda
390	giant panda
391	barracouta
392	eel
393	coho
394	rock beauty
395	anemone fish
396	sturgeon
397	gar
398	lionfish
399	puffer
400	abacus
401	abaya
402	academic gown
403	accordion
404	acoustic guitar
405	aircraft carrier
406	airliner
407	airship
408	altar
409	ambulance
410	amphibian
411	analog clock
412	apiary
413	apron
414	ashcan
415	assault rifle
416	backpack
417	bakery
418	balance beam
419	balloon
420	ballpoint
421	Band Aid
422	banjo
423	bannister
424	barbell
425	barber chair
426	barbershop
427	barn
428	barometer
429	barrel
430	barrow
431	baseball
432	basketball
433	bassinet
434	bassoon
435	bathing cap
436	bath towel
437	bathtub
438	beach wagon
439	beacon
440	beaker
441	bearskin
442	beer bottle
443	beer glass
444	bell cote
445	bib
446	bicycle-built-for-two
447	bikini
448	binder
449	binoculars
450	birdhouse
451	boathouse
452	bobsled
453	bolo tie
454	bonnet
455	bookcase
456	bookshop
457	bottlecap
458	bow
459	bow tie
460	brass
461	brassiere
462	breakwater
463	breastplate
464	broom
465	bucket
466	buckle
467	bulletproof vest
468	bullet train
469	butcher shop
470	cab
471	caldron
472	candle
473	cannon
474	canoe
475	can opener
476	cardigan
477	car mirror
478	carousel
479	carpenter's kit
480	carton
481	car wheel
482	cash machine
483	cassette
484	cassette player
485	castle
486	catamaran
487	CD player
488	cello
489	cellular telephone
490	chain
491	chainlink fence
492	chain mail
493	chain saw
494	chest
495	chiffonier
496	chime
497	china cabinet
498	Christmas stocking
499	church
500	cinema
501	cleaver
502	cliff dwelling
503	cloak
504	clog
505	cocktail shaker
506	coffee mug
507	coffeepot
508	coil
509	combination lock
510	computer keyboard
511	confectionery
512	container ship
513	convertible
514	corkscrew
515	cornet
516	cowboy boot
517	cowboy hat
518	cradle
519	crane
520	crash helmet
521	crate
522	crib
523	Crock Pot
524	croquet ball
525	crutch
526	cuirass
527	dam
528	desk
529	desktop computer
530	dial telephone
531	diaper
532	digital clock
533	digital watch
534	dining table
535	dishrag
536	dishwasher
537	disk brake
538	dock
539	dogsled
540	dome
541	doormat
542	drilling platform
543	drum
544	drumstick
545	dumbbell
546	Dutch oven
547	electric fan
548	electric guitar
549	electric locomotive
550	entertainment center
551	envelope
552	espresso maker
553	face powder
554	feather boa
555	file
556	fireboat
557	fire engine
558	fire screen
559	flagpole
560	flute
561	folding chair
562	football helmet
563	forklift
564	fountain
565	fountain pen
566	four-poster
567	freight car
568	French horn
569	frying pan
570	fur coat
571	garbage truck
572	gasmask
573	gas pump
574	goblet
575	go-kart
576	golf ball
577	golfcart
578	gondola
579	gong
580	gown
581	grand piano
582	greenhouse
583	grille
584	grocery store
585	guillotine
586	hair slide
587	hair spray
588	half track
589	hammer
590	hamper
591	hand blower
592	hand-held computer
593	handkerchief
594	hard disc
595	harmonica
596	harp
597	harvester
598	hatchet
599	holster
600	home theater
601	honeycomb
602	hook
603	hoopskirt
604	horizontal bar
605	horse cart
606	hourglass
607	iPod
608	iron
609	jack-o'-lantern
610	jean
611	jeep
612	jersey
613	jigsaw puzzle
614	jinrikisha
615	joystick
616	kimono
617	knee pad
618	knot
619	lab coat
620	ladle
621	lampshade
622	laptop
623	lawn mower
624	lens cap
625	letter opener
626	library
627	lifeboat
628	lighter
629	limousine
630	liner
631	lipstick
632	Loafer
633	lotion
634	loudspeaker
635	loupe
636	lumbermill
637	magnetic compass
638	mailbag
639	mailbox
640	maillot
642	manhole cover
643	maraca
644	marimba
645	mask
646	matchstick
647	maypole
648	maze
649	measuring cup
650	medicine chest
651	megalith
652	microphone
653	microwave
654	military uniform
655	milk can
656	minibus
657	miniskirt
658	minivan
659	missile
660	mitten
661	mixing bowl
662	mobile home
663	Model T
664	modem
665	monastery
666	monitor
667	moped
668	mortar
669	mortarboard
670	mosque
671	mosquito net
672	motor scooter
673	mountain bike
674	mountain tent
675	mouse
676	mousetrap
677	moving van
678	muzzle
679	nail
680	neck brace
681	necklace
682	nipple
683	notebook
684	obelisk
685	oboe
686	ocarina
687	odometer
688	oil filter
689	organ
690	oscilloscope
691	overskirt
692	oxcart
693	oxygen mask
694	packet
695	paddle
696	paddlewheel
697	padlock
698	paintbrush
699	pajama
700	palace
701	panpipe
702	paper towel
703	parachute
704	parallel bars
705	park bench
706	parking meter
707	passenger car
708	patio
709	pay-phone
710	pedestal
711	pencil box
712	pencil sharpener
713	perfume
714	Petri dish
715	photocopier
716	pick
717	pickelhaube
718	picket fence
719	pickup
720	pier
721	piggy bank
722	pill bottle
723	pillow
724	ping-pong ball
725	pinwheel
726	pirate
727	pitcher
728	plane
729	planetarium
730	plastic bag
731	plate rack
732	plow
733	plunger
734	Polaroid camera
735	pole
736	police van
737	poncho
738	pool table
739	pop bottle
740	pot
741	potter's wheel
742	power drill
743	prayer rug
744	printer
745	prison
746	projectile
747	projector
748	puck
749	punching bag
750	purse
751	quill
752	quilt
753	racer
754	racket
755	radiator
756	radio
757	radio telescope
758	rain barrel
759	recreational vehicle
760	reel
761	reflex camera
762	refrigerator
763	remote control
764	restaurant
765	revolver
766	rifle
767	rocking chair
768	rotisserie
769	rubber eraser
770	rugby ball
771	rule
772	running shoe
773	safe
774	safety pin
775	saltshaker
776	sandal
777	sarong
778	sax
779	scabbard
780	scale
781	school bus
782	schooner
783	scoreboard
784	screen
785	screw
786	screwdriver
787	seat belt
788	sewing machine
789	shield
790	shoe shop
791	shoji
792	shopping basket
793	shopping cart
794	shovel
795	shower cap
796	shower curtain
797	ski
798	ski mask
799	sleeping bag
800	slide rule
801	sliding door
802	slot
803	snorkel
804	snowmobile
805	snowplow
806	soap dispenser
807	soccer ball
808	sock
809	solar dish
810	sombrero
811	soup bowl
812	space bar
813	space heater
814	space shuttle
815	spatula
816	speedboat
817	spider web
818	spindle
819	sports car
820	spotlight
821	stage
822	steam locomotive
823	steel arch bridge
824	steel drum
825	stethoscope
826	stole
827	stone wall
828	stopwatch
829	stove
830	strainer
831	streetcar
832	stretcher
833	studio couch
834	stupa
835	submarine
836	suit
837	sundial
838	sunglass
839	sunglasses
840	sunscreen
841	suspension bridge
842	swab
843	sweatshirt
844	swimming trunks
845	swing
846	switch
847	syringe
848	table lamp
849	tank
850	tape player
851	teapot
852	teddy
853	television
854	tennis ball
855	thatch
856	theater curtain
857	thimble
858	thresher
859	throne
860	tile roof
861	toaster
862	tobacco shop
863	toilet seat
864	torch
865	totem pole
866	tow truck
867	toyshop
868	tractor
869	trailer truck
870	tray
871	trench coat
872	tricycle
873	trimaran
874	tripod
875	triumphal arch
876	trolleybus
877	trombone
878	tub
879	turnstile
880	typewriter keyboard
881	umbrella
882	unicycle
883	upright
884	vacuum
885	vase
886	vault
887	velvet
888	vending machine
889	vestment
890	viaduct
891	violin
892	volleyball
893	waffle iron
894	wall clock
895	wallet
896	wardrobe
897	warplane
898	washbasin
899	washer
900	water bottle
901	water jug
902	water tower
903	whiskey jug
904	whistle
905	wig
906	window screen
907	window shade
908	Windsor tie
909	wine bottle
910	wing
911	wok
912	wooden spoon
913	wool
914	worm fence
915	wreck
916	yawl
917	yurt
918	web site
919	comic book
920	crossword puzzle
921	street sign
922	traffic light
923	book jacket
924	menu
925	plate
926	guacamole
927	consomme
928	hot pot
929	trifle
930	ice cream
931	ice lolly
932	French loaf
933	bagel
934	pretzel
935	cheeseburger
936	hotdog
937	mashed potato
938	head cabbage
939	broccoli
940	cauliflower
941	zucchini
942	spaghetti squash
943	acorn squash
944	butternut squash
945	cucumber
946	artichoke
947	bell pepper
948	cardoon
949	mushroom
950	Granny Smith
951	strawberry
952	orange
953	lemon
954	fig
955	pineapple
956	banana
957	jackfruit
958	custard apple
959	pomegranate
960	hay
961	carbonara
962	chocolate sauce
963	dough
964	meat loaf
965	pizza
966	potpie
967	burrito
968	red wine
969	espresso
970	cup
971	eggnog
972	alp
973	bubble
974	cliff
975	coral reef
976	geyser
977	lakeside
978	promontory
979	sandbar
980	seashore
981	valley
982	volcano
983	ballplayer
984	groom
985	scuba diver
986	rapeseed
987	daisy
988	yellow lady's slipper
989	corn
990	acorn
991	hip
992	buckeye
993	coral fungus
994	agaric
995	gyromitra
996	stinkhorn
997	earthstar
998	hen-of-the-woods
999	bolete
1000	ear
1001	toilet tissue
641	maillot2
\.


--
-- Name: object_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.object_id_seq', 1001, true);


--
-- Name: object object_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.object
    ADD CONSTRAINT object_pkey PRIMARY KEY (id);


--
-- Name: TABLE object; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.object TO tensorflow;


--
-- PostgreSQL database dump complete
--

