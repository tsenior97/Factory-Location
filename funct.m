function funct
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
C=(k1*x1+k2*x2+k3*x3+k4*x4+k5*x5);
end
% 3D plot of problem
ezsurf(char(C),[0 100 0 100])
xlabel('xi')
ylabel('yi')
zlabel('Cost')
title('Factory Location Problem')

%Contour plot of problem
% fc=fcontour(C,[0 100],'MeshDensity',1000)
% fc.LevelList =[1500 2000 2500 3000 3500 4000 4500 5000 5500 6000 6500 7000 7500 8000]
% xlabel('xi')
% ylabel('yi')
% title('Factory Location Problem')