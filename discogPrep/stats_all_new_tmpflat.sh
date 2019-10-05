#!/bin/sh

# NOTE: Not all the Regions here are identical types. They are here to server as example types of different data groupings that can be done covering : Geographical, Psychological, Social-Economic, Economic, Governmental, Ecomincal, Social dimensions. 

# GET World musics entry count by country:  $ cat FLAT_LATERDB | awk '{FS="::"} {print $4 $5}' | grep 'World*' | sort -rn | uniq -c | sort -rn

# Used for feeding release ids to be read in node.js discogs API 
#  for x in `ls ARTIST/`; do cat 'ARTIST/'${x}; done;
#

discogs=`node json_parse_DSCGS.js`;
printf "\n"
printf "Source: Discogs (Personalised API Snapshot) ";
printf "\n\n"
echo ${discogs}
printf "\n\n" 


ret=`cat TMP_FLAT | wc -l`
echo 'TOTAL: ' ${ret};

cat TMP_FLAT | grep 'Electronic' | awk '{FS="::"} {print $6 " " $7}' | sort -rn | uniq -c | sort -rn | head -150
# echo 'TOP 50 genres (styles): ' ${top_gs}


printf "\n\n"

pret=`cat TMP_FLAT | grep '::Pop' | wc -l`
popr=$(awk "BEGIN {print ($pret / $ret) * 100}")
echo 'Pop: ' ${pret} ' % [' ${popr} ']';

rret=`cat TMP_FLAT | grep '::Rock' | wc -l`
ropr=$(awk "BEGIN {print ($rret / $ret) * 100}")
echo 'Rock: ' ${rret} ' % [' ${ropr} ']';

eret=`cat TMP_FLAT | grep '::Electronic' | wc -l`
elpr=$(awk "BEGIN {print ($eret / $ret) * 100}")
echo 'Electronic: ' ${eret} ' % [' ${elpr} ']';

hret=`cat TMP_FLAT | grep '::Hip Hop' | wc -l`
hhpr=$(awk "BEGIN {print ($hret / $ret) * 100}")
echo 'Hip-Hop: ' ${hret} ' % [' ${hhpr} ']';

printf "\n"
printf "REGION: ASIA \n"
assum=0;
afsum=0;
eusum=0;
amsum=0;
fmsum=0;

for i in `node json_parse_APAC.js | sed -e "s/ /\_/g"` ; 
do  
	x=`echo ${i} | sed "s/_/ /g"`;
	totalr=`grep "::${x}::" TMP_FLAT | wc -l`;
	tper=$(awk "BEGIN {print ($totalr / $ret) * 100}")
	let "assum+=$totalr";

	# echo 'Sum counter: ' ${assum}
	echo ${x}  ' Total / % [of World output] : ' ${totalr} ' % [' ${tper} ']';

	if [[ ${totalr} > 0 ]]; then
		 # echo 'GREATER THAN ZERO' ${totalr};

	printf "Breakdown of Genre submition weight for ${x} :\n" ;
	p=`grep "::${x}::Pop" TMP_FLAT | wc -l`;
	pper=$(awk "BEGIN {print ($p / $totalr) * 100}");

	r=`grep "::${x}::Rock" TMP_FLAT | wc -l`;
	rper=$(awk "BEGIN {print ($r / $totalr) * 100}");

	e=`grep "::${x}::Electronic" TMP_FLAT | wc -l`;
	eper=$(awk "BEGIN {print ($e / $totalr) * 100}");
	top_cgs=` cat TMP_FLAT | grep "::${x}::Electronic" | awk '{FS="::"} {print $6 " " $7}' | sort -rn | uniq -c | sort -rn | head -5`

	fs=`grep "::${x}::Funk" TMP_FLAT | wc -l`;
	fsper=$(awk "BEGIN {print ($fs / $totalr) * 100}");

	fw=`grep "::${x}::Folk" TMP_FLAT | wc -l`;
	fwper=$(awk "BEGIN {print ($fw / $totalr) * 100}");

	sc=`grep "::${x}::Stage" TMP_FLAT | wc -l`;
	scper=$(awk "BEGIN {print ($sc / $totalr) * 100}");

 	echo ' Pop: ' ${p} ' % [' ${pper} ']' ; 
	echo ' Rock: ' ${r} ' % [' ${rper} ']' ; 
	echo ' Electronic: ' ${e} ' % [' ${eper} ']';
	printf "    Electronic: \n ${top_cgs} \n";
	echo ' Funk / Soul: ' ${fs} ' % [' ${fsper} ']'; 
	echo ' Folk, World & Country: ' ${fw} ' % [' ${fwper} ']'; 
	echo ' Stage & Screen: ' ${sc} ' % [' ${scper} ']' ; 
	fi;

	printf "\n";
done;
echo 'TOTAL SUM FOR ASIA: ' ${assum} ;


printf "\n"
printf "REGION: AFRICA \n"

