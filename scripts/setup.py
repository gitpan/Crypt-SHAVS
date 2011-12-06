#!/usr/bin/env python

""" setup.py: fetches and unzips the NIST test vectors

This is much easier in Python: modules to do fetching and unzipping are
included as part of the language.

"""

import os
import re
import urllib
import zipfile

ZIP = ('shabytetestvectors.zip', 'shabittestvectors.zip')
URL = 'http://csrc.nist.gov/groups/STM/cavp/documents/shs/';

for z in ZIP:
	if not os.path.isfile(z):
		urllib.urlretrieve(URL + z, z)

	if re.search('byte', z): to = 'BYTE'
	else:                    to = 'BIT'
	if not os.path.isdir(to):
		os.mkdir(to)

	zip = zipfile.ZipFile(z, 'r')
	for n in zip.namelist():
		f = open(os.path.join(to, n), 'w')
		f.write(zip.read(n))
		f.close()
