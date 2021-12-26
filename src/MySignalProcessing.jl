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
export sigadd
export sigmult
export sigrand
export sigscale
export sigfold


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
    `start:: Int` : start of the sampple position n (horizontal axis)
    `stop:: Int` : stop of the sample position n (horizontal axis)

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
    _sigshift(s::signal, m::Int)

Function to shift signal s by adding m to each element of s.n
It implements y(n) = x(n-n₀)

    

# parameters
    `s::signal` : signal to be shifted
    `n₀::Int` : shift amount

# returns
    s'::signal shifted
"""
function _sigshift(s::signal, n₀::Int)
    y = s.A;
    n = s.n .+ n₀;
    s = signal(y, n);
    return s
    
end

"""
    sigshift(n₀::Int)

# parameters
    `n₀::Int` : shift amount

# returns
    s:: anonimous  function that shifts a signal (designed to be composable)

"""
function sigshift(n₀::Int)
    
    return (sig -> _sigshift(sig, n₀))
    
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
    `n₀::Int` : start  the sample positon signal
    `nf::Int` : stop  of the sample positon  signal

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
 


"""
    sigadd(s1::signal, s2::signal)

Function to add two signal s1 and s2.
pls note that the signals must have the same length
If sequences are of unequal lenghts or if the sample positions are 
    different for equal-length sequences, the we cannot directly add
        We have to first augment x1(n) and x2(n) , so that they have the same
         position vector n (and hence the same length)

# parameters
    `s1::signal` : signal to be added
    `s2::signal` : signal to be added

# returns
    `s::signal` : signal s1 + s2

"""
function sigadd(s₁::signal  , s₂::signal)

    n₀ =min(minimum(s₁.n), minimum(s₂.n)) # find the minimum sample position
    nf = max(maximum(s₁.n), maximum(s₂.n)) # find the maximum sample position
    n=n₀:nf; # create the sample position vector

    y₁ = signal(0.0, n₀, nf); #constructor for initial signal
    y₂ = signal(0.0, n₀, nf); #constructor for initial signal

    filter1 = findall((n .≥ minimum(s₁.n)) .& (n .≤ maximum(s₁.n)) .== 1)
    filter2 = findall((n .≥ minimum(s₂.n)) .& (n .≤ maximum(s₂.n)) .== 1)

    y₁.A[filter1] = s₁.A; # fill the signal with the values of s₁
    y₂.A[filter2] = s₂.A; # fill the signal with the values of s₂

    s = signal(0.0, n₀, nf); #constructor for initial signal
    s.A = y₁.A + y₂.A; # add the two signals

    return s



end






"""
    sigmult(s1::signal, s2::signal)

Function to multiply two signal s1 and s2.
pls note that the signals must have the same length
If sequences are of unequal lenghts or if the sample positions are 
    different for equal-length sequences, the we cannot directly add
        We have to first augment x1(n) and x2(n) , so that they have the same
         position vector n (and hence the same length)

# parameters
    `s1::signal` : signal to be added
    `s2::signal` : signal to be added

# returns
    `s::signal` : signal s1 * s2

"""
function sigmult(s₁::signal  , s₂::signal)

    n₀ =min(minimum(s₁.n), minimum(s₂.n)) # find the minimum sample position
    nf = max(maximum(s₁.n), maximum(s₂.n)) # find the maximum sample position
    n=n₀:nf; # create the sample position vector

    y₁ = signal(0.0, n₀, nf); #constructor for initial signal
    y₂ = signal(0.0, n₀, nf); #constructor for initial signal

    filter1 = findall((n .≥ minimum(s₁.n)) .& (n .≤ maximum(s₁.n)) .== 1)
    filter2 = findall((n .≥ minimum(s₂.n)) .& (n .≤ maximum(s₂.n)) .== 1)

    y₁.A[filter1] = s₁.A; # fill the signal with the values of s₁
    y₂.A[filter2] = s₂.A; # fill the signal with the values of s₂

    s = signal(0.0, n₀, nf); #constructor for initial signal
    s.A = y₁.A .* y₂.A; # add the two signals

    return s



end




"""
    sigrand(start::Int, stop::Int)

Function to generate a random signal starting at sample position start and ending at sample position stop.
The function generates a length N random sequence whose elements are uniformely distributed between 0 and 1.

# parameters
    `start::Int` : start  the sample positon signal
    `stop::Int` : stop  of the sample positon  signal

# returns
    s::signal

"""
function sigrand(start::Int, stop::Int)
    n = start:stop |> collect; # create the sample position vector
    y = rand.(length(n)); # generate a random sequence
    s = signal(y, n); #constructor for initial signal
    return s
    
end



"""
    _sigscale(s::signal, α::Real)

Each signal sample is multiple by a scalar α

# parameters
    `s::signal` : signal to be scaled
    `α::Real` : scalar

# returns
    `s::signal` : scaled signal
"""
function _sigscale(s::signal, α::Real)

    s1 = signal(s.A .* α, s.n); #constructor for initial signal
    
    return s1
    
end


"""
    sigscale(α::Real)

Each signal sample is multiple by a scalar α

# parameters
    `α::Real` : scalar

# returns
    anonimous function that takes a signal as argument and returns 
         scaled signal (designed to be composable)

"""
function sigscale(α::Real)
    
    return (sig -> _sigscale(sig, α))
end



"""
    sigfold(s::signal)

In this operation, each sample of x(n) is flipped around n=0 to obtain a folded sequence  y(n)

y(n) = {x(-n)}

# parameters
    `s::signal` : signal to be folded

# returns
    `s::signal` : folded signal

"""
function  sigfold(s::signal)
    s1 = signal(s.A, s.n); #constructor for initial signal
    s1.A = reverse(s.A);
    s1.n = -reverse(s.n);
    return s1
end


end
