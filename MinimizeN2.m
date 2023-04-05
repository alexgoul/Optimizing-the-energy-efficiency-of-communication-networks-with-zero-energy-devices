clear;
clc;

global a Rth1 Rth2 T Phar Pc
T= 1;
Phar= 1*10^-3;
Rth_values=[0.1 0.2];
Pc_values=0:0.1:1; %Fig2:circuit power
a_dB_values=10:30; %Fig1: poiothta kanaliou epikoinwnias se dB
PTOT1=zeros(length(Rth_values),length(a_dB_values));
PTOT2=zeros(3,length(Pc_values));
u=1;
for i=1:length(a_dB_values)
        a = 10^(a_dB_values(i)/10); % metatroph dB se pragmatikh timh
        for j=1:length(Rth_values)
                Rth1=Rth_values(j);
                Rth2=Rth_values(j);
                Pc=0.1*10^-3;
                myfun=@(x)(-x(1))+0*(x(2)+x(3)+x(4)+x(5)+x(6)+x(7));
                x0= [-0.1; 0; 0; 0; 0; 0; 0]; % t0, t1,t2,R1,R2,P1,P2
                nonlcon= @constrainsN2;
                A= [1, 0, 0, 0, 0, 0, 0; 0, 1, 0, 0, 0, 0, 0; 0, 0, 1, 0, 0, 0, 0];
                b= [0; 0; 0;];
                options=optimset('Display','none','MaxIter',10^5,'MaxFunEvals',10^5);
                [x,fval,exitflag,output,lambda,grad,hessian] = fmincon(myfun,x0,A,b,[],[],[],[],nonlcon,options);
                x_opt1(:,1)=exp(x(:,1)); %metatrepw tis metablhtes t0,tk,Rk,Pk stis pragmatikes times tous
                x_opt1([4,5],1)=log2(exp(x([4,5],1))+1); % metatroph P1, P2
                PTOT1(j,i)=x_opt1(6)+x_opt1(7);% Fig1:total transmit power         
        end
        if a==10 || a==100 || a==1000
             for j=1:length(Pc_values)
             Pc=Pc_values(j)*10^-3;
             Rth1=Rth_values(1);
             Rth2=Rth_values(2);
             myfun=@(x)(-x(1))+0*(x(2)+x(3)+x(4)+x(5)+x(6)+x(7));
             x0= [-0.1; 0; 0; 0; 0; 0; 0]; % t0, t1,t2,R1,R2,P1,P2
             nonlcon= @constrainsN2;
             A= [1, 0, 0, 0, 0, 0, 0; 0, 1, 0, 0, 0, 0, 0; 0, 0, 1, 0, 0, 0, 0];
             b= [0; 0; 0;];
             options=optimset('Display','none','MaxIter',10^5,'MaxFunEvals',10^5);
             [x,fval,exitflag,output,lambda,grad,hessian] = fmincon(myfun,x0,A,b,[],[],[],[],nonlcon,options);
             x_opt2(:,1)=exp(x(:,1)); %metatrepw tis metablhtes t0,tk,Rk,Pk stis pragmatikes times tous
             x_opt2([4,5],1)=log2(exp(x([4,5],1))+1); % metatroph P1, P2
             PTOT2(u,j)=x_opt2(6)+x_opt2(7);% Fig2:total transmit power
             end
             u=u+1;
       end
end
figure
plot(a_dB_values,PTOT1(1,:),a_dB_values,PTOT1(2,:))
xlabel('g');
ylabel('Ptot');
figure
plot(Pc_values,PTOT2(1,:),Pc_values,PTOT2(2,:),Pc_values,PTOT2(3,:))

function[c, ceq]= constrainsN2(x)
global a Rth1 Rth2 T Phar Pc
%gia ton xrhsth 1:t0=x(1) t1=x(2) R1=x(4) P1=x(6)
c(1)=exp(x(4)-x(6))/a-log(log2(exp(x(4))+1))-x(1)-x(2)+log(Rth1)-log(T);
c(2)=log(exp(x(6))+Pc)-log(1-exp(x(1)))+x(2)-log(Phar);
%gia ton xrhsth 2: t0=x(1) t2=x(3) R2=x(5) P2=x(7)
c(3)=exp(x(5)-x(7))/a-log(log2(exp(x(5))+1))-x(1)-x(3)+log(Rth2)-log(T);
c(4)=log(exp(x(7))+Pc)-log(1-exp(x(1)))+x(3)-log(Phar);
ceq=[];
end
