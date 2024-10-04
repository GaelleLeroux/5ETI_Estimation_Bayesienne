function [p_x] = Beta(x,a,b)

    if size(x) == 1
        p_x = (gamma(a+b)/(gamma(a)*(gamma(b))))*(x^(a-1))*((1-x)^(b-1));
    else
        p_x = (gamma(a+b)/(gamma(a)*(gamma(b)))).*(x.^(a-1)).*((1-x).^(b-1));
    end

end