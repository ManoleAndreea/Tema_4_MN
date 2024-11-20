% Tema 4 MN
% Manole Andreea - Cristina 321 AA

% Numarul meu pe Teams este impar, deci A este inferior bidiagonala.

%   Se da o matrice memorata prin doi vectori, unul pentru diagonala 
% principala, celalalt pentru a doua diagonala.
%   Scrieti un algoritm eficient pentru rezolvarea sistemului Ax=b.
% Ilustreaza functionalitatea printr-un exemplu cu n>5. Verifca
% corectitudinea rezultatului.

n=10;

d1=randn(1, n);
d2=randn(1, n-1);

% A este inferior bidiagonala deci are elemente nenule doar pe diagonala
% principala = d1 si diagonala de sub cea principala = d2


x=zeros(1, n);
b=randn(1,n);
b=b';
x=x';

x(1)=b(1)/d1(1);
for i=2:n
    x(i)=(b(i)-d2(i-1)*x(i-1))/d1(i);
end

% Pentru a verifica corectitudinea algoritmului voi calcula matricea A, 
% dupa Ax si norma diferentei dintre b si Ax, unde Ax=b, iar daca aceasta
% este mai mica de 10^-10 atunci solutia e corecta.

A=diag(d1)+diag(d2, -1);
b_calc=A*x;
norm_diff=norm(b-b_calc);
disp('Norma diferentei |b - A*x| este:')
disp(norm_diff);