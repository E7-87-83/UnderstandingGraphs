using Plots
using LaTeXStrings
gr()
default(framestyle = :zerolines)



function my_func(x)
    return x*sin(x+1)
end



function text_helper(x)
    ans = string(x)
    if length(ans) < 2 
        return "00"*ans
    else 
        if length(ans) < 3
            return "0"*ans
        end
    end
    return ans
end



for a = 0:1:133
    new_a = a*0.01
    Plots.plot(
        x -> my_func(x+new_a), -5:0.1:5, leg = false, 
        xlims = (-5, 5), ylims = (-5, 5), 
        ratio=1,
        xtick=-4:1:4, ytick=-4:1:4,
        title=L"y = (x+a) \ \sin{(x+a+1)}",
        color=:red
    )
    Plots.plot!(my_func, -5:0.1:5, color=:aqua)
    annotate!(2.3, 1.0, "a = $(@sprintf("%.2f",new_a))")
    savefig("translation$(text_helper(a)).png")
end




# convert -delay 30 -loop 0 *.png translation.gif

