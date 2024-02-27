%I confirm that I did not use ChatGPT, codes from the web or from past years  assignments and that the work I submit is my own and my own only
clear variables;
xmax = 1;
ymax = 1;
r = 0.05;
g = 9.81;
m = 70;
cd = 0.25;
alpha = 0.8;
beta = 0.98;

tfinal = 5;
tn = 0;
dt = 0.02;

un1 = -10;
vn1 = 50;
xn1 = 0.75;
yn1 = 5*r;



un2 = 11;
vn2 = 20;
xn2 = 0.25;
yn2 = 5.5*r;

dtGlobal = dt;




xn2p1 = xn2;
yn2p1 = yn2;
un2p1 = un2;
vn2p1 = vn2;


drawDisk(xn1,yn1,r,'b');
hold on;
drawDisk(xn2,yn2,r,'r');
axis equal; axis([0 xmax 0 ymax]);
s = sprintf('Simulation of a dropping disk at time %2.2f', tn);
title(s);fixfig;


while tn < tfinal
    if tn + dt > tfinal
        dt = tfinal - tn;
    end

    
velocitymagnitude1 = sqrt( un1*un1 + vn1*vn1 );
un1p1Prediction = un1 + dt * ( - cd / m * velocitymagnitude1 * un1 );
vn1p1Prediction = vn1 + dt * ( - g + cd / m * velocitymagnitude1 * vn1);
xn1p1Prediction = xn1 + dt * un1;
yn1p1Prediction = yn1 + dt * vn1;

velocitymagnitude2 = sqrt( un2*un2 + vn2*vn2 );
un2p1Prediction = un2 + dt * ( - cd / m * velocitymagnitude2 * un2 );
vn2p1Prediction = vn2 + dt * ( - g + cd / m * velocitymagnitude2 * vn2);
xn2p1Prediction = xn2 + dt * un2;
yn2p1Prediction = yn2 + dt * vn2;
   
isCollision = false;

if (xn1p1Prediction > xmax - r)
    isCollision = true;
    dt = abs(xmax - xn1 -r)/abs(un1);
    xn1p1 = xn1 + dt * un1;
    yn1p1 = yn1 + dt * vn1;
    velocitymagnitude1 = sqrt(un1*un1 + vn1*vn1);
    un1p1 = un1 + dt * ( - cd / m * velocitymagnitude1 * un1 );
    vn1p1 = vn1 + dt * ( - g + cd / m * velocitymagnitude1 * vn1 );
    un1p1 = -alpha * un1p1;
    vn1p1 = beta * vn1p1;
end
if (xn2p1Prediction > xmax - r)
    isCollision = true;
    dt = abs(xmax - xn2 -r)/abs(un2);
    xn2p1 = xn2 + dt * un2;
    yn2p1 = yn2 + dt * vn2;
    velocitymagnitude2 = sqrt(un2*un2 + vn2*vn2);
    un2p1 = un2 + dt * ( - cd / m * velocitymagnitude2 * un2 );
    vn2p1 = vn2 + dt * ( - g + cd / m * velocitymagnitude2 * vn2 );
    un2p1 = -alpha * un2p1;
    vn2p1 = beta * vn2p1;
end

if(yn1p1Prediction<=r)
    isCollision = true;
    dt = abs(yn1-r)/abs(vn1);
    xn1p1 = xn1 + dt*un1;
    yn1p1 = yn1+ dt*vn1;
    velocitymagnitude1 = sqrt(un1*un1 + vn1*vn1);
    un1p1 = un1 + dt * (-cd/m*velocitymagnitude1*un1);
    vn1p1 = vn1 + dt * (-g+cd/m*velocitymagnitude1*vn1);
    un1p1 = beta *  un1p1;
    vn1p1 = -alpha * vn1p1;
end

if(yn2p1Prediction<=r)
    isCollision = true;
    dt = abs(yn2-r)/abs(vn2);
    xn2p1 = xn2 + dt*un2;
    yn2p1 = yn2 + dt*vn2;
    velocitymagnitude2 = sqrt(un2*un2 + vn2*vn2);
    un2p1 = un2 + dt * (-cd/m*velocitymagnitude2*un2);
    vn2p1 = vn2 + dt * (-g+cd/m*velocitymagnitude2*vn2);
    un2p1 = beta * un2p1;
    vn2p1 = -alpha * vn2p1;
end

if(yn1p1Prediction>ymax-r)
    isCollision = true;
    dt = abs(ymax-yn1-r)/abs(vn1);
    xn1p1 = xn1 + dt*un1;
    yn1p1 = yn1 + dt*vn1;
    velocitymagnitude1 = sqrt(un1*un1 + vn1*vn1);
    un1p1 = un1 + dt * (-cd/m*velocitymagnitude1*un1);
    vn1p1 = vn1 + dt * (-g+cd/m*velocitymagnitude1*vn1);
    un1p1 = beta * un1p1;
    vn1p1 = -alpha * vn1p1;
