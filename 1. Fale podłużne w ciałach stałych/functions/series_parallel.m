rx1 = 12.308;
rx2 = 34.896;
rx3 = 69.68;

rx1_uncert = 0.030;
rx2_uncert = 0.065;
rx3_uncert =  0.22;

series = rx1 + rx2
series_uncert = sqrt(rx1_uncert**2 + rx2_uncert**2)

function d = R_partial_diff(x, y) # df/dx
  d = y**2 / (x + y)**2;
endfunction 

parallel = (rx1*rx2)/(rx1 + rx2)
parallel_uncert = sqrt((R_partial_diff(rx1, rx2)*rx1_uncert)**2 + (R_partial_diff(rx2, rx1)*rx2_uncert)**2)

mixed = (rx1*rx2)/(rx1 + rx2) + rx3
mixed_uncert = sqrt((R_partial_diff(rx1, rx2)*rx1_uncert)**2 + (R_partial_diff(rx2, rx1)*rx2_uncert)**2 + rx3_uncert**2)

r_series = 47.11
r_series_uncert = 0.25
r_parallel = 9.371
r_parallel_uncert = 0.025
r_mixed = 79.939
r_mixed_uncert = 0.050

printf('\n')
dseries = abs(r_series - series) 
Useries = 2*sqrt(series_uncert**2 + r_series_uncert**2)

dparallel = abs(r_parallel - parallel) 
Uparallel = 2*sqrt(parallel_uncert**2 + r_parallel_uncert**2)

dmixed = abs(r_mixed - mixed) 
Umixed = 2*sqrt(mixed_uncert**2 + r_mixed_uncert**2)
