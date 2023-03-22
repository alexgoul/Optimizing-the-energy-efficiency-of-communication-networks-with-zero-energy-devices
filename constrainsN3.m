function[c, ceq]= constrainsN3(x)
global a Rth1 Rth2 Rth3 T Phar Pc
%gia ton xrhsth 1:t0=x(1) t1=x(2) R1=x(5) P1=x(8)
c(1)=exp(x(5)-x(8))/a-log(log2(exp(x(5))+1))-x(1)-x(2)+log(Rth1)-log(T);
c(2)=log(exp(x(8))+Pc)-log(1-exp(x(1)))+x(2)-log(Phar);
%gia ton xrhsth 2: t0=x(1) t2=x(3) R2=x(6) P2=x(9)
c(3)=exp(x(6)-x(9))/a-log(log2(exp(x(6))+1))-x(1)-x(3)+log(Rth2)-log(T);
c(4)=log(exp(x(9))+Pc)-log(1-exp(x(1)))+x(3)-log(Phar);
%gia ton xrhsth 3: t0=x(1) t3=x(4) R3=x(7) P3=x(10)
c(5)=exp(x(7)-x(10))/a-log(log2(exp(x(7))+1))-x(1)-x(4)+log(Rth3)-log(T);
c(6)=log(exp(x(10))+Pc)-log(1-exp(x(1)))+x(2)-log(Phar);
ceq=[];