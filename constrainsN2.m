function[c, ceq]= constrainsN2(x)
global a Rth1 Rth2 T Phar Pc
%gia ton xrhsth 1:t0=x(1) t1=x(2) R1=x(4) P1=x(6)
c(1)=exp(x(4)-x(6))/a-log(log2(exp(x(4))+1))-x(1)-x(2)+log(Rth1)-log(T);
c(2)=log(exp(x(6))+Pc)-log(1-exp(x(1)))+x(2)-log(Phar);
%gia ton xrhsth 2: t0=x(1) t2=x(3) R2=x(5) P2=x(7)
c(3)=exp(x(5)-x(7))/a-log(log2(exp(x(5))+1))-x(1)-x(3)+log(Rth2)-log(T);
c(4)=log(exp(x(7))+Pc)-log(1-exp(x(1)))+x(3)-log(Phar);
ceq=[];