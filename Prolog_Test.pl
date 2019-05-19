%Reglas gramatica
oracion(O) :- s_nominal(SN), s_verbal(SV), append(SN,SV,O).
oracion(O) :- s_verbal(SV), append(SV,O).

s_nominal(SN) :- determinante(DT),s_nominal2(SN),append(DT,SN,SN).
s_nominal(SN) :- s_nominal2(SN),append(SN,SN).

s_nominal2(SN2) :- s_adjetivo(SA),s_nominal2(SN),append(SA,SN,SN2).
s_nominal2(SN2) :- sustantivo(S),s_nominal3(SN3),append(S,SN3,SN2).
s_nominal2(SN2) :- sustantivo(S),s_adjetivo(SA),s_nominal3(SN3),append(S,SA,SN3,SN2).

s_nominal3(SN3) :- s_preposicion(SP),s_nominal3(SN3),append(SP,SN3,SN3).
s_nominal3(SN3) :- s_nominal(SN),s_nominal3(SN3),append(SN,SN3,SN3).

s_preposicional(SP) :- preposicion(P),s_nominal(SG),append(P,SN,SP).

s_adjetivo(SA) :- s_adverbial(SADV),s_adjetivo(SA),append(SADV,SA,SA).
s_adjetivo(SA) :- adjetivo(ADJ),s_adjetivo2(SA2),append(ADJ,SA2,SA).

s_adjetivo(SA2) :- s_preposicional(SP),s_adjetivo2(SA2),append(SP,SA2,SA2).

s_adverbial(SADV) :- adverbio(A),s_adverbial2(SADV2),append(A,SADV2,SADV).

s_adverbial2(SADV2) :- s_preposicional(SP),s_adverbial2(SADV2),append(SP,SADV2,SADV2).

s_verbal(SV):- verbo(V),complementos(C),append(V,C,SV).
s_verbal(SV):- verbo(V),s_adjetivo(SA),append(V,SA,SV).
s_verbal(SV):- verbo(V),s_preposicional(SP),append(V,SP,SV).
s_verbal(SV):- verbo(V),s_nominal(SN),append(V,SN,SV).

complementos(C):- complemento(C),complementos(CS),append(C,CS,C).
complemento(C):- s_nominal(C) | s_adjetivo(C) | s_adverbial(C) | s_adjetivo(C),append(C,C).

%Vocabulario



s_nominal(SN) :- nombre(SN).
s_nominal(SN) :- articulo(masculino,A), nombre(N), append(A,N,SN).
s_verbal(SV) :- verbo(V), s_nominal(SN), append(V,SN,SV).
articulo(masculino,[el]).
articulo(femenino,[ella]).
nombre([gato]). nombre([perro]). nombre([pescado]). nombre([carne]).
verbo([come]).
