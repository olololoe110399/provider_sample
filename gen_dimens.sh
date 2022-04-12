allNames=("fixed" "w" "h" "r" "sp")
allExts=("" ".w" ".h" ".r" ".sp")
allVar=("const" "final" "final" "final" "final")
allSize=(100 500 500 350 100)

DIR="output"
APP_DIMENS_PATH="$DIR/app_dimens.dart"

if [ -e $APP_DIMENS_PATH ]; then
    rm -fr $DIR
fi
mkdir $DIR
touch $APP_DIMENS_PATH
echo "import 'package:flutter_screenutil/flutter_screenutil.dart';" > $APP_DIMENS_PATH
echo "" >> $APP_DIMENS_PATH
echo "class AppDimens {" >> $APP_DIMENS_PATH
echo "\tconst AppDimens._();" >> $APP_DIMENS_PATH

i=0
size=${#allExts[@]}
while [[ $i -lt $size ]];
do
    echo "\t// ${allNames[$i]} dimens" >> $APP_DIMENS_PATH
    min=1
    while [[ $min -le ${allSize[$i]} ]]
    do 
      echo "\tstatic ${allVar[$i]} double ${allNames[$i]}$min = $min${allExts[$i]};"  >> $APP_DIMENS_PATH
      let min++
    done  
    let i++
done

echo "}" >> $APP_DIMENS_PATH
