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

function [h] = determinar_h_simpson(f, a, b, erro)
    n = 1
    r0 = integral_simpson(f, a, b, n)
    
    while n <= 1000
      r1 = integral_simpson(f, a, b, n + 1)  
      
      if abs(r1 - r0) <= erro then
          h = (b - a) / n
          return
      end
      
      r0 = r1
      n = n + 1
    end
    
    error('Limite de iterações alcançado')
endfunction
