clear
zad1
close all;

syms k u(k) y(k)
y(k) = -Gz.Denominator{1}(2)*y(k-1) - Gz.Denominator{1}(3)*y(k-2) ...
    + Gz.Numerator{1}(2)*u(k-11) + Gz.Numerator{1}(3)*u(k-12); 

% kk = 150;
% u = ones (kk , 1) ;
% t = (0:kk -1) * Tp;
% y = zeros (kk , 1) ;
% for k = 13: kk
%     y(k) = -Gz.Denominator{1}(2)*y(k-1) - Gz.Denominator{1}(3)*y(k-2) ...
%     + Gz.Numerator{1}(2)*u(k-11) + Gz.Numerator{1}(3)*u(k-12);  
% end
% stairs(1:kk, y)
% xlabel('k'); ylabel('y');

