function [y] = Loi_Normale(moyenne,variance_carre,x)
    %LOI_NORMALE_CR Summary of this function goes here
    %   Detailed explanation goes here
    variance = sqrt(variance_carre);
    y = (1/(variance*sqrt(2*pi))*exp(-0.5*((x-moyenne)/variance)^2));
end