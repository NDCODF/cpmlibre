ZIP=`which zip`
Productname=cpmlibre


all:
	cd src; \
	${ZIP} -r ../${Productname}.oxt *; \
	cd -; \
	echo -e "\nbuild ${Productname} success..."
