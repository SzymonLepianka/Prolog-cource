% Dynamiczny predykat służący
% przechowywaniu imion znajomych
:- dynamic jest_znajomym/1.

% Główna pętla programu:
% - wczytuje komendę
% - przetwarza komendę
% - zapętla się ;)
main :- 
    read_command(Command),
    process_command(Command),
    main.

% Predykat pobierający komendą ze standardowego wejścia
% Dostępne komendy:
% - "add" - dodaj znajomego
% - "del" - usuń znajomego
% - "list" - wypisz znajomych
% - "help" - wyświetl listę komend
% - "exit" - wyjdź z programu
read_command(Command) :- read(Command).

% Predykat realizujący komendę 'help'
% Potrzeba jeszcze czterech innych komend,
% W przypadku nierozpoznoznanej komendy, program powinien
% wypisać informacje, że nie zna podanej komendy i kontynuować 
process_command(help) :- 
    writeln("Lista komend:"),
    writeln("- 'add' - dodaj znajomego"),
    writeln("- 'del' - usuń znajomego"),
    writeln("- 'list' - wypisz wszystkich znajomych"),
    writeln("- 'help' - wyświetl listę komend"),
    writeln("- 'exit' - zakończ program").    

% Misja: napisz kod realizujący brakujące komendy!

process_command(add) :-
    write("Podaj imię: "), nl, read(Imie),
    assert(jest_znajomym(Imie)),
    writeln("dodano znajomego").

process_command(del) :-
    write("Podaj imię do usunięcia: "), nl, read(Imie),
    retract(jest_znajomym(Imie)),
    writeln("usunięto znajomego").

process_command(list) :- writeln("Twoja lista znajomych: "), wypisz().
wypisz() :- jest_znajomym(X), write(X), nl, fail.
wypisz.

process_command(exit) :-
    writeln("Koniec!"),
    fail.