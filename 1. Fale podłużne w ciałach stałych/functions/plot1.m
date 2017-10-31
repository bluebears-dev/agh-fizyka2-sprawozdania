data = load('../data/plot.csv');
x = data.l * 100;
y = data.T_i;
x_range = 5:0.5:45;
p = polyfit(x, y, 3);
y_range = polyval(p, x_range);

hold on;
box on;
axis([5 45 0.3 1.5]);
errorbar(x, y, 0.1, 0.1, 0.0034, 0.0034, '#~>.b');
plot(x_range, y_range, "r");
xlabel('l [cm]');
ylabel('T [s]');
hold off;
print -dpng ../img/plot3.png;