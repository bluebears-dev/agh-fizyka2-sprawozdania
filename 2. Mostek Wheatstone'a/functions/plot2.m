data = load('../data/plot.csv');
x = data.l * 100;
y = data.T2_i;
x_linear = [5 45];

a = data.a / 100;
y_linear = x_linear.*a;

hold on;
box on;
axis([5 45 0.2 1.8]);
plot(x, y, '.', 'marker', '+', 'markersize', 5);
plot(x_linear, y_linear, "r");
xlabel('l [cm]');
ylabel('T^2 [s^2]');
hold off;
print -dpng ../img/plot2.png;