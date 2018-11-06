function [R]=runge_kutta2(f, a, b, h, y_inicial)
    yn = y_inicial
    xn = a
    cont = 1

    for i = a:h:b
        k1 = f(xn, yn)
        k2 = f(xn + h, yn + h*k1)
        
        R(cont) = yn
        cont = cont + 1

        yn = yn + (h/2)*(k1 + k2)
        xn = xn + h
    end
endfunction

function [R]=runge_kutta4(f, a, b, h, y_inicial)
    yn = y_inicial
    xn = a
    cont = 1

    for i = a:h:b
        k1 = f(xn, yn)
        k2 = f(xn + (h/2), yn + h*k1/2)
        k3 = f(xn + (h/2), yn + h*k2/2)
        k4 = f(xn + h, yn + h*k3)

        R(cont) = yn
        cont = cont + 1

        yn = yn + (h/6)*(k1 + k2*2 + k3*2 + k4)
        xn = xn + h
    end
endfunction
