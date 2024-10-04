function [y] = Densite_prob_beta(x,a,b)
    %DENSITE_PROB_BETA Summary of this function goes here
    %   Detailed explanation goes here

    if x>0 && x<1
        y = (1/beta(a,b))*(x.^(a-1))*((1-x).^(b-1));
    else 
        y = 0;
    end
end