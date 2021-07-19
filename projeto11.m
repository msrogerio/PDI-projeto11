%% Projeto 11
% *Autor:* Marlon da Silva Rogério

%% Referências
% *GONZALEZ, R. C.*, WOODS, R. E. Processamento de Imagens Digitais. 
% Editora Edgard Blucher, ISBN São Paulo, 2000.
% *Support MathWorks*, 2021. Disponível em: <https://www.mathworks.com/help/>.
% Acesso em: 18 de julho. de 2021.

% * Aplicar o PCA para compressão de imagens,utilizando uma quantidade de 
% componentes principais.
%   -- graficar numero de componetes principais vs PSNR
%   --  utilize uma imagem de sua preferencia
%   -- comente


clear; clc;close all

c_img=imread('balao.png');
g_image=rgb2gray(c_img);
g_image =g_image;

figure; imshow(g_image);
mypsnr =[];
vetor_nComp = 5:5:90;
g_image_d=double(g_image);
g_image_d_m=mean(g_image_d);
g_image_d_m_adjusted=(g_image_d-g_image_d_m);
[coeff,score, ~ , ~, ~] = pca(g_image_d_m_adjusted);
for nComp = vetor_nComp 
    reconstruction = score(:,1:nComp)*coeff(:,1:nComp)';
    final_reconstruction=(reconstruction+g_image_d_m);
    final_reconstruction=uint8(final_reconstruction);
    figure; imshow(final_reconstruction); title(num2str(nComp))

    mypsnr = [mypsnr psnr(final_reconstruction,g_image)];
end

figure; plot(vetor_nComp,mypsnr,'o-')
