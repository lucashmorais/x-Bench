#!/bin/bash

tar -xvf ppm/Image1.ppm.tar.bz2 -C ppm/
(time ./cjpeg -quality 100 ppm/Image1.ppm >jpegOut/ImageTest1) 2>&1 | tee log/log1
diff jpeg/ImageTest1 jpegOut/ImageTest1

tar -xvf ppm/Image2.ppm.tar.bz2 -C ppm/
(time ./cjpeg -quality 100 ppm/Image2.ppm >jpegOut/ImageTest2) 2>&1 | tee log/log2
diff jpeg/ImageTest2 jpegOut/ImageTest2

tar -xvf ppm/Image3.ppm.tar.bz2 -C ppm/
(time ./cjpeg -quality 100 ppm/Image3.ppm >jpegOut/ImageTest3) 2>&1 | tee log/log3
diff jpeg/ImageTest3 jpegOut/ImageTest3

tar -xvf ppm/Image4.ppm.tar.bz2 -C ppm/
(time ./cjpeg -quality 100 ppm/Image4.ppm >jpegOut/ImageTest4) 2>&1 | tee log/log4
diff jpeg/ImageTest4 jpegOut/ImageTest4

tar -xvf ppm/Image5.ppm.tar.bz2 -C ppm/
(time ./cjpeg -quality 100 ppm/Image5.ppm >jpegOut/ImageTest5) 2>&1 | tee log/log5
diff jpeg/ImageTest5 jpegOut/ImageTest5

tar -xvf ppm/Image6.ppm.tar.bz2 -C ppm/
(time ./cjpeg -quality 100 ppm/Image6.ppm >jpegOut/ImageTest6) 2>&1 | tee log/log6
diff jpeg/ImageTest6 jpegOut/ImageTest6
