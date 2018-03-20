s_help :- format('
    add_map_list\\1 % +File
    add_maps\\0 %
    add_maps\\1 %
    load_map\\0  %
    solve_map\\1 % +Map
    draw_map\\1 % +Map
    test_sol\\1 % +Map
').

s_help(draw_map) :- format('
    "#" is a wall
    space or "-" is an empty passage
    "." is a target square
    "$" is a red bead in a passage
    "@" is a blue bead in a passage
    "*" is a red bead on a target square
    "+" is a blue bead on a target square
    Any other line separates levels
').