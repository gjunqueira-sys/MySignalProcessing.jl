module types


mutable struct signal 

    A::Vector{Number} #Amplitude of the signal
    n::Vector{Real} #horizontal axis (discrete) of signal (in samples)

    function signal(A::Number, n::Int) # construction of signal with amplitude A and n samples starting from 0.
        A = A .*ones(n)
        n = [x for x in range(0, length=n)]
        new(A, n)
    end

    function signal(A::Number, start::Int, stop::Int)
        
        n = [x for x in range(start, stop)]
        A = A .*ones(length(n))
        new(A, n)
    end


    function signal(A::Vector, n::Vector)
        @assert length(A) == length(n) "lengths of A and n must be equal"
        new(A, n)
    end



end



end