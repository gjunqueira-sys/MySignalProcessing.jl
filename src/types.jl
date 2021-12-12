module types


mutable struct signal 

    A::Vector{Real} #Amplitude of the signal
    n::Vector{Real} #horizontal axis (discrete) of signal (in samples)

    function signal(A::Real, n::Int) # construction of signal unit amplitude and 1000 samples 
        A = A .*ones(n)
        n = [x for x in range(0, length=n)]
        new(A, n)
    end

    function signal(A::Real, start::Int, stop::Int)
        
        n = [x for x in range(start, stop)]
        A = A .*ones(length(n))
        new(A, n)
    end



end



end