for i in `node json_parse_AFCA.js | sed -e "s/ /\_/g"` ;
do
        x=`echo ${i} | sed "s/_/ /g"`;
        totalr=`grep "::${x}::" TMP_FLAT | wc -l`;
        echo ${x}  ' Total: ' ${totalr} ;
	tper=$(awk "BEGIN {print ($totalr / $ret) * 100}")
	let "afsum+=$totalr";

	echo ${x}  ' Total / % [of World output] : ' ${totalr} ' % [' ${tper} ']';

        if [[ ${totalr} > 0 ]]; then
                 # echo 'GREATER THAN ZERO' ${totalr};

        printf "Breakdown of Genre submition weight for ${x} :\n" ;
        p=`grep "::${x}::Pop" TMP_FLAT | wc -l`;
        pper=$(awk "BEGIN {print ($p / $totalr) * 100}");

        r=`grep "::${x}::Rock" TMP_FLAT | wc -l`;
        rper=$(awk "BEGIN {print ($r / $totalr) * 100}");

        e=`grep "::${x}::Electronic" TMP_FLAT | wc -l`;
        eper=$(awk "BEGIN {print ($e / $totalr) * 100}");
	top_cgs=` cat TMP_FLAT | grep "::${x}::Electronic" | awk '{FS="::"} {print $6 " " $7}' | sort -rn | uniq -c | sort -rn | head -5`

        fs=`grep "::${x}::Funk" TMP_FLAT | wc -l`;
        fsper=$(awk "BEGIN {print ($fs / $totalr) * 100}");

        fw=`grep "::${x}::Folk" TMP_FLAT | wc -l`;
        fwper=$(awk "BEGIN {print ($fw / $totalr) * 100}");

        sc=`grep "::${x}::Stage" TMP_FLAT | wc -l`;
        scper=$(awk "BEGIN {print ($sc / $totalr) * 100}");

        echo ' Pop: ' ${p} ' % [' ${pper} ']' ;
        echo ' Rock: ' ${r} ' % [' ${rper} ']' ;
        echo ' Electronic: ' ${e} ' % [' ${eper} ']';
	printf "    Electronic: \n ${top_cgs} \n";
        echo ' Funk / Soul: ' ${fs} ' % [' ${fsper} ']';
        echo ' Folk, World & Country: ' ${fw} ' % [' ${fwper} ']';
        echo ' Stage & Screen: ' ${sc} ' % [' ${scper} ']' ;
	fi;
	
	printf "\n";
done;
echo 'TOTAL SUM FOR AFRICA: ' ${afsum} ;

printf "\n"
printf "REGION: EUROPE \n"

for i in `node json_parse_EURO.js | sed -e "s/ /\_/g"` ;
do
        x=`echo ${i} | sed "s/_/ /g"`;
        totalr=`grep "::${x}::" TMP_FLAT | wc -l`;
        echo ${x}  ' Total: ' ${totalr} ;
	tper=$(awk "BEGIN {print ($totalr / $ret) * 100}")
	let "eusum+=$totalr";

	echo ${x}  ' Total / % [of World output] : ' ${totalr} ' % [' ${tper} ']';

        if [[ ${totalr} > 0 ]]; then
                 # echo 'GREATER THAN ZERO' ${totalr};

        printf "Breakdown of Genre submition weight for ${x} :\n" ;
        p=`grep "::${x}::Pop" TMP_FLAT | wc -l`;
        pper=$(awk "BEGIN {print ($p / $totalr) * 100}");

        r=`grep "::${x}::Rock" TMP_FLAT | wc -l`;
        rper=$(awk "BEGIN {print ($r / $totalr) * 100}");

        e=`grep "::${x}::Electronic" TMP_FLAT | wc -l`;
        eper=$(awk "BEGIN {print ($e / $totalr) * 100}");
	top_cgs=` cat TMP_FLAT | grep "::${x}::Electronic" | awk '{FS="::"} {print $6 " " $7}' | sort -rn | uniq -c | sort -rn | head -5`

        fs=`grep "::${x}::Funk" TMP_FLAT | wc -l`;
        fsper=$(awk "BEGIN {print ($fs / $totalr) * 100}");

        fw=`grep "::${x}::Folk" TMP_FLAT | wc -l`;
        fwper=$(awk "BEGIN {print ($fw / $totalr) * 100}");

        sc=`grep "::${x}::Stage" TMP_FLAT | wc -l`;
        scper=$(awk "BEGIN {print ($sc / $totalr) * 100}");

        echo ' Pop: ' ${p} ' % [' ${pper} ']' ;
        echo ' Rock: ' ${r} ' % [' ${rper} ']' ;
        echo ' Electronic: ' ${e} ' % [' ${eper} ']';
	printf "    Electronic: \n ${top_cgs} \n";
        echo ' Funk / Soul: ' ${fs} ' % [' ${fsper} ']';
        echo ' Folk, World & Country: ' ${fw} ' % [' ${fwper} ']';
        echo ' Stage & Screen: ' ${sc} ' % [' ${scper} ']' ;
	fi;

	printf "\n";
done;
echo 'TOTAL SUM FOR EUROPE: ' ${eusum} ;


printf "\n"
printf "REGION: AMERICAS \n"

