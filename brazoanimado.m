close all
clear all
clc

prompt= 'Cuanto deseas rotar con respecto la primera extremidad del brazo;';
theta1 = input(prompt);
prompt= 'Cuanto deseas rotar con respecto la segunda extremidad del brazo:';
theta2 = input(prompt);

%Funcion para realizar la conversiones en radianes

imprimir1();
p1=[0; 0; 0];
l1=8;

theta1_rad = deg2rad(theta1);
%-----------------------------------------------------------------------------------------------------
% Rotacion y traslacion desde el origen 

for theta1_rad=0:0.1:theta1_rad
    clf
   
    %Matriz de rotacion en Z
    TRz1= [cos(theta1_rad) -sin(theta1_rad) 0 0;sin(theta1_rad)  cos(theta1_rad) 0 0;  0 0  1 0; 0 0 0 1];

    %Matriz de traslacion en X
    Ttx1=[1 0 0 l1; 0 1 0 0 ; 0 0 1 0 ; 0 0 0 1];

    T1=TRz1*Ttx1;
    p2=T1(1:3,4);

    v1x=TRz1(1:3,1);
    v1y=TRz1(1:3,2);

    v2x=p2+T1(1:3,1);
    v2y=p2+T1(1:3,2);

    line([p1(1) p2(1)], [p1(2) p2(2)],[p1(2) p2(2)],'color',[.7 .3 .7],'linewidth',5);

    line([p1(1) v1x(1)], [p1(2) v1x(2)],[p1(2) v1x(2)],'color',[1 0 0],'linewidth',5);
    line([p1(1) v1y(1)], [p1(2) v1y(2)],[p1(2) v1y(2)],'color',[0 1 0],'linewidth',5);


    line([p2(1) v2x(1)], [p2(2) v2x(2)],[p2(2) v2x(2)],'color',[1 0 0],'linewidth',5);
    line([p2(1) v2y(1)], [p2(2) v2y(2)],[p2(2) v2y(2)],'color',[0 1 0],'linewidth',5);
    l2=4;

    theta2_rad = deg2rad(0);
    
    %-------------------------------Matriz de rotacion en Z-----------------------
    TRz2= [cos(theta2_rad) -sin(theta2_rad) 0 0; sin(theta2_rad)  cos(theta2_rad) 0 0; 0 0 1 0; 0 0 0 1];
      
    %-------------------------------Matriz de traslacion en X--------------
    Ttx2=[1 0 0 l2; 0 1 0 0 ; 0 0 1 0 ; 0 0 0 1];

      T2 = TRz2*Ttx2;
      Tf=T1*T2;
      p3=Tf(1:3,4);

      v3x=p3+Tf(1:3,1);
      v3y=p3+Tf(1:3,2);

      line([p2(1) p3(1)], [p2(2) p3(2)], [p2(2) p3(2)],'color',[.8 .2 .4],'linewidth',5);

      line([p3(1) v3x(1)], [p3(2) v3x(2)],[p3(2) v3x(2)],'color',[1 0 0],'linewidth',5);
      line([p3(1) v3y(1)], [p3(2) v3y(2)],[p3(2) v3y(2)],'color',[0 1 0],'linewidth',5);
      
    pause(0.1)
end
%--------------------------------------------------------------------------------------
% Rotacion y traslacion apartir de la primera rotación y traslación  

l2=4;
theta2_rad = deg2rad(theta2);

for theta2_rad=0:-0.09:theta2_rad
    
 
    %----------------Matriz de rotación en Z-----------------------
    TRz2= [cos(theta2_rad) -sin(theta2_rad) 0 0;sin(theta2_rad)  cos(theta2_rad) 0 0; 0 0 1 0; 0 0 0 1];

    %----------------Matriz de traslación en X---------------
    Ttx2=[1 0 0 l2; 0 1 0 0 ; 0 0 1 0 ; 0 0 0 1];

      T2 = TRz2*Ttx2;
      Tf=T1*T2;
      p3=Tf(1:3,4);

      v3x=p3+Tf(1:3,1);
      v3y=p3+Tf(1:3,2);

      line([p2(1) p3(1)], [p2(2) p3(2)], [p2(2) p3(2)],'color',[.8 .2 .4],'linewidth',5);

      line([p3(1) v3x(1)], [p3(2) v3x(2)],[p3(2) v3x(2)],'color',[1 0 0],'linewidth',5);
      line([p3(1) v3y(1)], [p3(2) v3y(2)],[p3(2) v3y(2)],'color',[0 1 0],'linewidth',5);
      pause(0.1)
end