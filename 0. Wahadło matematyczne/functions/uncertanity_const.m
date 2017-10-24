pkg load symbolic

data = load('../data/const_length_data.csv')
k = data(:, 1);
t_i = data(:, 2);
T_i = t_i./ k;
T = precision(mean(T_i), 3)
T_uncert = precision(std(T_i)/sqrt(length(T_i)), 4)

l = 0.341
l_uncert = 0.001

# partial diff
syms l0 T0;
g = 4*pi**2*l0/T0**2;
dg_l = (diff(g, l0)*l_uncert)**2;
dg_T = (diff(g, T0)*T_uncert)**2;
g_uncert = sqrt(dg_l + dg_T);

g_uncert = function_handle(g_uncert);
g = function_handle(g);

# g, u_c(g), U(g)
g = precision(g(T, l), 2)
g_uncert = precision(g_uncert(T, l), 3)
g_exp = 2*g_uncert

# g - g_0
g_diff = precision(g - 9.881, 2)
