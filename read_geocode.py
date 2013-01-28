#!/usr/bin/env python
import json

fname = "/tmp/response.json"
with open(fname) as f:
    g = json.load(f)
    if g['status']  == 'OK':
        geo = g["results"][0]["geometry"]["location"]
        lat = geo["lat"]
        long = geo["lng"]
        print "%s\t%s" % (lat, long)
    

        

        
