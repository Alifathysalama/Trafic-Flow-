%%alge-bros traffic_flow_model 
nt=60;  %no. of grid in time
nx=100; %No. of grid points 
dx=0.1 ;% step in x direction 
dt=0.1 ;% step in time 
x=(0:0.1:10) ; % length of the higway
t=(0:0.1:6) ; % time in minute of the observation 
u=zeros(nx+1,nt+1); % speed as function of space and time u(x,t)
R=zeros(nx+1,nt+1); %  number of cars per unit length as a function of space and time R(x,t)
global umax  Rmax   
umax=0.8 ; Rmax=55;
% boundary condition
for i=1:nx+1
  R(i,1)=30+25*sin(pi*x(i));
end
plot(x,R,'r')
xlabel('Highway[Km]')
ylabel('car density/ Km')
for i=i:nt+1
   R(1,i)=21; 
end
for i=1:nx+1
    u(i,1)=umax*(1-((R(i,1)/Rmax))) ;
end
figure(2)
plot(R,u)
xlabel('density')
ylabel('car velocity')
R6=R;  
for i=2:nx+1
    for j=1:nt+1
        R6(i,j+1)=R(i,j)-((0.1/0.1)*((umax*(1-(R(i,j)/Rmax)))*(R(i,j)-R(i-1,j))+R(i,j)*(umax*(1-(R(i,j)/Rmax))-umax*(1-(R(i-1,j)/Rmax)))));
    end
end
figure(3)
plot(x,R6,'r--',x,R,'k')
legend({'after 6 min'})
xlabel('Highway[Km]')
ylabel('car density/ Km')
for i=2:nx+1
    for j=1:nt+1
        u(i,j)=umax*(1-((R(i,j)/Rmax)));
    end
end
q=R;
for i=1:nx+1
        q(i)=u(i)*R6(i);
end
figure(4)
plot(x,q,'b')
legend({'Flux'})
 xlabel('Highway[Km]')
ylabel('Flux(q)')
figure(5)
plot(x,u)
xlabel('Highway[Km]')
ylabel('Car velocity in (0.1Km/sec)')
figure(6)
plot(q,u,'b')
legend({'Flux/velocity relation'})
xlabel('Flux(q)')
ylabel('Car velocity in (0.1Km/sec)')
figure(7)
plot(R,q,'g')
legend({'Flux/density relation'})
xlabel('Flux(q)')
ylabel('car density/ Km')
%%copy right to alge-bros
