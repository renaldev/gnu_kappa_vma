reset
#set terminal epslatex size 20cm,14cm
set terminal epslatex size 16cm,8.5cm

set style line 80 lt rgb "#000000" lw 2
set style line 81 lt rgb "#EBEBEB"
set style line 80 lt 1
set style line 81 lt 1


#set grid back linestyle 81
set border 3 back linestyle 80
#set xzeroaxis linestyle 80 

set style line 3 lt 3
#set xzeroaxis ls 80
#set yzeroaxis ls 80
#set xtics axis autofreq
#set ytics axis autofreq

set xtics nomirror
set ytics nomirror
#set tics in scale 0.5
set key right bottom samplen 2.5
set bmargin 3
set tmargin 0
set lmargin 3
set rmargin 1


set style line 1 lt rgb "#000000" lw 4 pt 7
set style line 1 lt 1
set style line 2 lt rgb "#000000" lw 4 pt 7
set style line 2 lt 2
set style line 3 lt rgb "#000000" lw 4 

set xtics 0,100,600
set ytics 0.2,0.2,1.2
set label 10 "$ T,{^oC} $" at 660,-0.125
set label 11 "$ \\kappa/\\kappa_{max} $" at -20,1.08 

set key top right 
set format y "%.1f"

set output "kappa-out.tex"

set multiplot layout 2,3 

set label 5 "x=0 (1-й нагрев)" at 50,0.2
set xlabel "(а)"
set arrow 1 filled from 277,0.9 to 303,0.75
set arrow 2 filled from 430,0.4 to 407,0.55
plot [0:700] "RENALD18.CUR" u 1:(($2+159.3)/3964.6) t "" w l ls 1

set label 5 "x=0.6 (1-й нагрев)" at 200,0.5
set xlabel "(б)"
set arrow 1 filled from 100,0.3 to 65,0.41 
set arrow 2 filled from 90,0.6  to 110,0.45
plot [0:700] "kappa-e.txt" u 1:(($2-30.8028)/3459.8219) t "" w l ls 1

set label 5 "x=0.6 (3-й нагрев)" at 300,0.5
set xlabel "(в)"
set arrow 1 filled from 240,0.45 to 220,0.6 
set arrow 2 filled from 100,0.34  to 150,0.25
plot [0:700] "kappa-e2.txt" u 1:(($2+102.1)/8601.3) t "" w l ls 1

set label 5 "x=0.8 (1-й нагрев)" at 220,0.5
unset label 11
set xlabel "(г)"
set arrow 1 filled from 90,0.17 to 160,0.10
set arrow 2 filled from 150,0.45 to 120,0.6
plot [0:700] "kappa-g.txt" u 1:(($2-39.0173)/3011.6858) t "" w l ls 1

set label 5 "x=0.8 (2-й нагрев)" at 230,0.6
set xlabel "(д)"
set arrow 1 filled from 85,0.4 to 125,0.25
set arrow 2 filled from 185,0.45 to 160,0.6
plot [0:700] "kappa-g2.txt" u 1:(($2+200)/4434.7) t "" w l ls 1

set label 5 "x=1.0 (1-й нагрев)" at 200,0.6
set xlabel "(е)"
set arrow 1 filled from 90,0.2 to 150,0.15
set arrow 2 filled from 140,0.45 to 110,0.6
plot [0:700] "RENALD20.CUR" u 1:(($2+152.9)/ 3379.6) t "" w l ls 1

unset multiplot
