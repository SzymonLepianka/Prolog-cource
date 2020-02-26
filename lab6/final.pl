% zadanie 1
func_call(A/_/Res,B,C):-
    !,
    List=[A|B],
    nth0(Res,List2,C,List),
    Zapytanie =.. List2,
    Zapytanie.
    
% zadanie 2
func_call(A/Args,B,C) :-
    !,
    func_call(A/Args/Args,B,C).

func_call(A,B,C) :-
    !,
    current_predicate(A/X),
    func_call(A/X/X,B,C).

% zadanie 3
 :- op(500, xfx, <#).
 :- op(450, xfy, #).
 :- op(400, fx, #).
%odkomentować żeby zadanie 3 działało :)
 %Result <# Function # ArgsChain :- 
 %    parse_args_chain(ArgsChain, Args), 
 %    func_call(Function,Args,Result).

 %parse_args_chain(H # T, [ H | TArgs]) :-
 %    !,
 %    parse_args_chain(T,TArgs).

 % parse_args_chain(H, [H]). 


% zadanie 4
curry_call(function(Fun/NArgs/I,X),Arg,Result):-
    !,
    append(X,[Arg],Y),
    N is NArgs-1,
    (length(Y,N) ->
        func_call(Fun/NArgs/I,Y,Result);
        Result=function(Fun/NArgs/I,Y)). 

curry_call(function(Fun/NArgs,X),Arg,Result):-
    !,
    curry_call(function(Fun/NArgs/NArgs,X),Arg,Result).

curry_call(function(Fun,X),Arg,Result):-
    !,
    current_predicate(Fun/NArgs),
    curry_call(function(Fun/NArgs/NArgs,X),Arg,Result).

% zadanie 5

Result <# Function # ArgsChain :-
    initial_function(Function, IF),
    curry(IF, ArgsChain, Result).

initial_function(function(F,A), function(F,A)) :-
    !.
initial_function(F, function(F, [])).
               
%curry(F, A # T, Result) :-
%    !,
%	curry_call(F,A,R),
%	curry_call(R,T,Result).

%curry(F, A, Result) :-
%    curry_call(F,A,Result).

% zadanie 6 

curry(F, A # T, Result) :-
    !,
    curry_unpack(A, UA),
    curry_call(F, UA, Res),
    curry(Res, T, Result).
   
curry(F, A, Result) :-
    curry_unpack(A, UA),
    curry_call(F, UA, Result).
   
curry_unpack(#(F # Args), AU) :-
    !,
    initial_function(F, IF),
    curry(IF, Args, AU).
    
curry_unpack(A, A).
