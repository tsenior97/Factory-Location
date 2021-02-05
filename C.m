function out=C(x,y)
x1=sqrt((x-22)^2+(y-9)^2);
x2=sqrt((x-12)^2+(y-39)^2);
x3=sqrt((x-53)^2+(y-50)^2);
x4=sqrt((x-94)^2+(y-21)^2);
x5=sqrt((x-50)^2+(y-18)^2);
k1=23;
k2=15;
k3=25;
k4=18;
k5=14;
out=(k1*x1+k2*x2+k3*x3+k4*x4+k5*x5);
end