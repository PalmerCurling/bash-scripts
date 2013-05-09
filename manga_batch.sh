#use this to batch rename a folder of pdfs to cbz for use in comic readers
IFS="\n"
ls ./*.pdf > pdf
cat pdf | while read a;
do
	chapter=${a}
	convert -density 600 $chapter "$chapter.jpg"
	tar -czvf ./$chapter.cbz *.jpg
	rm *.jpg
done

for file in ./*.pdf.cbz;
do
	mv "$file" "${file%.pdf.cbz}.cbz";
done

rm pdf
unset IFS;
