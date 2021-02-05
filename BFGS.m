function BFGS(fun,a,b)
% fun=@(x,y) x^4+x*y+y^2+2*y
syms x y t
x0=[a b];
n=2;
dfx=diff(fun,x);
dfy=diff(fun,y);
DF=[dfx;dfy];
H0=eye(2);
m=10;

for i=1:n
    DF0=-subs(DF,[x,y],{x0});
    s0=-H0*DF0;
    rhs=subs(fun,{x,y},{x0+t*s0.'});
    dt=diff(rhs,t);
    ddt=diff(dt,t);
    t0=0;
    for j=1:m
        dt0=vpa(subs(dt,t,t0));
        ddt0=vpa(subs(ddt,t,t0));
        y1=t0-dt0/ddt0;
        t0=y1;
    end
    x1=x0+t0*s0.';
    v=x1.'-x0.';
    DF1=-subs(DF,[x,y],{x1});
    g0=DF1-DF0;
    w=H0*(g0);
    H0=H0+(1+(w.'*g0)/(v.'*g0))*(v*v.')/(v.'*g0)-(v*w.'+w*v.')/(v.'*g0);
    x0=x1;
end
fprintf('Minimum: %.6f \n',x0)
fprintf('Minimum: %.6f \n',t0)
end




