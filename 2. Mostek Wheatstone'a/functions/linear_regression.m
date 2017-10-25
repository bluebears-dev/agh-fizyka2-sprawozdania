function [a, a_uncert] = linear_regression(x, y)
  a = sum(x.*y)/sum(x.**2);
  S2 = sum((y - x.*a).**2);
  a_uncert = sqrt(S2/((length(x) - 1)*sum(x.**2)));
endfunction