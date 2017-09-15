echo 'TOTAL'; cat FLATDB | wc -l
echo 'Pop: '; cat FLATDB | grep '::Pop' | wc -l
echo 'Rock: '; cat FLATDB | grep '::Rock' | wc -l
echo 'Electronic: '; cat FLATDB | grep '::Electronic' | wc -l
echo 'Hip Hop'; cat FLATDB | grep '::Hip Hop' | wc -l
echo '--------------'
echo 'China: '; cat FLATDB | grep '::China::' | wc -l
echo 'Vietnam: '; cat FLATDB | grep '::Vietnam::' | wc -l
echo 'Japan: '; cat FLATDB | grep '::Japan::' | wc -l
echo 'Australia: '; cat FLATDB | grep '::Australia::' | wc -l
echo 'New Zealand: '; cat FLATDB | grep '::New Zealand::' | wc -l
echo 'Thailand: '; cat FLATDB | grep '::Thailand::' | wc -l
echo 'Taiwan: '; cat FLATDB | grep '::Taiwan::' | wc -l
echo 'South Korea: '; cat FLATDB | grep '::South Korea::' | wc -l
echo 'Myanmar: '; cat FLATDB | grep '::Myanmar::' | wc -l
echo 'India: '; cat FLATDB | grep '::India::' | wc -l
echo 'Indonesia: '; cat FLATDB | grep '::Indonesia::' | wc -l
echo 'Laos: '; cat FLATDB | grep '::Laos::' | wc -l
echo 'Philippines: '; cat FLATDB | grep '::Philippines::' | wc -l
echo 'Malaysia: '; cat FLATDB | grep '::Malaysia::' | wc -l
echo 'Russia: '; cat FLATDB | grep '::Russia::' | wc -l
echo '--------------'
echo 'US: '; cat FLATDB | grep '::US::' | wc -l
echo 'UK: '; cat FLATDB | grep '::UK::' | wc -l
echo 'Germany: '; cat FLATDB | grep '::Germany::' | wc -l
echo 'France: '; cat FLATDB | grep '::France::' | wc -l
echo 'Spain: '; cat FLATDB | grep '::Spain::' | wc -l
echo 'Belgium: '; cat FLATDB | grep '::Belgium::' | wc -l
echo 'Netherlands: '; cat FLATDB | grep '::Netherlands::' | wc -l
echo 'Canada: '; cat FLATDB | grep '::Canada::' | wc -l
echo 'Mexico: '; cat FLATDB | grep '::Mexico::' | wc -l
echo '--------------'
