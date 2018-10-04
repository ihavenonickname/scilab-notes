function [M] = apply_answer(x, answer)
    M = []
    n1 = length(x)
    n2 = length(answer)
    
    for i=1:n1
        acc = 0
        
        for j=1:n2
            acc = acc + (x(i) ^ (j - 1)) .* answer(j)
        end
        
        M(1,i) = acc
    end
endfunction

function [answer] = least_squares_1(x, y)
    n = length(x)
    sum_x = sum(x)
    sum_y = sum(y)
    sum_xy = sum(x .* y)
    sum_x_square = sum(x ^ 2)
    
    A = [ n     sum_x        ;
          sum_x sum_x_square ]

    B = [ sum_y  ;
          sum_xy ]
    
    answer = A^(-1) * B
endfunction

function [answer] = least_squares_n(order, x, y)
    A = []
    n = length(x)
    
    // FIXME: do not calculate the same value more than one time
    for i=0:order
        for j=0:order
            A(i+1, j+1) = sum(x ^ (i+j))
        end
    end
    
    A(1, 1) = n
    
    B = []
    
    for i=0:order
        B(i+1,:) = sum(y .* (x^i))    
    end
    
    answer = (A^(-1) * B)'
    
    M = apply_answer(x, answer)
    
    plot(x, y, '*r')
    plot(x, M)
endfunction
