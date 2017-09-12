echo 'Discogs Submission DB YEAR FREQ COUNT (TOP 10): '; cat ALL_FLATDB | awk '{FS="::"} {print $1}' | sort -rn | uniq -c | sort -n | tail -10 | sort -r
printf "\n"
echo 'Discogs DB Countries (TOP 10): '; cat ALL_FLATDB | awk '{FS="::"} {print $4}' | sort -rn | uniq -c | sort -rn | head -10
printf "\n"
echo 'Discogs DB Recording Labels (TOP 10): '; cat ALL_FLATDB | awk '{FS="::"} {print $2}' | sort -rn | uniq -c | sort -rn | head -10
printf "\n"
echo 'Discogs DB Electronic Recording Labels (TOP 10): '; grep '::Electronic' ALL_FLATDB | awk '{FS="::"} {print $2}' | sort -rn | uniq -c | sort -rn | head -10
printf "\n"
echo 'Discogs DB Rock Recording Labels (TOP 10): '; grep '::Rock' ALL_FLATDB | awk '{FS="::"} {print $2}' | sort -rn | uniq -c | sort -rn | head -10
printf "\n"
echo 'Discogs DB Hip Hop Recording Labels (TOP 10): '; grep '::Hip Hop' ALL_FLATDB | awk '{FS="::"} {print $2}' | sort -rn | uniq -c | sort -rn | head -10
printf "\n"
echo 'Discogs DB Pop Recording Labels (TOP 10): '; grep '::Pop' ALL_FLATDB | awk '{FS="::"} {print $2}' | sort -rn | uniq -c | sort -rn | head -10
printf "\n"
echo 'Discogs DB Recording Artists (TOP 10): '; cat ALL_FLATDB | awk '{FS="::"} {print $3}' | sort -rn | uniq -c | sort -rn | head -10
printf "\n"
echo 'Discogs DB Electronic Recording Artists (TOP 10): '; grep '::Electronic' ALL_FLATDB | awk '{FS="::"} {print $3}' | sort -rn | uniq -c | sort -rn | head -10
printf "\n"
echo 'Discogs DB Rock Recording Artists (TOP 10): '; grep '::Rock' ALL_FLATDB | awk '{FS="::"} {print $3}' | sort -rn | uniq -c | sort -rn | head -10
printf "\n"
echo 'Discogs DB Hip Hop Recording Artists (TOP 10): '; grep '::Hip Hop' ALL_FLATDB | awk '{FS="::"} {print $3}' | sort -rn | uniq -c | sort -rn | head -10
printf "\n"
echo 'Discogs DB Pop Recording Artists (TOP 10): '; grep '::Pop' ALL_FLATDB | awk '{FS="::"} {print $3}' | sort -rn | uniq -c | sort -rn | head -10
printf "\n"
echo 'Possible Duplicates: '; cat ALL_FLATDB | awk '{FS="::"} {print $1 " " $2 " " $3 " " $4}' | sort -rn | uniq -c | sort -rn | head -10
printf "\n"
printf "\n"
echo "Discogs Top Electronic Artists for Japan " ; cat FLAT_LATERDB | grep '::Japan' | grep '::Electronic' | awk '{FS="::"} {print $3}' | sort -rn | uniq -c | sort -rn | head -10
printf "\n"
echo "Discogs Top Electronic Artists for China " ; cat FLAT_LATERDB | grep '::China' | grep '::Electronic' | awk '{FS="::"} {print $3}' | sort -rn | uniq -c | sort -rn | head -10
printf "\n"
echo "Discogs Top Electronic Artists for US " ; cat FLAT_LATERDB | grep '::US' | grep '::Electronic' | awk '{FS="::"} {print $3}' | sort -rn | uniq -c | sort -rn | head -10
printf "\n"
echo "Discogs Top Electronic Artists for UK " ; cat FLAT_LATERDB | grep '::UK' | grep '::Electronic' | awk '{FS="::"} {print $3}' | sort -rn | uniq -c | sort -rn | head -10
printf "\n"
echo "Discogs Top Electronic Artists for South Korea " ; cat FLAT_LATERDB | grep '::South Korea' | grep '::Electronic' | awk '{FS="::"} {print $3}' | sort -rn | uniq -c | sort -rn | head -10
printf "\n"
echo "Discogs Top Electronic Artists for Taiwan " ; cat FLAT_LATERDB | grep '::Taiwan' | grep '::Electronic' | awk '{FS="::"} {print $3}' | sort -rn | uniq -c | sort -rn | head -10
printf "\n"
echo "Discogs Top Electronic Artists for Spain " ; cat FLAT_LATERDB | grep '::Spain' | grep '::Electronic' | awk '{FS="::"} {print $3}' | sort -rn | uniq -c | sort -rn | head -10
printf "\n"
echo "Discogs Top Electronic Artists for France " ; cat FLAT_LATERDB | grep '::France' | grep '::Electronic' | awk '{FS="::"} {print $3}' | sort -rn | uniq -c | sort -rn | head -10
printf "\n"
echo "Discogs Top Electronic Artists for Germany " ; cat FLAT_LATERDB | grep '::Germany' | grep '::Electronic' | awk '{FS="::"} {print $3}' | sort -rn | uniq -c | sort -rn | head -10
printf "\n"
