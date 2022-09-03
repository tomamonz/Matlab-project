clear all 
clc
close all
%min/max1 = 4.2/18.
x1_low = 4.2;
x2_low = 4;
x3_low = 984;
x4_low = 3924.9;

%min/max2 = 4/98
%min/max3 = 984/1048
%min/max4 = 3924.9/4085.1
x1_max = 18;
x2_max = 98;
x3_max = 1048;
x4_max = 4085.1;
sygnal=[x1_low  x2_low  x3_low  x4_low
        x1_max x2_low  x3_low  x4_low
        x1_low  x2_max x3_low  x4_low
        x1_max x2_max x3_low  x4_low
        x1_low  x2_low  x3_max x4_low
        x1_max x2_low  x3_max x4_low
        x1_low  x2_max x3_max x4_low
        x1_max x2_max x3_max x4_low
        x1_low  x2_low  x3_low  x4_max
        x1_max x2_low  x3_low  x4_max
        x1_low  x2_max x3_low  x4_max
        x1_max x2_max x3_low  x4_max
        x1_low  x2_low  x3_max x4_max
        x1_max x2_low  x3_max x4_max
        x1_low  x2_max x3_max x4_max
        x1_max x2_max x3_max x4_max];
%{
for i=1:16
    [out1, out] = system(['z10v21.exe ' num2str(sygnal(i,:))]);
    y(i) = str2num(out)
end

save('dane.mat','y')



load('dane.mat','y')
kolumny = median(y)
     
        corplot()
%}
triks=[1 3 5 7
         2 3 5 7
         1 4 5 7
         2 4 5 7
         1 3 6 7
         2 3 6 7
         1 4 6 7
         2 4 6 7
         1 3 5 8
         2 3 5 8
         1 4 5 8
         2 4 5 8
         1 3 6 8
         2 3 6 8
         1 4 6 8
         2 4 6 8];
load('dane.mat','y')        
wyjsciowe=[y(1)  y(1)  y(1)  y(1)
        y(2)  y(2)  y(2)  y(2)
        y(3)  y(3)  y(3)  y(3)
        y(4)  y(4)  y(4)  y(4)
        y(5)  y(5)  y(5)  y(5)
        y(6)  y(6)  y(6)  y(6)
        y(7)  y(7)  y(7)  y(7)
        y(8)  y(8)  y(8)  y(8)
        y(9)  y(9)  y(9)  y(9)
        y(10) y(10) y(10) y(10)
        y(11) y(11) y(11) y(11)
        y(12) y(12) y(12) y(12)
        y(13) y(13) y(13) y(13)
        y(14) y(14) y(14) y(14)
        y(15) y(15) y(15) y(15)
        y(16) y(16) y(16) y(16)];
    
plot(triks, wyjsciowe, 'ko','MarkerFaceColor','r');
hold on;    
    
Mediana=[median(wyjsciowe(1:2:16,1)) median(wyjsciowe(2:2:16,1))
   median(wyjsciowe([1,2,5,6,9,10,13,14],2)) median(wyjsciowe([3,4,7,8,11,12,15,16],2))
   median(wyjsciowe([1,2,3,4,9,10,11,12],3)) median(wyjsciowe([5,6,7,8,13,14,15,16],3))
   median(wyjsciowe(1:1:8,4)) median(wyjsciowe(9:1:16,4))];

plot(1, Mediana(1,1),'ko','MarkerFaceColor','g')
plot(2,Mediana(1,2),'ko','MarkerFaceColor','g')
plot(3, Mediana(2,1),'ko','MarkerFaceColor','g')
plot(4,Mediana(2,2),'ko','MarkerFaceColor','g')
plot(5, Mediana(3,1),'ko','MarkerFaceColor','g')
plot(6,Mediana(3,2),'ko','MarkerFaceColor','g')
plot(7, Mediana(4,1),'ko','MarkerFaceColor','g')
plot(8,Mediana(4,2),'ko','MarkerFaceColor','g')

xx = 1:1:8;

xticks(xx)
names={'x1-','x1+','x2-','x2+','x3-','x3+','x4-','x4+'};
xticklabels(names)

med_diff=[abs(Mediana(1,1)-Mediana(1,2))
          abs(Mediana(2,1)-Mediana(2,2))
          abs(Mediana(3,1)-Mediana(3,2))
          abs(Mediana(4,1)-Mediana(4,2))];

plot([1 2],[Mediana(1,1) Mediana(1,2)],'k-')
plot([3 4],[Mediana(2,1) Mediana(2,2)],'k-')
plot([5 6],[Mediana(3,1) Mediana(3,2)],'k-')
plot([7 8],[Mediana(4,1) Mediana(4,2)],'k-')





