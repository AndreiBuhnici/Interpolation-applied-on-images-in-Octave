function out = bicubic_resize_RGB(img, p, q)
    % =========================================================================
    % Redimensioneaza imaginea img a.i. aceasta sa fie de dimensiune p x q.
    % Imaginea img este colorata.
    % Practic, apeleaza de 3 ori functia nn pe fiecare canal al imaginii.
    % =========================================================================

    % extrage canalul rosu al imaginii
    r=img(:,:,1);

    % extrage canalul verde al imaginii
    g=img(:,:,2);

    % extrace canalul albastru al imaginii
    b=img(:,:,3);


    % aplica functia nn pe cele 3 canale ale imaginii
    out_r=bicubic_resize(r,p,q);
    out_g=bicubic_resize(g,p,q);
    out_b=bicubic_resize(b,p,q); 

    % formeaza imaginea finala cu cele 3 canale de culori
    out=cat(3,out_r,out_g,out_b);

endfunction