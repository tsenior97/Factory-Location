function BF(C,a,b)
% fun=@(x,y) x^4+x*y+y^2+2*y
syms x y t
x0=[a b];
n=1;
dfx=diff(C,x);
dfy=diff(C,y);
DF=[dfx;dfy];
H0=eye(2);
m=100;
z1=0.1;
z2=0.2;



for i=1:n
    DF0=-subs(DF,[x,y],{x0});
    s0=-H0*DF0;
    rhs=subs(C,{x,y},{x0+t*s0.'});
    
    a1=-5;
    b1=5;
    gam=(-1+sqrt(5))/2; 
    tol=5*10^-7; 
    t1=b1-gam*(b1-a1);
    t2=a1+gam*(b1-a1);
    ft1=subs(rhs,t1);
    ft2=subs(rhs,t2);
    
    for j=1:m
        while abs(b1-a1)>tol
            if(ft1<ft2)
        b1=t2;
        t2=t1;
        t1=b1-gam*(b1-a1);
        ft1=subs(rhs,t1);
        ft2=subs(rhs,t2);
        fti=subs(C,{x,y},{x0+t1*s0.'});
        fi=subs(C,{x,y},{x0});
        DFi=subs(DF,{x,y},{x0+t1*s0.'});
        if fi-fti>=-z1*t1*s0.'*DF0 && s0.'*DFi>=z2*s0.'*DF0
             break
        end
    else
        a1=t1;
        t1=t2;
        t2=a1+gam*(b1-a1);
        ft1=subs(rhs,t1);
        ft2=subs(rhs,t2);
        fti=subs(C,{x,y},{x0+t2*s0.'});
        fi=subs(C,{x,y},{x0});
        DFi=subs(DF,{x,y},{x0+t2*s0.'});
        if fi-fti>=-z1*t2*s0.'*DF0 && s0.'*DFi>=z2*s0.'*DF0
             break
        end
            end
        end
    end
    
if(ft1<ft2)
    t0=t1;
else
    t0=t2;
end

    x1=x0+t0*s0.';
    v=x1.'-x0.';
    DF1=-subs(DF,[x,y],{x1});
    g0=DF1-DF0;
    w=H0*(g0);
    H0=H0+(1+(w.'*g0)/(v.'*g0))*(v*v.')/(v.'*g0)-(v*w.'+w*v.')/(v.'*g0);
    x0=x1;
end

    funt=eval(subs(C,{x,y},{x0}));
    fprintf('Minimizer vector is : [');
    fprintf('%.4f ', x0);
    fprintf(']\n');
    fprintf('Minimum: %.4f \n',funt)  
end