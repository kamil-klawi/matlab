function [out] = genRand(rozmiar, A)
out = 2*A .* (rand(rozmiar) - 0.5);
end