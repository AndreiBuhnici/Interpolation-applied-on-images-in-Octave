function [Ix, Iy, Ixy] = precalc_d(I)
    % =========================================================================
    % Prealculeaza matricile Ix, Iy si Ixy ce contin derivatele dx, dy, dxy ale 
    % imaginii I pentru fiecare pixel al acesteia
    % =========================================================================
    
    % obtine dimensiunea imaginii
    [m n nr_colors] = size(I);
    
    % cast matricii I la double
    I=double(I);
    Ix=zeros(m,n);
    Iy=zeros(m,n);
    Ixy=zeros(m,n);
    
    for i=2:n-1
        for j=1:m
    % calculeaza matricea cu derivate fata de x Ix
     Ix(j,i)=fx(I,j,i);
      endfor
    endfor

     for i=1:n
      for j=2:m-1
    % calculeaza matricea cu derivate fata de y Iy
    Iy(j,i)=fy(I,j,i);
     endfor
    endfor

    for i=2:n-1
      for j=2:m-1
    % calculeaza matricea cu derivate fata de xy Ixy
    Ixy(j,i)=fxy(I,j,i);
    endfor
    endfor


endfunction
