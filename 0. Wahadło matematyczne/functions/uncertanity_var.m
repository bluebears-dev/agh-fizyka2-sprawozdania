pkg load symbolic

data = load('../data/var_length_data.csv')
l = data(:, 1);
k = data(:, 2);
t_i = data(: , 3);
T_i = t_i./k;
T2_i = T_i.**2;

[a, a_uncert] = linear_regression(l, T2_i);
a = precision(a, 3)
a_uncert = precision(a_uncert, 3)

save ../data/plot.csv l T_i T2_i a;

# partial diff
syms a0;
g = 4*pi**2/a0;
dg_a = diff(g, a0);

dg_a = function_handle(dg_a);
g = function_handle(g);

# g, u_c(g), U(g)
g = precision(g(a), 2)
g_uncert = precision(abs(dg_a(a) * a_uncert), 3)
g_exp = 2*g_uncert

# g - g_0
g_diff = precision(g - 9.881, 2)
