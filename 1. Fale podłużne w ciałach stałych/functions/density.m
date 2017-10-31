# Steel: len[cm], m[g]
a = 1.42;
b = 1.4;
c = 1.98;
m = 30.862;
l_uncert = 0.005;
m_uncert = 0.001;

V = a * b * c
V_uncert = l_uncert * sqrt((a*b)**2 + (a*c)**2 + (c*b)**2)

d_steel = round(m * 1000 / V) # kg/m^3
d_steel_uncert = sqrt((m_uncert / V)**2 + (m * V_uncert / V**2)**2) * 1000

# Aluminium: len[cm], m[g]
l = 44;
d = 0.5;
m = 23.883;
l_uncert = 0.1;
d_uncert = 0.005;
m_uncert = 0.001;

V = l * pi * d**2 / 4
V_uncert = pi / 2 * d * sqrt((l * d_uncert)**2 + (d / 2 * l_uncert)**2)

d_aluminium = round(m * 1000 / V) # kg/m^3
d_aluminium_uncert = sqrt((m_uncert / V)**2 + (m * V_uncert / V**2)**2) * 1000

# Brass: len[cm], m[g]
l = 31.2;
d = 0.59;
m = 74.536;
l_uncert = 0.1;
d_uncert = 0.005;
m_uncert = 0.001;

V = l * pi * d**2 / 4
V_uncert = pi / 2 * d * sqrt((l * d_uncert)**2 + (d / 2 * l_uncert)**2)

d_brass = round(m * 1000 / (l * pi * d**2 / 4)) # kg/m^3
d_brass_uncert = sqrt((m_uncert / V)**2 + (m * V_uncert / V**2)**2) * 1000

# Copper: len[cm], m[g]
l = 180.2;
d_out = 1.815;
d_in = 1.55;
m = 760;
l_uncert = 0.1;
l_uncert = 0.005;
m_uncert = 1;

V = l * pi * (d_out**2 - d_in**2) / 4
V_uncert = sqrt(((pi / 2 * d_out * l - 1) * d_uncert)**2 
                  + ((- pi / 2 * d_in * l + 1) * d_uncert)**2 
                  + (pi / 4 * (d_out**2 - d_in**2) * l_uncert)**2)

d_copper = round(m * 1000 / V) # kg/m^3
d_copper_uncert = sqrt((m_uncert / V)**2 + (m * V_uncert / V**2)**2) * 1000

save ../data/density.csv d_steel d_aluminium d_brass d_copper;
