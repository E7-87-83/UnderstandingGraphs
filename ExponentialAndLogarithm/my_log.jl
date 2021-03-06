using Plots
using LaTeXStrings
gr()
default(framestyle = :zerolines)


function my_log(x,n)
    return log(x)/log(n)
end

for n = 2:0.5:10
    Plots.plot(
        x -> my_log(x,n), 0.01:0.05:20, leg = false, 
        xlims = (-2, 20), ylims = (-5, 10), 
        ratio=1,
        xtick=-2:2:20, ytick=-4:2:10,
        title=L"y = \log_n x",
        color=:red
    )
    annotate!(5.0, 7.0, "n = $n")
    t = Int64(n * 10.0)
    savefig("my_log0$t.png")
end



# mv my_log0100.png my_log100.png
# convert -delay 120 -loop 0 *.png my_log.gif

