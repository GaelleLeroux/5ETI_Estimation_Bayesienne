function [samples, accept_rate] = Metropolis_Hasting(T, a, b, sigma_q)

    teta = rand();
    samples = zeros(1, T);
    accepted = 0;

    for t = 1:T
        teta_cand = teta + sigma_q * randn();
        if teta_cand > 0 && teta_cand < 1
            f_cand = Beta(teta_cand, a, b);
            f = Beta(teta, a, b);
    
            q_cand = (1/(sqrt(2*pi)*sigma_q))*exp(-(teta_cand-teta)*(teta_cand-teta)/(2*sigma_q*sigma_q));
            q = (1/(sqrt(2*pi)*sigma_q))*exp(-(teta-teta_cand)*(teta-teta_cand)/(2*sigma_q*sigma_q));
            alpha = min(1,(f_cand / f)*(q/q_cand));

            if rand() < alpha
                teta = teta_cand;
                accepted = accepted + 1;
            end
        end
        samples(t) = teta;
    end

    accept_rate = accepted / T;
end