function out = bilinear_rotate_RGB(img, rotation_angle)
    % =========================================================================
    % Aplica interpolare bilineara pentru a roti o imagine RGB cu un unghi dat.
    % =========================================================================
    
    % extrage canalul rosu al imaginii
    r=img(:,:,1);

    % extrage canalul verde al imaginii
    g=img(:,:,2);

    % extrace canalul albastru al imaginii
    b=img(:,:,3);

    % aplicat rotatia pe fiecare canal al imaginii
    out_r=bilinear_rotate(r,rotation_angle);
    out_g=bilinear_rotate(g,rotation_angle);
    out_b=bilinear_rotate(b,rotation_angle);

    % reconstruieste imaginea RGB finala
    out=cat(3,out_r,out_g,out_b);
    
endfunction