function [x] = Jacobi(M, b, erro)
    [n m] = size(M)
    
    if n <> m then
        error('A matriz deve ser quadrada')
    end

    x = zeros(n, 1)
    menor_diferenca = erro + 1
    contador = 0

    while contador < 1000 | menor_diferenca > erro
        for i=1:n
            s = 0
            
            for j=1:n
                if i <> j then
                    s = s + M(i,j) * x(j)
                end
            end
            
            y(i) = (1 / M(i,i)) * (b(i)-s)
        end
        
        menor_diferenca = abs(x(1) - y(1))
        
        for i=2:n
            menor_diferenca = abs(x(i) - y(i))
            
            if menor_diferenca < new_abs then
                menor_diferenca = new_abs
            end
        end
        
        x = y

        contador = contador + 1       
    end
endfunction
