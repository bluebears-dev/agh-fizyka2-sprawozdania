function x = precision(X, prec)
  t = power(10, prec);
  x = floor(X.*t)/t;
endfunction