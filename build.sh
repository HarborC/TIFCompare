mkdir build
cd build
cmake .. -DCMAKE_PREFIX_PATH="/usr/local/Cellar/qt@5/5.15.2_1/;/usr/local/Cellar/gdal/3.4.1_1/"
make -j4