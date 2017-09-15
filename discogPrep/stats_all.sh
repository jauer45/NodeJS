printf 'TOTAL '; cat ALL_FLATDB | wc -l
printf 'Pop: '; cat ALL_FLATDB | grep '::Pop' | wc -l
printf 'Rock: '; cat ALL_FLATDB | grep '::Rock' | wc -l
printf 'Electronic: '; cat ALL_FLATDB | grep '::Electronic' | wc -l
printf 'Hip Hop: '; cat ALL_FLATDB | grep '::Hip Hop' | wc -l
printf "\n"
printf 'China: '; cat ALL_FLATDB | grep '::China::' | wc -l
printf 'Vietnam: '; cat ALL_FLATDB | grep '::Vietnam::' | wc -l
printf 'Japan: '; cat ALL_FLATDB | grep '::Japan::' | wc -l
printf 'Australia: '; cat ALL_FLATDB | grep '::Australia::' | wc -l
printf 'New Zealand: '; cat ALL_FLATDB | grep '::New Zealand::' | wc -l
printf 'Thailand: '; cat ALL_FLATDB | grep '::Thailand::' | wc -l
printf 'Taiwan: '; cat ALL_FLATDB | grep '::Taiwan::' | wc -l
printf 'South Korea: '; cat ALL_FLATDB | grep '::South Korea::' | wc -l
printf 'Myanmar: '; cat ALL_FLATDB | grep '::Myanmar::' | wc -l
printf 'India: '; cat ALL_FLATDB | grep '::India::' | wc -l
printf 'Indonesia: '; cat ALL_FLATDB | grep '::Indonesia::' | wc -l
printf 'Laos: '; cat ALL_FLATDB | grep '::Laos::' | wc -l
printf 'Philippines: '; cat ALL_FLATDB | grep '::Philippines::' | wc -l
printf 'Malaysia: '; cat ALL_FLATDB | grep '::Malaysia::' | wc -l
printf 'Russia: '; cat ALL_FLATDB | grep '::Russia::' | wc -l
printf "\n" 
printf 'US: '; cat ALL_FLATDB | grep '::US::' | wc -l
printf 'UK: '; cat ALL_FLATDB | grep '::UK::' | wc -l
printf 'Germany: '; cat ALL_FLATDB | grep '::Germany::' | wc -l
printf 'France: '; cat ALL_FLATDB | grep '::France::' | wc -l
printf 'Spain: '; cat ALL_FLATDB | grep '::Spain::' | wc -l
printf 'Belgium: '; cat ALL_FLATDB | grep '::Belgium::' | wc -l
printf 'Netherlands: '; cat ALL_FLATDB | grep '::Netherlands::' | wc -l
printf 'Canada: '; cat ALL_FLATDB | grep '::Canada::' | wc -l
printf 'Mexico: '; cat ALL_FLATDB | grep '::Mexico::' | wc -l
printf "\n"
