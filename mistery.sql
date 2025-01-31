-- BUSCANDO EN LA LISTA DE REPORTES DE ESCENAS DE CRIMEN

FROM crime_scene_report WHERE city = 'SQL City' AND type = 'murder';

/* Security footage shows that there were 2 witnesses. 
The first witness lives at the last house on "Northwestern Dr". 
The second witness, named Annabel, lives somewhere on "Franklin Ave" */

-- HAY QUE INVESTIGAR ENTRE LOS DOS TESTIGOS:

SELECT *  FROM person WHERE address_street_name = 'Northwestern Dr' ORDER BY id DESC LIMIT 1;
SELECT * FROM person WHERE name LIKE 'Annabel%';


SELECT * FROM drivers_license WHERE id ='994470' OR id = '490173';
/* 
--	Annabel Miller
id	age	height	eye_color	hair_color	gender	plate_number	car_make	car_model
490173	35	65	green	brown	female	23AM98	Toyota	Yaris

--  Ivy Kazarian
id	age	height	eye_color	hair_color	gender	plate_number	car_make	car_model
994470	84	53	amber	blue	female	K316N0	Aston Martin	V8 Vantage S

 */

 SELECT * FROM facebook_event_checkin WHERE person_id = '99826' OR person_id = '16371';
/* 
      person_id	 event_id	event_name	                            date
 IVY    99826	  388	   -- Walt Kelly	                     20170624
 IVY    99826	  2195	   In case of atomic attack, the federal ruling against prayer in schools	20180407
 IVY    99826	  3750	   dispel a source of error in an opponent.	20170413
*ANNABEL 16371     4719	   The Funky Grooves Tour	20180115 */ 

SELECT * FROM interview Where person_id ='99826' OR person_id ='16371';

--* ANNABEL 
-- person_id	transcript
--! 16371	    I saw the murder happen, and I recognized the killer from my gym when I was working out last week on January the 9th.

SELECT * FROM get_fit_now_member WHERE person_id = '16371'; 

--! ID DE ANNABEL: 90081

SELECT * FROM get_fit_now_check_in  WHERE check_in_date = 20180109;

/* membership_id	check_in_date	check_in_time	check_out_time
      48Z7A       	20180109	        1600	        1730
      48Z55	        20180109	        1530	        1700
   !  90081	        20180109	        1600	        1700     (ANNABEL)

 */

 SELECT * FROM get_fit_now_member WHERE id = '48Z55'; 
 
/* 
id	person_id	name	membership_start_date	membership_status
48Z55	67318	Jeremy Bowers	20160101	gold
*/


SELECT * FROM get_fit_now_member WHERE id = '48Z7A'; 

/* 
id	person_id	name	membership_start_date	membership_status
48Z7A	28819	Joe Germuska	20160305	gold
 */

INSERT INTO solution VALUES (1, 'Jeremy Bowers');
        
        SELECT value FROM solution;

/* value
Congrats, you found the murderer! 
But wait, there's more... If you think you're up for a challenge,
try querying the interview transcript of the murderer to find 
the real villain behind this crime. 
If you feel especially confident in your SQL skills, 
try to complete this final step with no more than 2 queries. 
Use this same INSERT statement with your new suspect to 
check your answer. */


SELECT 
    person.id,
    person.name,
    interview.person_id,
    interview.transcript
FROM interview
JOIN person ON interview.person_id = person.id
WHERE person.name = 'Jeremy Bowers';

/* id	name	person_id	transcript
67318	Jeremy Bowers	67318	
I was hired by a woman with a lot of money.
I don't know her name but I know she's
around 5'5" (65") or 5'7" (67"). 
She has red hair and she drives a Tesla Model S.
I know that she attended the SQL Symphony Concert
 3 times in December 2017. */

SELECT * FROM drivers_license Where hair_color ='red'AND car_make = 'Tesla' AND  height BETWEEN 65 AND 67 ;

/* 
  id	    age	height	eye_color	hair_color	gender	  plate_number	car_make	car_model
202298	    68	  66	 green	      red	    female	    500123	    Tesla	    Model S
291182	    65	  66	 blue	      red	    female	    08CM64	    Tesla	    Model S
918773	    48	  65	 black	      red	    female	    917UU3	    Tesla	    Model S
 */

 SELECT * FROM person WHERE license_id IN (202298, 291182, 918773);
/* 
 id	name	license_id	address_number	address_street_name	ssn
 78881	Red Korb	918773	107	Camerata Dr	961388910
 90700	Regina George	291182	332	Maple Ave	337169072
 !99716	Miranda Priestly	202298	1883	Golden Ave	987756388

 */

 SELECT * FROM facebook_event_checkin WHERE person_id IN (78881, 90700, 99716);

/*  
person_id	event_id	event_name	            date
!99716	    1143	    SQL Symphony Concert	20171206
!99716	    1143	    SQL Symphony Concert	20171212
!99716	    1143	    SQL Symphony Concert	20171229
 */

 INSERT INTO solution VALUES (1, 'Miranda Priestly');
        
        SELECT value FROM solution;

/* value
Congrats, you found the brains behind the murder! Everyone in SQL City hails you as the greatest 
SQL detective of all time. Time to break out the champagne! */