end

if(yn2p1Prediction>ymax-r)
    isCollision = true;
    dt = abs(ymax-yn2-r)/abs(vn2);
    xn2p1 = xn2 + dt*un2;
    yn2p1 = yn2 + dt*vn2;
    velocitymagnitude2 = sqrt(un2*un2 + vn2*vn2);
    un2p1 = un2 + dt * (-cd/m*velocitymagnitude2*un2);
    vn2p1 = vn2 + dt * (-g+cd/m*velocitymagnitude2*vn2);
    un2p1 = beta * un2p1;
    vn2p1 = -alpha * vn2p1;
end

if(xn1p1Prediction<=r)
    isCollision = true;
    dt = abs(xn1-r)/abs(un1);
    xn1p1 = xn1 + dt*un1;
    yn1p1 = yn1 + dt*vn1;
    velocitymagnitude1 = sqrt(un1*un1 + vn1*vn1);
    un1p1 = un1 + dt * (-cd/m*velocitymagnitude1*un1);
    vn1p1 = vn1 + dt * (-g+cd/m*velocitymagnitude1*vn1);
    un1p1 = -alpha * un1p1;
    vn1p1 = beta * vn1p1;
end

if(xn2p1Prediction<=r)
    isCollision = true;
    dt = abs(xn2-r)/abs(un2);
    xn2p1 = xn2 + dt*un2;
    yn2p1 = yn2 + dt*vn2;
    velocitymagnitude2 = sqrt(un2*un2 + vn2*vn2);
    un2p1 = un2 + dt * (-cd/m*velocitymagnitude2*un2);
    vn2p1 = vn2 + dt * (-g+cd/m*velocitymagnitude2*vn2);
    un2p1 = -alpha * un2p1;
    vn2p1 = beta * vn2p1;
end

if(~isCollision)
    un1p1 = un1p1Prediction;
    vn1p1 = vn1p1Prediction;
    xn1p1 = xn1p1Prediction;
    yn1p1 = yn1p1Prediction;
    un2p1 = un2p1Prediction;
    vn2p1 = vn2p1Prediction;
    xn2p1 = xn2p1Prediction;
    yn2p1 = yn2p1Prediction;

end

if (sqrt((xn1p1Prediction-xn2p1Prediction)^2+(yn1p1Prediction-yn2p1Prediction)^2)<=2*r)

isCollision = true;

dt = abs(sqrt((xn1-xn2)^2+(yn1-yn2)^2)-2*r)/abs(sqrt((un1-un2)^2+(vn1-vn2)^2));

xn1p1 = xn1 + dt*un1;
yn1p1 = yn1 + dt*vn1;
xn2p1 = xn2 + dt*un2;
yn2p1 = yn2 + dt*vn2;

V1 = [un1,vn1];
V2 = [un2,vn2];

n = [xn1-xn2;yn1-yn2]/sqrt((xn1-xn2)^2+(yn1-yn2)^2);
A = [yn1-yn2;xn2-xn1]/sqrt((xn1-xn2)^2+(yn1-yn2)^2);

V1out = [dot(V2,n) , dot(V1,A)];
V2out = [dot(V1,n) , dot(V2,A)];

V1 = [dot(V1out,[1;0]) , dot(V1out,[0;1])];
V2 = [dot(V2out,[1;0]) , dot(V2out,[0;1])];

un1 = V1(1,1);
vn1 = V1(1,2);
un2 = V2(1,1);
vn2 = V2(1,2);

velocitymagnitude1 = sqrt(un1*un1+vn1*vn1);
un1p1 = un1 + dt * ( - cd / m * velocitymagnitude1 * un1 );
vn1p1 = vn1 + dt * ( - g + cd / m * velocitymagnitude1 * vn1 );

velocitymagnitude2 = sqrt(un2*un2 + vn2*vn2);
un2p1 = un2 + dt * (-cd/m*velocitymagnitude2*un2);
vn2p1 = vn2 + dt * (-g+cd/m*velocitymagnitude2*vn2);

end



tnp1 = tn + dt;


dt = dtGlobal;


clf;
hold on;
drawDisk(xn1p1,yn1p1,r,'b');
drawDisk(xn2p1,yn2p1,r,'r');
s = sprintf('Simulation of a dropping disk at time %2.2f', tnp1);
title(s);
axis equal; axis([0 xmax 0 ymax]); fixfig; pause(dt);pause(dt);
hold off;

un1 = un1p1;
vn1 = vn1p1;
xn1 = xn1p1;
yn1 = yn1p1;
tn = tnp1;
un2 = un2p1;
vn2 = vn2p1;
xn2 = xn2p1;
yn2 = yn2p1;



end
xlabel('x-coordinate');
ylabel('y-coordinate');
title('Simulation of a dropping disk at time %2.2f');
fixfig;


