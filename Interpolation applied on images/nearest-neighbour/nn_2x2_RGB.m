function out = nn_2x2_RGB(img, STEP = 0.1)
    % =========================================================================
    % Aplica interpolare nearest neighbour pe imaginea 2x2 img cu puncte
    % intermediare echidistante.
    % img este o imagine colorata RGB.
    % =========================================================================

    % extrage canalul rosu al imaginii
    r=img(:,:,1);
   
    % extrage canalul verde al imaginii
    g=img(:,:,2);

    % extrace canalul albastru al imaginii
    b=img(:,:,3);
     
    % aplica functia nn pe cele 3 canale ale imaginii
    out_r=nn_2x2(r, STEP);
    out_g=nn_2x2(g, STEP);
    out_b=nn_2x2(b, STEP);
     

    % formeaza imaginea finala cu cele 3 canale de culori
    out=cat(3,out_r,out_g,out_b);

endfunction
