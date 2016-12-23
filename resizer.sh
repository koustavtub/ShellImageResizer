#!/bin/bash

echo -e "\033[31m -----------------------------------------------------------"
echo ""
echo "▁ ▂ ▄ ▅ ▆ ▇ █ ĸoυѕтav'z ѕнell ιмage reѕιzer  █ ▇ ▆ ▅ ▄ ▂ ▁"
echo ""
echo "-----------------------------------------------------------"
echo -e "\033[0m "


function RecursiveResize
{
	echo ""
	echo "--------------------------------- Converting Images in `pwd` ---------------------------------"
	for file in `pwd`/*
	do
		
	#Check if the file is among the allowed image extensions (Add your own if you want like .tiff)
	
	   	case "$file" in  *.jpg | *.jpeg| *.gif| *.png| *.JPG| *.PNG| *.JPEG| *.GIF ) 
	        
		        #Change Resolution if Required... Default is ( 2073600 = 1920x1080 )"
		        convert $file -resize @2073600\> $file
		        echo "Yay! Converted ${file}" 	        
	        ;;
	        *)
	         	echo  -e "\033[33m $file is NOT an Image .. \033[0m "
	        ;;
	   	esac
	
	#Check if Directory and Go Into Directory and recursively call this function
	
		if [[ -d "${file}" ]]; then
	            cd "${file}"
	            RecursiveResize $(ls -1 ".")
	            cd ..
	     fi
    done
}
#Finally Call The Recursive Function
RecursiveResize
