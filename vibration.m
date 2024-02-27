%"I confirm that I did not use codes from anyone else and that the work I submit is my own and my own only
m1 = 40; m2 = 20; k1 = 200; k2 = 100; k3 = 250;

A = [(k1+k2)/m1 -k2/m1;-k2/m2 k3+k2/m2];
[V,D] = eig(A);
t = linspace(0,10,1000);
ev = diag(D);
EV = V;
disp(ev);
disp(EV);
amplitude1 = EV(:, 1);
frequency1 = sqrt(ev(1));
amplitude2 = EV(:, 2);
frequency2 = sqrt(ev(2));


figure;
displacement1 = amplitude1(1) * sin(frequency1 * t);
displacement2 = amplitude1(2) * sin(frequency2 * t);
displacement3 = amplitude2(1) * sin(frequency1 * t);
displacement4 = amplitude2(2) * sin(frequency2 * t);

subplot(2,1,1);
plot(t,displacement1,'b',t,displacement2,'r')
xlabel('Time');ylabel('Displacement');fixfig;

subplot(2,1,2);
plot(t,displacement3,'b',t,displacement4,'r')
xlabel('Time');ylabel('Displacement');fixfig;

figure;
    alpha = 0.5; beta = 0.5;
    displacementA = alpha * amplitude1(1) * sin(frequency1 * t) + beta * amplitude1(2) * sin(frequency2 * t);
    displacementB = alpha * amplitude2(1) * sin(frequency1 * t) + beta * amplitude2(2) * sin(frequency2 * t);
    subplot(2,1,1);
    plot(t, displacementA,'b');
    xlabel('Time');
    ylabel('Displacement');
    fixfig;

    subplot(2,1,2);
    plot(t, displacementB,'r');
    xlabel('Time');
    ylabel('Displacement');
    fixfig;


    
