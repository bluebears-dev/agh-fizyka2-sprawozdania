plex1 = load('../data/plex1.csv');
plex2 = load('../data/plex2.csv');
glass = load('../data/glass.csv');

function x = uncert(data)
  x = std(data) / sqrt(size(data)(1, 1));
endfunction

function x = n_uncert(ud, uh, d, h, n)
  x = n * sqrt((ud / d)**2 + (uh / h)**2);
endfunction
measure_uncer = 0.01# [mm];
plex1_thicc = 3.8;
plex2_thicc = 4.93;
glass_thicc = 2.18;

plex1_refr_thicc = abs(plex1(1:end,1) - plex1(1:end, 2));
plex2_refr_thicc = abs(plex2(1:end,1) - plex2(1:end, 2))
# Pomijamy błąd gruby
glass_refr_thicc = abs(glass(2:end,1) - glass(2:end, 2));

mean(plex1_refr_thicc)
mean(plex2_refr_thicc)
mean(glass_refr_thicc)

plex1_n = plex1_thicc / mean(plex1_refr_thicc)
plex2_n = plex2_thicc / mean(plex2_refr_thicc)
glass_n = glass_thicc / mean(glass_refr_thicc)

plex1_uncert = uncert(plex1_refr_thicc)
plex2_uncert = uncert(plex2_refr_thicc)
glass_uncert = uncert(glass_refr_thicc)

plex1_n_uncert = n_uncert(measure_uncer, plex1_uncert, plex1_thicc, mean(plex1_refr_thicc), plex1_n)
plex2_n_uncert = n_uncert(measure_uncer, plex2_uncert, plex2_thicc, mean(plex2_refr_thicc), plex2_n)
glass_n_uncert = n_uncert(measure_uncer, glass_uncert, glass_thicc, mean(glass_refr_thicc), glass_n)

2 * [plex1_n_uncert plex2_n_uncert glass_n_uncert]