reset
#set terminal epslatex size 20cm,14cm
set terminal epslatex size 16.8cm,12cm

set style line 80 lt rgb "#000000" lw 2
set style line 81 lt rgb "#EBEBEB"
set style line 80 lt 1
set style line 81 lt 1

set border 3 back linestyle 80

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
set style line 3 lt 3

set xtics 0,100,400
set ytics 0,0.5,1.0
#set label 10 "$ T,{^oC} $" at 550,-0.089
set label 10 "$ T,{^oC} $" at 450,-0.100
set label 11 "$ \\rm \\sigma_s $" at 20,1.08 

set key top right 
set format y "%.1f"

set output "is-metod.tex"

set multiplot layout 2,2 
#set label 12 "$ x=0.2 $" at 520,0.8
#set arrow 1 from -4,.35 to -3.4,0.2

#set label 12 "$ x=0.3 $" at 520,0.8


max=98
udel=1
curie=580
file="is-no15f.dat"
set label 12 "" at 220,0.7
set xlabel "(а)"
a(x)=(x>50&&x<300 ? (-0.8447704*x+100.7461916)/max:sqrt(-1))
b(x)=(x>50&&x<300 ? (-0.0346741*x+16.1541588)/max:sqrt(-1))

plot [0:500] [0:(udel+0.1)] file u 2:($4*udel/max) every 4::1::curie t "" smooth bezier w l ls 1, a(x) t '' , b(x) t ''

set xtics 0,100,600
set label 10 "$ T,{^oC} $" at 650,-0.100
set label 12 "" at 220,0.7
set label 11 "$ 1/\\varkappa $" at 220,1.08 
set xlabel "(б)"
c(x)=(x>400&&x<600 ? (0.0122117*x-5.78)/1:sqrt(-1))
plot [200:700][0:1.1] "RENA8.CUR" u 1:(380/($2+500)) t "" w l ls 1, c(x) t ""


set xtics 0,100,400
set ytics 0,0.5,1.0
#set label 10 "$ T,{^oC} $" at 550,-0.089
set label 10 "$ T,{^oC} $" at 450,-0.100
set label 11 "$ \\rm (\\sigma_s)^2 $" at 20,1.08 

set key top right 
set format y "%.1f"

max=98
udel=1
curie=580
file="is-no15f.dat"
set label 12 "" at 220,0.7
set xlabel "(в)"
a(x)=(x>20&&x<300 ? (-1.9947704*x+130.7461916)/max:sqrt(-1))
b(x)=(x>50&&x<300 ? (-0.0346741*x+7.1541588)/max:sqrt(-1))

plot [0:500] [0:(udel+0.1)] file u 2:($4*udel/max)*($4*udel/max) every 4::1::curie t "" smooth bezier w l ls 1, a(x) t '' , b(x) t ''

set xtics 0,100,600
set label 10 "$ T,{^oC} $" at 650,-0.100
set label 12 "" at 220,0.7
set label 11 "$ \\varkappa $" at 20,1.08 
set xlabel "(г)"
c(x)=(x>100&&x<600 ? (-0.0047617*x+2.42)/1:sqrt(-1))
d(x)=(x>400&&x<600 ? (-0.00005947704*x+0.0641916)/1:sqrt(-1))
plot [0:700][0:1.1] "RENA8.CUR" u 1:(($2+500)/13230.2) t "" w l ls 1, c(x) t "", d(x) t ''



unset multiplot

