function [theta,alpha,auto_correlation] = Metropolis_Hastings(T,a,b,saut)
    %METROPOLIS_HASTINGS Summary of this function goes here
    %   Detailed explanation goes here
    theta = 0.5;
    
    taux_acceptation = 0;
    for i = 1:T
        theta_t = theta(i); 
        theta_cand = theta_t+saut*randn(1,1);
        alpha(i) = min(1,(Densite_prob_beta(theta_cand,a,b)*Loi_Normale(theta_t,saut,theta_cand))/(Densite_prob_beta(theta_t,a,b)*Loi_Normale(theta_cand,saut,theta_t)));
        r = unifrnd(0,1,1,1);
        if r<=alpha(i)
            taux_acceptation = taux_acceptation+1;
            theta(i+1)=theta_cand;
        elseif r>alpha(i)
            theta(i+1)=theta_t;
        end

    
    end
  auto_correlation = xcorr(theta);
  disp(['taux acceptation brut  : ',num2str(taux_acceptation)]);
  disp(['taux acceptation  : ',num2str(taux_acceptation/T)]);
  disp(['taux acceptation en %  : ',num2str(taux_acceptation*100/T)]);
end
