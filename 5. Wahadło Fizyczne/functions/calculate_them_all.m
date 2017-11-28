bar = load("../data/bar.csv");
ring = load("../data/ring.csv");

ring(:, 1) / 20
bar_m = 663; # g + 1g
bar_uncert_m = 1;
bar_l = 749 / 1000; # m + 1mm
bar_uncert_l = 1/1000;
bar_d = 11.80 / 100; # m + 0.05mm
bar_uncert_d = 5/100000;
bar_axis = round(94 + 5.65 / 2) / 1000 # m + 1mm
bar_uncert_axis = 1/1000;
g_krk = 9.8105;
bar_T = mean(bar(1:end-1,1) / 20)
bar_uncert_T = std(bar(1:end-1,1) / 20) / sqrt(length(bar(1:end-1,1)))

bar_a = (bar_l / 2 - bar_axis)
bar_I0 = bar_m * bar_a * g_krk * (bar_T / (2*pi))**2 - bar_m * bar_a**2
%bar_I1 = (bar_m * (3*(bar_d / 2)**2 + bar_l**2)) / 12
bar_I1 = bar_m * bar_l**2 / 12

bar_uncert_I0 = sqrt(
          ((g_krk * bar_a * bar_T**2 / (2*pi)**2 - bar_a**2) * bar_uncert_m)**2 + 
          (bar_m * (g_krk * bar_T**2 / (2*pi)**2 - 2*bar_a) * bar_uncert_axis)**2 +
          (bar_m * g_krk * bar_a * bar_T / (2*pi**2) * bar_uncert_T)**2)
%bar_uncert_I1 = sqrt((
%          (3*(bar_d / 2)**2 + bar_l**2)/12*bar_uncert_m)**2 +
%          (bar_m*(bar_d / 2) / 2 * bar_uncert_d / 2)**2 + 
%          (bar_m * bar_l / 6 * bar_uncert_l)**2)
bar_uncert_I1 = bar_I1 * sqrt((bar_uncert_m / bar_m)**2 + (2 * bar_uncert_l / bar_l)**2)

dbar_I = bar_I1 - bar_I0
dbar_uncert_I = 2*sqrt(bar_uncert_I0**2 + bar_uncert_I1**2)          

ring_m = 1343; #g
ring_uncert_m = 1;
ring_din = 250 / 1000; #m
ring_uncert_din = 1/1000;
ring_dout = 279 / 1000; #m
ring_uncert_dout = 1/1000;
ring_thiccboi = 15 / 1000; #m + 0.05mm 
ring_uncert_thiccboi = 5/100000;
ring_axis = 14.9 / 1000; #m + 0.05mm
ring_uncert_axis = 5/100000;
ring_T = mean(ring(1:end-1, 1) / 20)
ring_uncert_T = std(ring(1:end-1, 1) / 20) / sqrt(length(ring(1:end-1, 1)))

ring_a = (ring_din / 2 + ring_axis / 2)
ring_I0 = ring_m * ring_a  * g_krk * (ring_T / (2*pi))**2 - ring_m * ring_a **2
ring_I1 = (ring_m * (ring_dout**2 + ring_din**2)) / 8 

ring_uncert_I0 = sqrt(
          ((g_krk * ring_a * ring_T**2 / (2*pi)**2 - ring_a**2) * ring_uncert_m)**2 + 
          (ring_m * (g_krk * ring_T**2 / (2*pi)**2 - 2*ring_a) * ring_uncert_axis)**2 +
          (ring_m * g_krk * ring_a * ring_T / (2*pi**2) * ring_uncert_T)**2)
          
ring_uncert_I1 = sqrt(
          ((ring_dout**2 + ring_din**2) * ring_uncert_m / 8)**2 + 
          (ring_m * ring_din / 4 * ring_uncert_din)**2 + 
          (ring_m * ring_dout / 4 * ring_uncert_dout)**2)        
          
dring_I = ring_I1 - ring_I0
dring_uncert_I = 2*sqrt(ring_uncert_I0**2 + ring_uncert_I1**2)             

%hold on;
%y = bar(1:end-1,1)
%plot(y, zeros(length(y)), 'marker', '*');
%plot(mean(y), 0, 'marker', '+')
%ylim([-0.1, 0.1]);