function [integral] = integral_trapezios(f, a, b, n)
    h = (b - a) / n
    miolo = sum(f((a+h):h:(b-h)) * 2)
    miolo = miolo + f(a) + f(b)
    integral = (h/2) * miolo
endfunction

function [integral] = integral_simpson(f, a, b, n)
    h = (b - a) / n
    miolo_impares = sum(f((a+h):(h*2):(b-h)) * 4)
    miolo_pares = sum(f((a+h*2):(h*2):(b-h)) * 2)
    miolo = miolo_pares + miolo_impares + f(a) + f(b)
    integral = (h/3) * miolo
endfunction

function [integral] = integral_simpson_fixo(y, h)
    miolo = y(2:(length(y)-1))
    pares = miolo(1:2:(length(miolo))) .* 4
    impares = miolo(2:2:(length(miolo))) .* 2
    integral = (h/3) * (sum(pares) + sum(impares) + y(1) + y($))
endfunction
