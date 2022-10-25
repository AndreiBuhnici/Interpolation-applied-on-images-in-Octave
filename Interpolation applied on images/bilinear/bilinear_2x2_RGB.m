function out = bilinear_2x2_RGB(img, STEP = 0.1)
    % =========================================================================
    % Aplica interpolare biliniara pe imaginea 2x2 img cu puncte intermediare
    % echidistante, cu precizarea ca img este o imagine colorata RGB.
    % f are valori cunoscute in punctele (1, 1), (1, 2), (2, 1) si (2, 2).
    % Practic, apeleaza bilinear_2x2_interpolation pe fiecare canal al imaginii
    % img si reconstruieste imaginea colorata la final
    % Parametrii:
    % - img = imaginea 2x2 RGB care doreste sa fie interpolata
    % - STEP = distanta dintre doua puncte succesive
    % =========================================================================

    % extrage canalul rosu al imaginii
    r=img(:,:,1);
    
    % extrage canalul verde al imaginii
    g=img(:,:,2);
    
    % extrace canalul albastru al imaginii
    b=img(:,:,3);

    % aplica bilinear_2x2_interpolation pe fiecare dintre canale
    out_r=bilinear_2x2(r,STEP);
    out_g=bilinear_2x2(g,STEP);
    out_b=bilinear_2x2(b,STEP);
    

    % combina rezultatul in imaginea finala
    out=cat(3,out_r,out_g,out_b);

endfunction
