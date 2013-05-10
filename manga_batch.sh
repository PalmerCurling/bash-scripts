#use this to batch rename a folder of pdfs to cbz for use in comic readers
IFS="\n"
ls ./*.pdf > pdf
cat pdf | while read a;
do
	chapter=${a}
	chapter=${chapter%.pdf}
	convert -density 300 $a "$chapter.jpg"
	echo "ziping pages of $chapter"
	tar -czvf ./$chapter.cbz *.jpg
	rm *.jpg
done

#for file in ./*.pdf.cbz;
#do
#	mv "$file" "${file%.pdf.cbz}.cbz";
#done

rm pdf
unset IFS;
