using Plots
using LaTeXStrings
gr()
default(framestyle = :zerolines)


function my_func(x)
    return x*sin(x+1)
end

for a = 100:1:133
    new_a = a*0.01
    my_new_func(x) = new_a * my_func(x)
    Plots.plot(
        my_new_func, -5:0.1:5, leg = false, 
        xlims = (-5, 5), ylims = (-5, 5), 
        ratio=1,
        xtick=-4:1:4, ytick=-4:1:4,
        title=L"y = a \ x \ \sin{(x+1)}",
        color=:red
    )
    Plots.plot!(my_func, -5:0.1:5, color=:aqua)
    annotate!(2.3, 1.0, "a = $(@sprintf("%.2f",new_a))")
    savefig("elong$a.png")
end



# convert -delay 30 -loop 0 *.png elongation.gif

