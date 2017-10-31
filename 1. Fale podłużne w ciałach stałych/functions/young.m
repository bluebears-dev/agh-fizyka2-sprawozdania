material = 'copper'
data = load(sprintf('../data/%s.csv', material));
load('../data/density.csv')

f = data(:, 1);
lambda = data(:, 2);
lambda_uncert = 0.001;

harm = linspace(1, length(f), length(f));
f_0 = f./ (harm.+1)';

v_k = f.*lambda;

lambda_0 = lambda(1,1)*2
f_0 = mean(f_0)
f_0_uncert = 20;

v = f_0 * lambda_0
v_uncert = sqrt((f_0 * lambda_uncert)**2 + (lambda_0 * f_0_uncert)**2)

dens = eval(sprintf('d_%s', material))
dens_uncert = round(eval(sprintf('d_%s_uncert', material)))

E = v**2 * dens / 10**9 #[GPa]
E_uncert = sqrt((2 * v * dens * v_uncert)**2 + (v**2 * dens_uncert)**2) / 10**9 #[GPa]