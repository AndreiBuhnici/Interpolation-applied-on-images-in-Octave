function out = bilinear_2x2(f, STEP = 0.1)
    % =========================================================================
    % Aplica interpolare biliniara pe imaginea 2x2 f cu puncte intermediare
    % echidistante.
    % f are valori cunoscute in punctele (1, 1), (1, 2), (2, 1) si (2, 2).
    % 
    % Parametrii:
    % - f = imaginea ce se doreste sa fie interpolata
    % - STEP = distanta dintre doua puncte succesive
    % =========================================================================


    % defineste coordonatele x si y ale punctelor intermediare
    x_int = 1 : STEP : 2;
    y_int = 1 : STEP : 2;
  
    % afla nr. de puncte
    n = length(x_int);

    % cele 4 punctele incadratoare vor fi aceleasi pentru toate punctele din
    % interior
    x1 = y1 = 1;
    x2 = y2 = 2;
    f=double(f);
    
    % calculeaza coeficientii de interpolare biliniara folosind bilinear_coef
    a=bilinear_coef(f,x1,y1,x2,y2);

    % initializeaza rezultatul cu o matrice n x n plina de zero
    out=zeros(n);
    
    % parcurge fiecare pixel din imaginea finala
    for i = 1 : n
        for j = 1 : n
            % calculeaza valoarea pixelului
            out(i,j)=a(1)+a(2)*x_int(j)+a(3)*y_int(i) + a(4)*x_int(j)*y_int(i);
        endfor
    endfor

    % converteste rezultatul la uint8 pentru a ramane o imagine
    out=uint8(out);

endfunction
