"""
    colourprint(str; foreground = :light_green, bold = false)

Auxiliary function for printing out text in colour in the terminal.
Available foreground colours are specified by the Crayons.jl package and are:
black, red, green, yellow, blue, magenta, cyan, light_gray, default, dark_gray, light_red, light_green, light_yellow, light_blue, light_magenta, light_cyan and white.
"""
function colourprint(str; foreground = :light_green, bold = false)

    print(Crayon(foreground = foreground, bold = bold), @sprintf("%s", str), Crayon(reset = true))

end
