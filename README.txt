/*
    Windows 7 64-bit Ultimate
    SWI-Prolog (threaded, 64 bits, version 7.6.0)
    
    
    Основные обновления:
        - !Возможность загружать пользовательские карты в базу данных
        - Сохранение/загрузка найденного решения в/из файл(-а) (допустимо единственное решение)
        - Отрисовка карты в консоли

    Главный файл - 'main.pl'. Запускать его нужно именно из той дирректории, в которой он находится.

    Шифрованные карты находятся в папке 'levels'.
    Карты, представленные в виде фактов, находятся в папке 'maps'.

    Решения находятс в папке 'solutions'.
*/
%___Проверка имеющегося решения для карты на корректность: ?- test_sol(Map).
/*
    ?- test_sol('2.pl').
    true.

    ?- test_sol('3.pl').
    false.

    ?- test_sol('1.pl').
    true.
*/
%___Загрузка карты: ?- load_map(Map).
/*
    ?- load_map('1.pl').
    true.

    ?- load_map('100Boxes/zip.pl').
    true.

    ?- load_map('not_exists.pl').
    false.

    ?- load_map('path/not_exists.pl').
    false.
*/
%___Добавить все карты из папки 'levels' в папку 'maps': ?- add_maps.
/*
    ?- add_maps.
    __=='100Boxes.txt'==__
    All 10 map(s) has been successfully added.

    __=='lvl1'==__
    All 1 map(s) has been successfully added.

    __=='mylvl.pl'==__
    All 1 map(s) has been successfully added.

    __=='New/lvl1.txt'==__
    All 1 map(s) has been successfully added.

    __=='New/lvl2.txt'==__
    All 1 map(s) has been successfully added.

    __=='New - Copy/New folder/6w7rtewr.txt'==__
    All 1 map(s) has been successfully added.

    __=='New - Copy/New folder/lvl1.txt'==__
    All 1 map(s) has been successfully added.

    __=='Revenge_28.format'==__
    All 50 map(s) has been successfully added.

    __=='sasquatch6.txt'==__
    All 50 map(s) has been successfully added.

    true.
*/
%___Добавить выборочно карты из папки 'levels' в папку 'maps': ?- Maps=['map_collection1.txt', 'map_collection2.txt', ..., 'map_collectionN.txt'], add_maps(Maps).
/*
    ?- add_maps(['map_collection1.txt', 'Revenge_28.format', 'map_collection2.txt', 'lvl1', 'map_collectionN.txt']).
    __=='map_collection1.txt'==__
    file map_collection1.txt doesn`t exists

    __=='Revenge_28.format'==__
    All 50 map(s) has been successfully added.

    __=='map_collection2.txt'==__
    file map_collection2.txt doesn`t exists

    __=='lvl1'==__
    0/1 map(s) has been successfully added.

    Maps below contain some mistakes:

    fdsfds

    __=='map_collectionN.txt'==__
    file map_collectionN.txt doesn`t exists

    true.
*/
%___Базовая проверка, загруженной карты на неразрешимость: ?- solvable(load).
/*
    ?- load_map('1.pl'), solvable(load).
    true.
*/
%___Создать одну коллекцию карт: ?- add_map_list(File) % аналог add_maps([E]).
/*
    ?- add_map_list('lvl1').
    0/1 map(s) has been successfully added.

    Maps below contain some mistakes:

    fdsfds
    true.    
    
    ?- add_map_list('100Boxes.txt').
    All 10 map(s) has been successfully added.
    true.    
*/
%___Решить карту методом слепого поиска, с ограничением по глубине, без повторений состояний. Если решение уже есть в папке 'solutions' и оно правильное, то выводит его: ?- solve_map(Map).
/*
    ?- solve_map('1.pl').
    sol found
    r r r r u l pL u pL pD u pU l pD pD u u u pR pR
    CPU time = 16 msec
    true.
*/
%___Решить карту методом A* поиска: ?- solve_map2(Map).
/*
    ?- solve_map2('1.pl').
    Pass: r, r, r, u, pL, u, pL, pU, l, u, pR, pR, l, d, l, pD, pD, u, r, pD
    true ;
    false.
*/
%___Отрисовать карту в консоли: ?- draw_map(Map).
/*
    ?- draw_map('sasquatch6/50.pl').
    #################################
    ##   ###   #   ###   #   ###   ##
    # $.$. .$.$ $.$. .$.$ $.$. .$.$ #
    # .$.$ $.$. .$.$ $.$. .$.$ $.$. #
    # $.$. .$.$ $.$. .$.$ $.$. .$.$ #
    ##.$.$#$.$. .$.$#$.$. .$.$#$.$.##
    ##    #   ###   #   ###   #    ##
    ##.$.$#$.$. .$.$#$.$. .$.$#$.$.##
    # $.$. .$.$ $.$. .$.$ $.$. .$.$ #
    # .$.$ $.$. .$.$ $.$. .$.$ $.$. #
    # $.$. .$.$#$.$. .$.$#$.$. .$.$ #
    ##   ###   #   ###   #   ###   ##
    # $.$. .$.$#$.$. .$.$#$.$. .$.$ #
    # .$.$ $.$. .$.$ $.$. .$.$ $.$. #
    # $.$. .$.$ $.$. .$.$ $.$. .$.$ #
    ##.$.$#$.$. .$.$ $.$. .$.$#$.$.##
    ##    #   ###   @   ###   #    ##
    ##.$.$#$.$. .$.$ $.$. .$.$#$.$.##
    # $.$. .$.$ $.$. .$.$ $.$. .$.$ #
    # .$.$ $.$. .$.$ $.$. .$.$ $.$. #
    # $.$. .$.$#$.$. .$.$#$.$. .$.$ #
    ##   ###   #   ###   #   ###   ##
    # $.$. .$.$#$.$. .$.$#$.$. .$.$ #
    # .$.$ $.$. .$.$ $.$. .$.$ $.$. #
    # $.$. .$.$ $.$. .$.$ $.$. .$.$ #
    ##.$.$#$.$. .$.$#$.$. .$.$#$.$.##
    ##    #   ###   #   ###   #    ##
    ##.$.$#$.$. .$.$#$.$. .$.$#$.$.##
    # $.$. .$.$ $.$. .$.$ $.$. .$.$ #
    # .$.$ $.$. .$.$ $.$. .$.$ $.$. #
    # $.$. .$.$ $.$. .$.$ $.$. .$.$ #
    ##   ###   #   ###   #   ###   ##
    #################################
    true.
*/