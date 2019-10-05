Note: CMD bash shell executions all done within cygwin on Windows 7+ OS systems


Need To Do:

	1) Set a "deep-dive" hierarchial arch run-down:

	VIEW A) SOURCES: Discogs, Wikipedia*
	JSON_parse(UN_geoschema_REGION:${region}):
		REGION_COUNTRY:[@LIST]:${country}:
		REGION_COUNTRY_StateDivision:[@LIST]:${state_region}:
		REGION_COUNTRY_StateDivision_County:[@LIST]:${county}:

		** This section will be of some dispute (Need to model alt views) **
		REGION_COUNTRY_StateDivision_County_(CITY, TOWN, VILLAGE, NATIONAL PARK)

		** This part requires, in nearly all cases, another data source **
		REGION_COUNTRY_StateDivision_County_CITY_CITY_SUBDISTRICT 
	SELECT: Release id->[COUNTRY, GENRE, ARTIST, LABEL]
	[LABEL]


Current Lookup Processing Cycle:

	1) Simple Quick (easily - we can get info) release_id list = FLATDB files info
	2) (deep dive) get release (id) { tries to return artist_id and label_id but this is quite often problematic) }
	3) lookup artist(id) and generate artist file OR lookup label(id and generate label file

	* Naturally, the ideal solution is to do all this in the initial release lookup and FILE output
	BUT... getting artist and label (id, name) seems to be problematic - I get lots of 'undefined' and
	not set id or| name name object attribute(s). In other words I needed to get the most amount of info
	I could in the quickest amount of time (due to discogs request lookup constraints - though these
	look to have been removed as of late or it may be that the situation was only ever like that in regards
	to the AUTH_ID search lookups). Either-way this - counterintuitive - approach looks to get me the
	best set of information in the quickest time possible with regards to the discogs API in the node.js
	coding framework, (maybe the python or ruby lookups give better results - this would be due to how
	the language engineers an Object.).

	** Still need to set a Search-lookup function (lkke the above, but with String(word) rather than Int(id)
	   The big difference is that the lookup is against the limited discogs dataset I have on local machine.




Currently running to redo the dbase:
    $ for x in {3721..10000}; do node quikstart-shellexec.js ${x} >> FLAT_REDO ; sleep 2; done;

Cleaning up the FLAT_REDO file (remove entries where request trouble issues with no data):
    $ cat FLAT_REDO | grep "::" >> FLAT_REDO_F; sleep 1; mv FLAT_REDO_F FLAT_REDO;
    $ rm TMP_FLAT; cp -p FLAT_REDO TMP_FLAT; cat FLAT_ADDSIDDB >> TMP_FLAT 


Generation of Discog entries by genre for countries in file:
    $ for x in [ 'Electronic' 'Pop' 'Hip Hop' ]; do grep "::${x}" FLAT_ADDSIDDB | awk '{FS="::"} {print $3 " " $5 " " $6}' | sort -rn | uniq -c | sort -rn >> discogs_genre_record_labels_by_country ; done;


Gereration of Discogs Genre and Style sets:
    $ cat ALL_FLATDB | awk '{FS="::"} {print $6}' | sort -rn | uniq -c | sort -rn > discogs_defined_genres
    $ cat ALL_FLATDB | awk '{FS="::"} {print $6 " " $7}' | sort -rn | uniq -c | sort -rn > discogs_defined_genres_styles
    $ $ grep "::${genre_name}::" ALL_FLATDB | awk '{FS="::"} {print $6 " " $7}' | sort -rn | uniq -c | sort -rn > discogs_defined_${genre_name}_music_genres_styles  



Find the Unique genres by country (what is the popular niche genere/sub-genre; NOTE: This will not work in the old flat-file dbase):
   $ cat FLAT_ADDSIDDB | grep 'Electronic' | awk '{FS="::"} {print $5 " " $6 " " $7}' | sort -rn | uniq -c | sort -rn

Find the Unique genres by corporation by country (what sub-genre a music label releases per country):
   $ cat FLAT_ADDSIDDB | grep 'Electronic' | awk '{FS="::"} {print $3 " " $5 " " $6 " " $7}' | sort -rn | uniq -c | sort -rn

Finding a grouping (and changing perception of what is looked for) by selecting & changing field view order:
   $ cat FLAT_ADDSIDDB | grep 'Electronic' | awk '{FS="::"} {print $3 " " $6}' | sort -rn | uniq -c | sort -rn | head -10
    >> 112 Not On Label Electronic
    >>  52 Moving Shadow Electronic
    >>  36 Virgin Electronic
    >>  30 Polydor Electronic
    >>  30 Kannibalen Records Electronic
    >>  27 Epic Electronic
    >>  23 Columbia Electronic
    >>  21 ZYX Music Electronic
    >>  19 Ansiform Electronic
    >>  18 RCA Electronic

   jauer@DESKTOP-GH7MQNQ /cygdrive/c/Joseph/NodeJS/discogPrep
   $ cat FLAT_ADDSIDDB | grep 'Electronic' | awk '{FS="::"} {print $3 " " $6 " " $7}' | sort -rn | uniq -c | sort -rn | head -10
    >> 31 Moving Shadow Electronic Breakbeat
    >> 19 Ansiform Electronic Ambient
    >> 17 Kannibalen Records Electronic Electro House
    >> 14 Moving Shadow Electronic Drum n Bass
    >> 13 Not On Label Electronic Progressive House
    >> 12 Mute Electronic Synth-pop
    >> 11 Virgin Electronic Synth-pop
    >> 10 Not On Label Electronic House
    >>  9 Kannibalen Records Electronic Dubstep
    >>  9 Columbia Electronic Alternative Rock

   jauer@DESKTOP-GH7MQNQ /cygdrive/c/Joseph/NodeJS/discogPrep
   $ cat FLAT_ADDSIDDB | grep 'Electronic' | awk '{FS="::"} {print $7 " " $6 " " $3}' | sort -rn | uniq -c | sort -rn | head -10
   >> 31 Breakbeat Electronic Moving Shadow
   >> 19 Ambient Electronic Ansiform
   >> 17 Electro House Electronic Kannibalen Records
   >> 14 Drum n Bass Electronic Moving Shadow
   >> 13 Progressive House Electronic Not On Label
   >> 12 Synth-pop Electronic Mute
   >> 11 Synth-pop Electronic Virgin
   >> 10 House Electronic Not On Label
   >>  9 Dubstep Electronic Kannibalen Records
   >>  9 Alternative Rock Electronic Columbia

   $ cat FLAT_ADDSIDDB | grep 'Electronic' | awk '{FS="::"} {print $2 " " $6 " " $7}' | sort -rn | uniq -c | sort -rn | head -10
   >>  32 2007-03-00 Electronic House
   >>  28 1996 Electronic House
   >>  24 2007-02-00 Electronic House
   >>  23 2006 Electronic House
   >>  23 1997 Electronic House
   >>  22 1992 Electronic House
   >>  22 1985 Electronic Synth-pop
   >>  20 1994 Electronic Euro House
   >>  19 1995 Electronic House
   >>  19 1995 Electronic Euro House

   jauer@DESKTOP-GH7MQNQ /cygdrive/c/Joseph/NodeJS/discogPrep
   $ cat FLAT_ADDSIDDB | grep 'Electronic' | awk '{FS="::"} {print $4 " " $6 " " $7}' | sort -rn | uniq -c | sort -rn | head -10
   >>  60 Various Electronic House
   >>  24 Various Electronic Progressive House
   >>  19 Various Electronic Techno
   >>  19 Unknown Artist Electronic Ambient
   >>  18 Various Electronic Trance
   >>  14 Various Electronic Hardcore
   >>  14 Various Electronic Euro House
   >>  13 Various Electronic Abstract
   >>  12 Various Electronic Hard House
   >>  12 Depeche Mode Electronic Synth-pop

   jauer@DESKTOP-GH7MQNQ /cygdrive/c/Joseph/NodeJS/discogPrep
   $ cat FLAT_ADDSIDDB | grep 'Electronic' | awk '{FS="::"} {print $5 " " $6 " " $7}' | sort -rn | uniq -c | sort -rn | head -10
   >> 119 UK Electronic House
   >> 117 US Electronic House
   >>  66 UK Electronic Breakbeat
   >>  54 UK Electronic Drum n Bass
   >>  52 Germany Electronic Trance
   >>  50 Germany Electronic Techno
   >>  47 Germany Electronic House
   >>  41 France Electronic House
   >>  40 UK Electronic Progressive House
   >>  39 US Electronic Noise


Finding a Popular genre and sub-genere under the flat file with ALL discogs URI request returns for a release:
   $ cat ALL_FLATDB | grep 'Electronic' | awk '{FS="::"} {print $6 " " $7}' | sort -rn | uniq -c | sort -rn | head -20
   >> 9680
   >> 507 Electronic House
   >> 195 Electronic Techno
   >> 192 Electronic Trance
   >> 179 Electronic Synth-pop
   >> 112 Electronic Progressive House
   >> 111 Electronic Euro House
   >> 109 Electronic Electro
   >> 108 Electronic Abstract
   >> 105 Electronic Ambient
   >>  95 Electronic Downtempo
   >>  94 Electronic Drum n Bass
   >>  88 Electronic Noise
   >>  87 Electronic Breakbeat
   >>  85 Electronic Experimental
   >>  79 Electronic Disco
   >>  79 Electronic Deep House
   >>  69 Electronic Hardcore
   >>  63 Electronic Industrial
   >>  55 Electronic Alternative Rock


Doing the Above Another Way (Still needs cleaning-up):

   CMD (get genres):
   cat ALL_FLATDB | awk '{FS="::"} {print $6}' | sort -rn | uniq -c | sort -rn | sed -e "s/ /\_/g" > TMP_GENRES; sleep 1; for x in `cat TMP_GENRES | sed -e "s/\_*[0-9*]*\_//" | awk '{FS=" "} {print $1}'`; do echo ${x}; i=`echo ${x} | sed -e "s/\_/ /g"`; grep "::${i}::" TMP_FLAT | awk '{FS="::"} {print $3 " " $5 " " $7}' | sort -rn | uniq -c | sort -rn | head -5 ; done;

   CMD (get sub-genres of genre):
   $ grep '::Electronic::' TMP_FLAT | awk '{FS="::"} {print $7}' | sort -rn | uniq -c | sort -rn | head -20 | sed -e "s/ /\_/g" > TMP_SGENRES; sleep 1; for x in `cat TMP_SGENRES | sed -e "s/\_*[0-9*]*\_//" | awk '{FS=" "} {print $1}'`; do echo ${x}; i=`echo ${x} | sed -e "s/\_/ /g"` ; grep "Electronic::${i}" TMP_FLAT | awk '{FS="::"} {print $3 " " $5 " " $7}' | sort -rn | uniq -c | sort -rn | head -10 ; done;

   FLAT FILE (adding new record search limit filter ${h}=1000):
   $ h=1000; grep '::Electronic::' TMP_FLAT | head -${h} | awk '{FS="::"} {print $7}' | sort -rn | uniq -c | sort -rn | head -30 | sed -e "s/ /\_/g" > TMP_SGENRES; sleep 1; for x in `cat TMP_SGENRES | sed -e "s/\_*[0-9*]*\_//" | awk '{FS=" "} {print $1}'`; do echo ${x}; i=`echo ${x} | sed -e "s/\_/ /g"` ; echo ${i} >> discogs_deep_dive; grep "Electronic::${i}" TMP_FLAT | head -${h} | awk '{FS="::"} {print "\t" $3 " " $5 " " $7}' | sort -rn | uniq -c | sort -rn | head -10 >> discogs_deep_dive; printf "\n" >> discogs_deep_dive; done;

	Check against query: $ i="IDM"; h=10000; grep "Electronic::${i}" TMP_FLAT | head -${h} | awk '{FS="::"} {print "\t" $3 " " $5 " " $7}' | sort -rn | uniq -c | sort -rn | head -40 


	(Only issue outstanding is where a Genre mimics a sub-genre (or a sub-genre mimics a sub-sub/micro genre [which follows the same pattern anyhow]: Ex. -> Dub = [Dub, Dub Techno] where we only want Dub OR Dub Techno not Dub AND Dub Techno)


Re-ordering the FLAT_ADD.. file so that we can do sequential yearly ordering analysis for the above:

   $ for x in `cat FLAT_ADDSIDDB | awk '{FS="::"} {print $1}' | sort -n`; do grep "${x}" FLAT_ADDSIDDB >> FLAT_ADDSIDDB_N; done;




# This Section is essentially how I constructed the current JSON model structure for doing bash shell 
# queries against the two main Flat files I use for storing filtered data from discogs API release 
# URI/URL request.
#
Using node.js to parse a JSON file then run stats query:

   $ for i in `node json_parse_APAC.js | sed -e "s/ /\_/g"` ; do  x=`echo ${i} | sed "s/_/ /g"`; printf "${x} "; grep "::${x}::" ALL_FLATDB | wc -l ; done;



Find data in a Directory File list (Example 1):

 jauer@DESKTOP-GH7MQNQ /cygdrive/c/Joseph/NodeJS/discogPrep

   $ for x in `ls ARTIST/*`; do echo "${x}" `cat ${x} | grep Smallfish`; done;
	ARTIST/Asuka_Kaneko
	ARTIST/Graham_Dowdall
	ARTIST/Joseph_Auer 11: Smallfish , Monochromatic Sunlight , https://api.discogs.com/releases/901326 , 2007
	ARTIST/Mark_Streatfield 3: Smallfish , Hex EP , https://api.discogs.com/releases/1370783 , 2008 17: Smallfish , Formulation EP , https://api.discogs.com/releases/949950 , 2007
	ARTIST/Masayoshi-Minoshima
	ARTIST/Mekong_Zoo
	ARTIST/Nerve-9
	ARTIST/Wil_Bolton 46: Smallfish , Shifting Focus EP , https://api.discogs.com/releases/853842 , 2006
	ARTIST/Zun


Find data (a Artist / in Group(s)) relationship in a Directory File list:

   $ for x in `ls ARTIST/*`; do echo "${x}" `cat ${x} | grep Graham`; done;


Find data (Artist discog id numbers) from a discogs node.js generated artist file under ARTISTS/ dir:

   1. Get the first Member discogs id number:
      $ for x in `grep "Member" Flying_Mijinko_Band | awk '{FS=","} {print $4}'`; do echo "COUNTER: ${x}"; done;

   2. Then do the following to get the other Member id numbers (not sure why this happens)
      $ for x in `grep "Member" Flying_Mijinko_Band | awk '{FS=","} {print $2}' | grep [^true]`; do echo "COUNTER: ${x}"; done;




Generate new artist file in directory ./ARTIST/:


   1. Generate the artist files (query artist group):

	a) First Entry is a special case. Need to get the first member entry as follows:
		$ for x in `grep "Member" Flying_Mijinko_Band | awk '{FS=","} {print $4}' | grep [^true]`; do node quikstart-artist_simple_lookup_shell.js ${x} > ${x}_artist; sleep 3; done;

	b) All other entries can be collected this way:
		$ for x in `grep "Member" Flying_Mijinko_Band | awk '{FS=","} {print $2}' | grep [^true]`; do node quikstart-artist_simple_lookup_shell.js ${x} > ${x}_artist; sleep 3; done;



   2. Look at artist URL ref in artist id file to generate new file the mv will generate:
 
	a) Generate id to grep for in artist file (set id list):
		$ for x in `ls *_artist `; do echo ${x}; done;
			>> 1023883_artist
			>> 143235_artist
			>> 211593_artist
			>> 314270_artist
			>> 337052_artist
			>> 33726_artist
			>> 58286_artist
			>> 60086_artist
			>> 933018_artist

	b) Generate the new file name from the id:
		$ for x in `ls *_artist | sed -e s/_[a-z*]*//g`; do echo ${x}; done;
			>> 1023883
			>> 143235
			>> 211593
			>> 314270
			>> 337052
			>> 33726
			>> 58286
			>> 60086
			>> 933018

		$ for x in `ls *_artist | sed -e s/_[a-z*]*//g`; do grep "${x}\-" ${x}_artist; done;
			>> https://www.discogs.com/artist/1023883-Shozan-Tanabe  https://api.discogs.com/artists/1023883 undefined
			>> https://www.discogs.com/artist/143235-Aiyb-Dieng Senegalese drummer and percussionist. https://api.discogs.com/artists/143235 undefined
			>> https://www.discogs.com/artist/211593-Akira-Sakata Japanese alto saxophonist, born February 21, 1945 in Hiroshima, Japan.
		$ for x in `ls *_artist | sed -e s/_[a-z*]*//g`; do grep "${x}\-" ${x}_artist | grep -o "${x}\-[A-Za-z0-9*]*\-[A-Za-z0-9]*" ; done;
			>> 1023883-Shozan-Tanabe
			>> 143235-Aiyb-Dieng
			>> 211593-Akira-Sakata
			>> 314270-Febian-Reza
			>> 337052-Asuka-Kaneko
			>> 33726-Foday-Musa
			>> 58286-Anton-Fier
			>> 60086-Nicky-Skopelitis
			>> 933018-Hiroshi-Yoshino

		$ for x in `ls *_artist | sed -e s/_[a-z*]*//g`; do grep "${x}\-" ${x}_artist | grep -o "${x}\-[A-Za-z0-9*]*\-[A-Za-z0-9]*" | sed -e s/\-/\_/g ; done;
			>> 1023883_Shozan_Tanabe
			>> 143235_Aiyb_Dieng
			>> 211593_Akira_Sakata
			>> 314270_Febian_Reza
			>> 337052_Asuka_Kaneko
			>> 33726_Foday_Musa
			>> 58286_Anton_Fier
			>> 60086_Nicky_Skopelitis
			>> 933018_Hiroshi_Yoshino

		OR We could do it this way (Current Situation - but maybe having id in filename is good idea):

		$ for x in `ls *_artist | sed -e s/_[a-z*]*//g`; do grep "${x}\-" ${x}_artist | grep -o "\-[A-Za-z0-9*]*\-[A-Za-z0-9]*" | sed -e s/\-/\_/g | sed -e s/\_//; done;
			>> Shozan_Tanabe
			>> Aiyb_Dieng
			>> Akira_Sakata
			>> Febian_Reza
			>> Asuka_Kaneko
			>> Foday_Musa
			>> Anton_Fier
			>> Nicky_Skopelitis
			>> Hiroshi_Yoshino

		

   3. Move *_artist generated files to storage destination using new artist file (as generated above):
		(We want to get here: $ mv old_filename ARTIST/new_file_name)

	OUR FINAL SOLUTIONS (combining the above work):

	    SOLUTION 1 (No id; only artist name:
		jauer@DESKTOP-GH7MQNQ /cygdrive/c/Joseph/NodeJS/discogPrep
		$ for x in `ls *_artist `; do y=`ls ${x} | sed -e s/_[a-z*]*//g`; z=`grep "${y}\-" ${x} | grep -o "\-[A-Za-z0-9*]*\-[A-Za-z0-9]*" | sed -e s/\-/\_/g | sed -e s/\_//`; echo ${y}_artist ARTIST/${z}; done;
		>> 1023883_artist ARTIST/Shozan_Tanabe
		>> 143235_artist ARTIST/Aiyb_Dieng
		>> 211593_artist ARTIST/Akira_Sakata
		>> 314270_artist ARTIST/Febian_Reza
		>> 337052_artist ARTIST/Asuka_Kaneko
		>> 33726_artist ARTIST/Foday_Musa
		>> 58286_artist ARTIST/Anton_Fier
		>> 60086_artist ARTIST/Nicky_Skopelitis
		>> 933018_artist ARTIST/Hiroshi_Yoshino

	    SOLUTION 2 (id and artist name):
		jauer@DESKTOP-GH7MQNQ /cygdrive/c/Joseph/NodeJS/discogPrep
		$ for x in `ls *_artist `; do y=`ls ${x} | sed -e s/_[a-z*]*//g`; z=`grep "${y}\-" ${x} | grep -o "\-[A-Za-z0-9*]*\-[A-Za-z0-9]*" | sed -e s/\-/\_/g | sed -e s/\_//`; echo ${y}_artist ARTIST/${y}_${z}; done;
		>> 1023883_artist ARTIST/1023883_Shozan_Tanabe
		>> 143235_artist ARTIST/143235_Aiyb_Dieng
		>> 211593_artist ARTIST/211593_Akira_Sakata
		>> 314270_artist ARTIST/314270_Febian_Reza
		>> 337052_artist ARTIST/337052_Asuka_Kaneko
		>> 33726_artist ARTIST/33726_Foday_Musa
		>> 58286_artist ARTIST/58286_Anton_Fier
		>> 60086_artist ARTIST/60086_Nicky_Skopelitis
		>> 933018_artist ARTIST/933018_Hiroshi_Yoshino

	   USING SOLUTION 2 WE RUN THE FOLLOWING:
		$ for x in `ls *_artist `; do y=`ls ${x} | sed -e s/_[a-z*]*//g`; z=`grep "${y}\-" ${x} | grep -o "\-[A-Za-z0-9*]*\-[A-Za-z0-9]*" | sed -e s/\-/\_/g | sed -e s/\_//`; mv ${y}_artist ARTIST/${y}_${z}; done;

		Then we check all is ok (it is):
		$ ls -ltr ARTIST/
		...
		>> -rw-rw-r--+ 1 jauer None 4849 Aug 21 14:47 33726_Foday_Musa
		>> -rw-rw-r--+ 1 jauer None 4634 Aug 21 14:47 58286_Anton_Fier
		>> -rw-rw-r--+ 1 jauer None 4289 Aug 21 14:47 60086_Nicky_Skopelitis
		>> -rw-rw-r--+ 1 jauer None 4264 Aug 21 14:47 143235_Aiyb_Dieng
		>> -rw-rw-r--+ 1 jauer None 4624 Aug 21 14:47 211593_Akira_Sakata
		>> -rw-rw-r--+ 1 jauer None 4097 Aug 21 14:47 314270_Febian_Reza
		>> -rw-rw-r--+ 1 jauer None 4471 Aug 21 14:48 337052_Asuka_Kaneko
		>> -rw-rw-r--+ 1 jauer None 4187 Aug 21 14:48 933018_Hiroshi_Yoshino
		>> -rw-rw-r--+ 1 jauer None  701 Aug 21 14:48 1023883_Shozan_Tanabe

	HOWEVER,... This is probably best as no extra re-extracting work required in getting id seperate from artist name when just using ls through a directory:
		 $ for x in `ls *_artist `; do y=`ls ${x} | sed -e s/_[a-z*]*//g`; z=`grep "${y}\-" ${x} | grep -o "\-[A-Za-z0-9*]*\-[A-Za-z0-9]*" | sed -e s/\-/\_/ | sed -e s/\_//`; mv ${y}_artist ARTIST/${y}_${z}; done



   4. Fully Integrated Solution:

	Country -> Region -> Province/District/State/Special Area/ -> City -> City district 

	Genre -> Sub-Genre
