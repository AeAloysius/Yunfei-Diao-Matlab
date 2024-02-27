clear variables;

xmin = -pi/2;
xmax = pi/2;

ymin = -pi/2;
ymax = pi/2;

mx = 100;
my = 100;

x = linspace(xmin,xmax,mx); dx = x(2)-x(1);
y = linspace(ymin,ymax,my); dy = y(2)-y(1);

t = 0;
tfinal = pi;

un = zeros(mx,my);
for i = 1:mx
    for j = 1:my
        if sqrt( ( x(i) - 1 )^2 + ( y(j) - 0 )^2 ) - 0.25 <=0
            un(i,j) = 1;
        end
    end
end

figure(1);mesh(x,y,un');axis([-2 2 -2 2 0 1])
xlabel('x');ylabel('y');fixfig;

dt = 0.2*dx;

unp1 = zeros(mx,my);
c1 = zeros(mx,my);
c2 = zeros(mx,my);

while t < tfinal
    if t + dt > tfinal
        dt = tfinal - t;
    end
for i = 1:mx
    for j = 1:my
        c1(i,j) = -cos(x(i))*sin(y(j))*cos(t);
        c2(i,j) =  sin(x(i))*cos(y(j))*cos(t);
    end
end


% c1 > 0 and c2 <= 0
if c1(i,j) > 0 && c2(i,j) <= 0
for i = 2:mx
    for j = 1:my-1
        dudx = (un(i,j)-un(i-1,j))/dx;
        dudy = (un(i,j+1)-un(i,j))/dy;
        unp1(i,j) = un(i,j)-(c1(i,j)*dudx+c2(i,j)*dudy)*dt;%%%%
    end
end
for j = 1:my
    unp1(1,j) = unp1(mx,j);
end
for i = 1:mx
    unp1(i,my) = unp1(i,1);
end
end
% c1 > 0 and c2 > 0
if c1(i,j) > 0 && c2(i,j) > 0
for i = 2:mx
    for j = 2:my
        dudx = (un(i,j)-un(i-1,j))/dx;
        dudy = (un(i,j)-un(i,j-1))/dy;
        unp1(i,j) = un(i,j)-(c1(i,j)*dudx+c2(i,j)*dudy)*dt;
    end
end
    for i = 1:mx
        unp1(i,1) = unp1(i,my);
    end
    for j = 1:my
        unp1(1,j) = unp1(mx,j);
    end
end
% c1 < 0 and c2 > 0
if c1(i,j) < 0 && c2(i,j) > 0
for i = 1:mx-1
    for j = 2:my
        dudx = (un(i+1,j)-un(i,j))/dx;
        dudy = (un(i,j)-un(i,j-1))/dy;
        unp1(i,j) = un(i,j)-(c1(i,j)*dudx+c2(i,j)*dudy)*dt;
    end
end
    for i = 1:mx
        unp1(i,my) = unp1(i,1);
    end
    for j = 1:my
        unp1(1,j) = unp1(mx,j);
    end
end
% c1 < 0 and c2 <= 0
if c1(i,j) < 0 && c2(i,j) <= 0
for i = 1:mx-1
    for j = 1:my-1
        dudx = (un(i+1,j)-un(i,j))/dx;
        dudy = (un(i,j+1)-un(i,j))/dy;
       unp1(i,j) = un(i,j)-(c1(i,j)*dudx+c2(i,j)*dudy)*dt;
    end
end
    for i = 1:mx
        unp1(i,my) = unp1(i,1);
    end
    for j = 1:my
        unp1(mx,j) = unp1(1,j);
    end
end


figure(1);mesh(x,y,unp1');xlabel('x');ylabel('y');fixfig(1,0);axis([-2 2 -2 2 0 1]);
pause(dt);

figure(2);quiver(x,y,c1,c2,'b'); fixfig(2,0);pause(dt);
t = t + dt;
un = unp1;
end