for i in `node json_parse_AMRCS.js | sed -e "s/ /\_/g"` ;
do
        x=`echo ${i} | sed "s/_/ /g"`;
        totalr=`grep "::${x}::" TMP_FLAT | wc -l`;
        echo ${x}  ' Total: ' ${totalr} ;
	tper=$(awk "BEGIN {print ($totalr / $ret) * 100}")
	let "amsum+=$totalr";

	 echo ${x}  ' Total / % [of World output] : ' ${totalr} ' % [' ${tper} ']';

        if [[ ${totalr} > 0 ]]; then
                 # echo 'GREATER THAN ZERO' ${totalr};

        printf "Breakdown of Genre submition weight for ${x} :\n" ;
        p=`grep "::${x}::Pop" TMP_FLAT | wc -l`;
        pper=$(awk "BEGIN {print ($p / $totalr) * 100}");

        r=`grep "::${x}::Rock" TMP_FLAT | wc -l`;
        rper=$(awk "BEGIN {print ($r / $totalr) * 100}");

        e=`grep "::${x}::Electronic" TMP_FLAT | wc -l`;
        eper=$(awk "BEGIN {print ($e / $totalr) * 100}");
	top_cgs=` cat TMP_FLAT | grep "::${x}::Electronic" | awk '{FS="::"} {print $6 " " $7}' | sort -rn | uniq -c | sort -rn | head -5`

        fs=`grep "::${x}::Funk" TMP_FLAT | wc -l`;
        fsper=$(awk "BEGIN {print ($fs / $totalr) * 100}");

        fw=`grep "::${x}::Folk" TMP_FLAT | wc -l`;
        fwper=$(awk "BEGIN {print ($fw / $totalr) * 100}");

        sc=`grep "::${x}::Stage" TMP_FLAT | wc -l`;
        scper=$(awk "BEGIN {print ($sc / $totalr) * 100}");

        echo ' Pop: ' ${p} ' % [' ${pper} ']' ;
        echo ' Rock: ' ${r} ' % [' ${rper} ']' ;
        echo ' Electronic: ' ${e} ' % [' ${eper} ']';
	printf "    Electronic: \n ${top_cgs} \n";
        echo ' Funk / Soul: ' ${fs} ' % [' ${fsper} ']';
        echo ' Folk, World & Country: ' ${fw} ' % [' ${fwper} ']';
        echo ' Stage & Screen: ' ${sc} ' % [' ${scper} ']' ;
	fi;

	printf "\n";
done;
echo 'TOTAL SUM FOR AMERICAS: ' ${amsum} ;


printf "\n"
printf "REGION: FORMER SOVEREIGN STATES \n"

for i in `node json_parse_FRMRC.js | sed -e "s/ /\_/g"` ;
do
        x=`echo ${i} | sed "s/_/ /g"`;
        totalr=`grep "::${x}::" TMP_FLAT | wc -l`;
        echo ${x}  ' Total: ' ${totalr} ;
        tper=$(awk "BEGIN {print ($totalr / $ret) * 100}")
        let "fmsum+=$totalr";

         echo ${x}  ' Total / % [of World output] : ' ${totalr} ' % [' ${tper} ']';

        if [[ ${totalr} > 0 ]]; then
                 # echo 'GREATER THAN ZERO' ${totalr};

        printf "Breakdown of Genre submition weight for ${x} :\n" ;
        p=`grep "::${x}::Pop" TMP_FLAT | wc -l`;
        pper=$(awk "BEGIN {print ($p / $totalr) * 100}");

        r=`grep "::${x}::Rock" TMP_FLAT | wc -l`;
        rper=$(awk "BEGIN {print ($r / $totalr) * 100}");

        e=`grep "::${x}::Electronic" TMP_FLAT | wc -l`;
        eper=$(awk "BEGIN {print ($e / $totalr) * 100}");
        top_cgs=` cat TMP_FLAT | grep "::${x}::Electronic" | awk '{FS="::"} {print $6 " " $7}' | sort -rn | uniq -c | sort -rn | head -5`

        fs=`grep "::${x}::Funk" TMP_FLAT | wc -l`;
        fsper=$(awk "BEGIN {print ($fs / $totalr) * 100}");

        fw=`grep "::${x}::Folk" TMP_FLAT | wc -l`;
        fwper=$(awk "BEGIN {print ($fw / $totalr) * 100}");

        sc=`grep "::${x}::Stage" TMP_FLAT | wc -l`;
        scper=$(awk "BEGIN {print ($sc / $totalr) * 100}");

        echo ' Pop: ' ${p} ' % [' ${pper} ']' ;
        echo ' Rock: ' ${r} ' % [' ${rper} ']' ;
	echo ' Electronic: ' ${e} ' % [' ${eper} ']';
        printf "    Electronic: \n ${top_cgs} \n";
        echo ' Funk / Soul: ' ${fs} ' % [' ${fsper} ']';
        echo ' Folk, World & Country: ' ${fw} ' % [' ${fwper} ']';
        echo ' Stage & Screen: ' ${sc} ' % [' ${scper} ']' ;
        fi;

        printf "\n";
done;
echo 'TOTAL SUM FOR FORMER SOVEREIGN STATES ("Post-War") : ' ${fmsum} ;

