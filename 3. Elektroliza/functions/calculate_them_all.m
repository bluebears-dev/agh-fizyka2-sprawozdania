t = 1800; #s
t_uncert = 1;

I = 500; #mA
m_cat = 113.905; #g
m_cat_after = 114.223;
dm_cat = m_cat_after - m_cat
m_an = 61.450 + 76.876;
m_an_after = 61.285 + 76.736;
dm_an = m_an - m_an_after
I_uncer = (0.5 / 100 * 60) / sqrt(3) #mA

m_copper = mean([dm_an, dm_cat])
m_copper_uncert = std([dm_an, dm_cat]) / sqrt(2)
m_copper_uncert = 0.01

m_mol = 63.58;
w = 2;

k = m_copper / (I * 1e-3 * t)
k_relative = sqrt((m_copper_uncert/m_copper)**2 + (I_uncer/I)**2 + (t_uncert/t)**2)
k_uncert = k * k_relative

F = m_mol / (w * k)
F_uncert = F * k_relative
F - 96500
F_uncert * 2

e = F / (6.0245 * 1e23) * 1e19
e_uncert = e * k_relative