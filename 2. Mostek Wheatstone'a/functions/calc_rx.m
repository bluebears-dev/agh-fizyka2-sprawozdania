pkg load symbolic

function R_x = calc_resistance(R, a) #R [ohm], a [mm]
  R_x = (R.* a)./ (1000 - a);
endfunction  

data = load(sprintf('../data/rx%s.csv', '_mixed'));
R = data(:, 1);
a = data(:, 2);

R_x = calc_resistance(R, a)
precision(mean(R_x), 3)
R_x_uncert = precision(std(R_x)/sqrt(length(R_x)), 3)