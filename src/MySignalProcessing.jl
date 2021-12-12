module MySignalProcessing

# Write your package code here.

# Dependancies
include("types.jl")
using .types: signal

#exports
export impseq
export signal


"""
    δ(s::signal)

Unit impulse signal
This function has the form of :

    δ(n) = 1 if n=0
         = 0 if n!=0

# parameters
    s:: signal

# returns
    s::signal
"""
function impseq(start::Int, stop::Int)
    s = signal(0.0, start,stop);

    for x in 1:length(s.n)
        if s.n[x] == 0
            s.A[x] = 1.0
        end
    end

    return s
    
end




end
