pai(a, b).
pai(a, c).
pai(b, d).
pai(b, e).
pai(c, f).

/* QUESTAO 1
 * a) Defina um predicado irmao que seja verdadeiro se X e Y forem irmãos; 
 * b) Defina um predicado primo que seja verdadeiro se X e Y forem primos; 
 * c)  Defina um predicado neto se X for neto de Y. 
*/
irmao(X, Y) :- pai(Z, X), pai(Z, Y).
primo(X, Y) :- pai(Z, X), irmao(Z, P), pai(P, Y) -> true.
neto(X, Y) :- pai(Z, X), pai(Y, Z) -> true.

/* QUESTAO 2
 * Você  deve  procurar,  implementar  e  explicar,  um  predicado 𝑞𝑢𝑖𝑐𝑘𝑠𝑜𝑟𝑡(𝐿,𝐾) no  qual,  dada 
uma  lista  de  inteiros  𝐿,  devolve  uma  lista  𝐾 com  estes  inteiros  ordenados  segundo  o 
algoritmo de quick sort. 
*/

% o algoritmo divide a lista em 2 baseado no "pivot", uma lista para os menores e outro para os maiores que o pivot, e no fim concatena as listas com o header da lista com os maiores(o pivot), no centro

quicksort([],[]).
quicksort([H|T], K) :- particao(H, T, L, G), quicksort(L, Kl), quicksort(G, Kg), append(Kl, [H|Kg], K).
particao(_, [], [], []). % caso for vazio, sai das chamadas recursivas
particao(P, [H|T], [H|L], G) :- H =< P, particao(P, T, L, G).
particao(P, [H|T], L, [H|G]) :- H > P, particao(P, T, L, G).

/* QUESTAO 3
 * Você deve procurar, implementar e explicar, um predicado 𝑚𝑒𝑟𝑔𝑒𝑠𝑜𝑟𝑡(𝐿,𝐾) no qual, dada 
uma  lista  de  inteiros  𝐿,  devolve  uma  lista  𝐾 com  estes  inteiros  ordenados  segundo  o 
algoritmo de merge sort.  
*/

% o algoritmo divide a lista em varias outras listas e concatena uma em uma de acordo com o tamanho dos dois numeros sobrando nas listas

mergesort([],[]).
mergesort([A],[A]).
mergesort([A, B|R],K) :- divide([A, B|R], L1, L2), mergesort(L1, S1), mergesort(L2, S2), merge(S1, S2, K).

divide([],[],[]).
divide([A], [A], []).
divide([A, B|R], [A|Ra], [B|Rb]) :- divide(R, Ra, Rb).

merge(A, [], A).
merge([], B, B).
merge([A|Ra], [B|Rb], [A|M]) :- A =< B, merge(Ra, [B|Rb], M).
merge([A|Ra], [B|Rb], [B|M]) :- A > B, merge([A|Ra], Rb, M).
                                                 
/** <examples>
?- irmao(e, d).
?- primo(f, e).
?- neto(f, c).
?- quicksort([4,3,2,7,5], S).
?- mergesort([4,3,2,7,5], S).
*/
