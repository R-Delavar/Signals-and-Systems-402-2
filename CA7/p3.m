syms y(t)
Dy= diff(y);
ode= diff(y,t,2)+3*diff(y,t,1)+2*y==5*heaviside(t);
condtion1=y(0)==1;
condition2=Dy(0)==1;
conds=[condtion1 condition2];

yResult(t)=dsolve(ode,conds);
yResult=simplify(yResult);

tstart=0;tend=10;ts=1/100;
t1=tstart:ts:tend-ts;

y=(exp(-2.*t1).*(5*exp(2.*t1) + 2.*exp(t1) + 5.*sign(t1)- 10.*exp(t1).*sign(t1) + 5.*exp(2.*t1).*sign(t1) - 3))/4;


plot(t1,y,Linewidth=2);
title('y(t)');
grid on