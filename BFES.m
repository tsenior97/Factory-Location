function BFES(a,b)
syms x y t
x0=[a b];
n=20;
H0=eye(2);
m=100;
z1=0.1;
z2=0.2;
tol2=0.001;
counter=1;
for i=1:n
    DF0=DF(x0(1),x0(2));
    s0=-H0*DF0;
    tz=x0+t*s0.';
    rhs=C(tz(1),tz(2));
    
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
            tz1=x0+t1*s0.';
            fti=C(tz1(1),tz1(2));
            fi=C(x0(1),x0(2));
            DFi=DF(tz1(1),tz1(2));
            if fi-fti>=-z1*t1*s0.'*DF0 && s0.'*DFi>=z2*s0.'*DF0
             break
            end
            
    else
        a1=t1;
        t1=t2;
        t2=a1+gam*(b1-a1);
        ft1=subs(rhs,t1);
        ft2=subs(rhs,t2);
        tz2=x0+t2*s0.';
        fti=C(tz2(1),tz2(2));
        fi=C(x0(1),x0(2));
        DFi=DF(tz2(1),tz2(2));
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
    err=norm(x1-x0,inf);
    if err<tol2
        break
    else
    v=x1.'-x0.';
    DF1=DF(x1(1),x1(2));
    g0=DF1-DF0;
    w=H0*(g0);
    H0=H0+(1+(w.'*g0)/(v.'*g0))*(v*v.')/(v.'*g0)-(v*w.'+w*v.')/(v.'*g0);
    x0=x1;
    counter=1+counter;
    end
end

    funt=C(x1(1),x1(2));
    fprintf('Minimizer vector is : [');
    fprintf('%.4f ', x1);
    fprintf(']\n');
    fprintf('Minimum: %.4f \n',funt)  
    fprintf('Iterations: %.4f \n',counter)
end