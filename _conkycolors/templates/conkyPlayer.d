${image /tmp/conkycolors/conkyCover.png -s 294x174 -p 10,635}
${exec /home/epsilonhalbe/.conkycolors/bin/albumart}${image /home/epsilonhalbe/.albumart -s 174x174 -p 20,640}
${if_running rhythmbox}
${voffset -22}${color0}${font Musicelements:size=18}z${font}${color}${voffset -8}${goto 32}Status:${alignr}${color2}[--datatype=ST]${color}

#${if_match "foo" == "foo"}
#foo==bar
#sed /[--datatype=AR]/==Unknown/
#$else
#foo!=bar
#$endif

${goto 10}Artist: ${color1}[--datatype=AR]${color}

${goto 10}Album: ${color1}[--datatype=AL]${color}

${goto 10}Title: ${color1}[--datatype=TI]${color}

${goto 10}${color1}Duration: [--datatype=PT]/[--datatype=LE]${color}${voffset -8}

$else
${voffset -22}${color0}${font Musicelements:size=18}z${font}${color}${voffset -8}${goto 32}Status:${alignr}${color2}off${color}
$endif
