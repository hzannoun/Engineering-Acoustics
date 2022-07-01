clc
clear all

A = 1 ; %incident signal

T1 = 20 ; %in ℃
TEMPK1 = T1 + 273.15 ; %convert to Kelvin
c1 = 20.0457.*sqrt(TEMPK1) ;
rho1 = 101325./(287.058.*TEMPK1) ;
L = c1./(4.*180) ; %designing for a target frequency of 180 Hz


for d1 = 2 ; %chosen diameter of main pipe in inches
    d2 = 4 ; %chosen diameter of expansion chamber in inches
    s1 = (pi*(.0254*d1).^2)./4 ; %cross-sectional area s1 in m^2
    s2 = (pi*(.0254*d2).^2)./4 ; %cross-sectional area s2 in m^2
    f_cutoff1 = (1.84.*c1)./(pi.*d2.*.0254) ;
    TL_vec = [] ;
    for f = 1:.1:2500
    k = (2.*pi.*f)./c1 ;
    B = [-1 1 1 0; 0 exp(-i.*k.*L) exp(i.*k.*L) -1; s1 s2 -s2 0; 0 s2.*exp(-i.*k.*L) -s2.*exp(i.*k.*L) -s1] ;
    C = [A; 0; s1.*A; 0] ;
    x = linsolve(B,C) ;
    E = x(4,:) ; %transmitted signal
    TL = 10.*log10(((abs(A).^2).*s1)./((abs(E).^2).*s1)) ;
    TL_vec = [TL_vec TL] ;
    end
f_axis = [1:.1:2500] ;
plot(f_axis, TL_vec) ;
end

hold on

for d1 = 3 ; %chosen diameter of main pipe in inches
    d2 = 9 ; %chosen diameter of expansion chamber in inches
    s1 = (pi*(.0254*d1).^2)./4 ; %cross-sectional area s1 in m^2
    s2 = (pi*(.0254*d2).^2)./4 ; %cross-sectional area s2 in m^2
    f_cutoff2 = (1.84.*c1)./(pi.*d2.*.0254) ;
    TL_vec = [] ;
    for f = 1:.1:2500
    k = (2.*pi.*f)./c1 ;
    B = [-1 1 1 0; 0 exp(-i.*k.*L) exp(i.*k.*L) -1; s1 s2 -s2 0; 0 s2.*exp(-i.*k.*L) -s2.*exp(i.*k.*L) -s1] ;
    C = [A; 0; s1.*A; 0] ;
    x = linsolve(B,C) ;
    E = x(4,:) ; %transmitted signal
    TL = 10.*log10(((abs(A).^2).*s1)./((abs(E).^2).*s1)) ;
    TL_vec = [TL_vec TL] ;
    end
f_axis = [1:.1:2500] ;
plot(f_axis, TL_vec) ;
end

hold on

for d1 = 4 ; %chosen diameter of main pipe in inches
    d2 = 16 ; %chosen diameter of expansion chamber in inches
    s1 = (pi*(.0254*d1).^2)./4 ; %cross-sectional area s1 in m^2
    s2 = (pi*(.0254*d2).^2)./4 ; %cross-sectional area s2 in m^2
    f_cutoff3 = (1.84.*c1)./(pi.*d2.*.0254) ;
    TL_vec = [] ;
    for f = 1:.1:2500
    k = (2.*pi.*f)./c1 ;
    B = [-1 1 1 0; 0 exp(-i.*k.*L) exp(i.*k.*L) -1; s1 s2 -s2 0; 0 s2.*exp(-i.*k.*L) -s2.*exp(i.*k.*L) -s1] ;
    C = [A; 0; s1.*A; 0] ;
    x = linsolve(B,C) ;
    E = x(4,:) ;
    TL = 10.*log10(((abs(A).^2).*s1)./((abs(E).^2).*s1)) ;
    TL_vec = [TL_vec TL] ;
    end
f_axis = [1:.1:2500] ;
plot(f_axis, TL_vec) ;
end

xline(180) ; %chosen target frequency of 180 Hz
xline(f_cutoff1) ;
xline(f_cutoff2) ;
xline(f_cutoff3) ;
legend('s2/s1 = 2','s2/s1 = 3','s2/s1 = 4','f target','f cutoff 1','f cutoff 2','f cutoff 3') ;
title('Simple Expansion Chamber');
xlabel('frequency [Hz]');
ylabel('Transmission Loss [dB]');