function r = fy(f, x, y)
    % =========================================================================
    % Aproximeaza derivata fata de y a lui f in punctul (x, y).
    % =========================================================================
    
    % calculeaza derivata
    r=(f(x+1,y) -f(x-1,y))/2;

endfunction