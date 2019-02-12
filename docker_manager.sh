#!/bin/bash
docker stop tordocker1 tordocker2 tordocker3 tordocker4 tordocker5
docker rm tordocker1 tordocker2 tordocker3 tordocker4 tordocker5
docker run --rm -d --volumes-from onionlinkset-volume --name tordocker1 larkjh/tbselcrawler:0.7 python3 /home/tordocker/tbSelenium/tor_pageCrawler_tab.py 1 120
docker run --rm -d --volumes-from onionlinkset-volume --name tordocker2 larkjh/tbselcrawler:0.7 python3 /home/tordocker/tbSelenium/tor_pageCrawler_tab.py 2 120 
docker run --rm -d --volumes-from onionlinkset-volume --name tordocker3 larkjh/tbselcrawler:0.7 python3 /home/tordocker/tbSelenium/tor_pageCrawler_tab.py 3 120
docker run --rm -d --volumes-from onionlinkset-volume --name tordocker4 larkjh/tbselcrawler:0.7 python3 /home/tordocker/tbSelenium/tor_pageCrawler_tab.py 4 120
docker run --rm -d --volumes-from onionlinkset-volume --name tordocker5 larkjh/tbselcrawler:0.7 python3 /home/tordocker/tbSelenium/tor_pageCrawler_tab.py 5 120
