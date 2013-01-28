# Brisbane Flood Projection Map 2013

The Brisbane City Council has released pdfs of their flood projections for the Brisbane floods of 28-29/01/2013
http://www.brisbane.qld.gov.au/community/community-safety/disasters-and-emergencies/BRFFS/index.htm

These pdfs were downloaded, parsed with pdftohtml 0.40a and stored in the input directory of this repository.

Scripts are provided for processing:

* strip-data.sh: extracts the likey to flood addresses, convering them to csv
* geocode.sh/read_geocode.py: runs these addresses against google's geocoding api, outputting a combined csv

This geocoded data was loaded into a Google Fusion Table, which is a handy way to display thousands of points on a map.



