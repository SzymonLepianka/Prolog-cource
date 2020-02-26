%zad1
func_call(A/_/Res,B,C) :-
    !,
    nth1(Res, L, C, B),
    Zapytanie =.. [A|L],
    call(Zapytanie).


%zad2
func_call(A/Args,B,C) :-
    !,
    func_call(A/Args/Args,B,C).

func_call(A,B,C) :-
    current_predicate(A/X),
    func_call(A/X/X,B,C).


%zad3
:- op(500, xfy, <#).
:- op(450, xfy, #).

Result <# Function # ArgsChain :- 
    parse_args_chain(ArgsChain, Args), 
    func_call(Function, Args, Result).

parse_args_chain(H # T, [H|TArgs]) :- 
    !, 
    parse_args_chain(T, TArgs).

parse_args_chain(H, [H]).


