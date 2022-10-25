
function R = bilinear_resize(I, p, q)
    % =========================================================================
    % Upscaling de imagine folosind algoritmul de interpolare biliniara
    % Transforma imaginea I alb-negru din dimensiune m x n in dimensiune p x q
    % =========================================================================
    [m n nr_colors] = size(I);

    % initializeaza matricea finala
    R = zeros(p, q);

    % daca imaginea e alb negru, ignora
    if nr_colors > 1
        R = -1;
        return
    endif

    % Obs:
    % Atunci cand se aplica o scalare, punctul (0, 0) al imaginii nu se va
    % deplasa.
    % In Octave, pixelii imaginilor sunt indexati de la 1 la n.
    % Daca se lucreaza in indici de la 1 la n si se inmulteste x si y cu s_x
    % si s_y, atunci originea imaginii se va deplasa de la (1, 1) la (sx, sy)!
    % De aceea, trebuie lucrat cu indici in intervalul de la 0 la n - 1!


    % calculeaza factorii de scalare
    s_x= (q-1)./(n-1);
    s_y= (p-1)./(m-1);
    % Obs: daca se lucreaza cu indici in intervalul [0, n - 1], ultimul
    % pixel al imaginii se va deplasa de la (m - 1, n - 1) la (p, q).
    % s_x nu va fi q ./ n

    % defineste matricea de transformare pentru redimensionare
    T=zeros(2);
    T(1,1)= s_x;
    T(2,2)= s_y;

    % calculeaza inversa transformarii
    T=inv(T);
    
    % cast matricea initiala la double
    I=double(I);
    
    % parcurge fiecare pixel din imagine
    % foloseste coordonate de la 0 la n - 1
    for y = 0 : p - 1
        for x = 0 : q - 1
            % aplica transformarea inversa asupra (x, y) si calculeaza
            % x_p si y_p din spatiul imaginii initiale
            aux=T*[x;y];
            

            % trece (xp, yp) din sistemul de coordonate de la 0 la n - 1 in
            % sistemul de coordonate de la 1 la n pentru a aplica interpolarea
            x_p=aux(1)+1;
            y_p=aux(2)+1;

            % afla punctele ce inconjoara punctul (xp, yp)
            [x1 y1 x2 y2]=surrounding_points(n,m,x_p,y_p);

            % calculeaza coeficientii de interpolare a
            a=bilinear_coef(I,x1,y1,x2,y2);

            % calculeaza valoarea interpolata a pixelului (x, y)
            % Obs: pentru scrierea in imagine, x si y sunt in coordonate de
            % la 0 la n - 1 si trebuie aduse in coordonate de la 1 la n
             R(y+1,x+1)=a(1)+a(2)*x_p+a(3)*y_p + a(4)*x_p*y_p;
       
        endfor
    endfor

    % transforma matricea rezultat in uint8 pentru a fi o imagine valida
    R=uint8(R);
    
endfunction
