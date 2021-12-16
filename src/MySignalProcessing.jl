module MySignalProcessing

# Write your package code here.

# Dependancies
include("types.jl")
using .types: signal

#exports
export impseq
export signal
export stepseq
export sigshift
export realexp


"""
    δ(start::Int, stop::Int)

Unit impulse signal
This function has the form of :

    δ(n) = 1 if n=0
         = 0 if n!=0

# parameters
    `start:: Int` : start of the impulse sequence n (horizontal axis)
    `stop:: Int` : stop of the impulse sequence n (horizontal axis)
        

# returns
    s::signal
"""
function impseq(start::Int, stop::Int)
    s = signal(0.0, start,stop); #constructor for initial signal

    for x in 1:length(s.n)

        s.A[x] = Float64(s.n[x] == 0) # elegant way to return 1
        
    end

    return s
    
end





"""
    stepseq(start::Int, stop::Int)

Unit Step Sequence
This function has the form of :

    stepseq(n) = 1 if n ≥ 0
                = 0 if n < 0

# parameters
    `start:: Int` : start of the step sequence n (horizontal axis)
    `stop:: Int` : stop of the step sequence n (horizontal axis)

# returns
    s::signal

"""
function stepseq(start::Int, stop::Int)
    s = signal(0.0, start,stop); #constructor for initial signal

    for x in 1:length(s.n)

        s.A[x] = Float64(s.n[x] >= 0) # elegant way to return 1
       
    end

    return s
    
end




"""
    sigshift(s::signal, m::Int)

Function to shift signal s by adding m to each element of s.n
It implements y(n) = x(n-n₀)

    

# parameters
    `s::signal` : signal to be shifted
    `n₀::Int` : shift amount

# returns
    s'::signal shifted
"""
function sigshift(s::signal, n₀::Int)
    y = s.A;
    n = s.n .+ n₀;
    s = signal(y, n);
    return s
    
end




"""
    realexp(a::Real, n₀::Int , nf::Int)

Function to generate a real exponential signal.

Signal of the form:
```math
r(a, n) = a^n
```


# parameters
    `a::Real` : real-valued parameter of the exponential
    `n₀::Int` : start  the signal
    `nf::Int` : stop  of the signal

# returns
    s::signal

 """
function realexp(a::Real, n₀::Int, nf::Int)
    s = signal(0.0, n₀, nf); #constructor for initial signal

    for x in 1:length(s.n)

        s.A[x] = a^(s.n[x])
       
    end

    return s
    
end
 




end
