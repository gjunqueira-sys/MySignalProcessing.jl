var documenterSearchIndex = {"docs":
[{"location":"","page":"Home","title":"Home","text":"CurrentModule = MySignalProcessing","category":"page"},{"location":"#MySignalProcessing","page":"Home","title":"MySignalProcessing","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Documentation for MySignalProcessing.","category":"page"},{"location":"","page":"Home","title":"Home","text":"","category":"page"},{"location":"","page":"Home","title":"Home","text":"Modules = [MySignalProcessing]","category":"page"},{"location":"#Base.:*-Tuple{Real, signal}","page":"Home","title":"Base.:*","text":"*(α::Real, s₁::signal)\n\nscale signal by scalar.\n\nArguments\n\n`s₁::signal` : signal to be multiplied\n`α::Real` : scalar\n\nReturns\n\n`s::signal` : signal s1 * α\n\n\n\n\n\n","category":"method"},{"location":"#Base.:*-Tuple{signal, Real}","page":"Home","title":"Base.:*","text":"*(s₁::signal  , α::Real)\n\nscale signal by scalar.\n\nArguments\n\n`s₁::signal` : signal to be multiplied\n`α::Real` : scalar\n\nReturns\n\n`s::signal` : signal s1 * α\n\n\n\n\n\n","category":"method"},{"location":"#Base.:*-Tuple{signal, signal}","page":"Home","title":"Base.:*","text":"*(s₁::signal  , s₂::signal)\n\nMultiples two signal objects together.\n\nArguments\n\n`s₁::signal` : signal to be multiplied\n`s₂::signal` : signal to be Multiples\n\nReturns\n\n`s::signal` : signal s1 * s2\n\n\n\n\n\n","category":"method"},{"location":"#Base.:+-Tuple{signal, signal}","page":"Home","title":"Base.:+","text":"Base.+(s₁::signal  , s₂::signal)\n\nExtends Base.+ to add two signal objects together.\n\nArguments\n\n`s₁::signal` : signal to be added\n`s₂::signal` : signal to be added\n\nReturns\n\n`s::signal` : signal s1 + s2\n\n\n\n\n\n","category":"method"},{"location":"#MySignalProcessing._sigscale-Tuple{signal, Real}","page":"Home","title":"MySignalProcessing._sigscale","text":"_sigscale(s::signal, α::Real)\n\nEach signal sample is multiple by a scalar α\n\nparameters\n\n`s::signal` : signal to be scaled\n`α::Real` : scalar\n\nreturns\n\n`s::signal` : scaled signal\n\n\n\n\n\n","category":"method"},{"location":"#MySignalProcessing._sigshift-Tuple{signal, Int64}","page":"Home","title":"MySignalProcessing._sigshift","text":"_sigshift(s::signal, m::Int)\n\nFunction to shift signal s by adding m to each element of s.n It implements y(n) = x(n-n₀)\n\nparameters\n\n`s::signal` : signal to be shifted\n`n₀::Int` : shift amount\n\nreturns\n\ns'::signal shifted\n\n\n\n\n\n","category":"method"},{"location":"#MySignalProcessing.energy-Tuple{signal}","page":"Home","title":"MySignalProcessing.energy","text":"energy(s::signal)\n\nCalculate the energy of a signal The energy of a signal is given by the sum of the      absolute squared values of the signal samples\n\nparameters\n\n`s::signal` : input signal\n\nreturns\n\n`e::Real` : energy of the signal\n\n\n\n\n\n","category":"method"},{"location":"#MySignalProcessing.impseq-Tuple{Int64, Int64}","page":"Home","title":"MySignalProcessing.impseq","text":"δ(start::Int, stop::Int)\n\nUnit impulse signal This function has the form of :\n\nδ(n) = 1 if n=0\n     = 0 if n!=0\n\nparameters\n\n`start:: Int` : start of the impulse sequence n (horizontal axis)\n`stop:: Int` : stop of the impulse sequence n (horizontal axis)\n\nreturns\n\ns::signal\n\n\n\n\n\n","category":"method"},{"location":"#MySignalProcessing.realexp-Tuple{Real, Int64, Int64}","page":"Home","title":"MySignalProcessing.realexp","text":"realexp(a::Real, n₀::Int , nf::Int)\n\nFunction to generate a real exponential signal.\n\nSignal of the form:\n\nr(a n) = a^n\n\nparameters\n\n`a::Real` : real-valued parameter of the exponential\n`n₀::Int` : start  the sample positon signal\n`nf::Int` : stop  of the sample positon  signal\n\nreturns\n\ns::signal\n\n\n\n\n\n","category":"method"},{"location":"#MySignalProcessing.sigadd-Tuple{signal, signal}","page":"Home","title":"MySignalProcessing.sigadd","text":"sigadd(s1::signal, s2::signal)\n\nFunction to add two signal s1 and s2. pls note that the signals must have the same length If sequences are of unequal lenghts or if the sample positions are      different for equal-length sequences, the we cannot directly add         We have to first augment x1(n) and x2(n) , so that they have the same          position vector n (and hence the same length)\n\nparameters\n\n`s1::signal` : signal to be added\n`s2::signal` : signal to be added\n\nreturns\n\n`s::signal` : signal s1 + s2\n\n\n\n\n\n","category":"method"},{"location":"#MySignalProcessing.sigfold-Tuple{signal}","page":"Home","title":"MySignalProcessing.sigfold","text":"sigfold(s::signal)\n\nIn this operation, each sample of x(n) is flipped around n=0 to obtain a folded sequence  y(n)\n\ny(n) = {x(-n)}\n\nparameters\n\n`s::signal` : signal to be folded\n\nreturns\n\n`s::signal` : folded signal\n\n\n\n\n\n","category":"method"},{"location":"#MySignalProcessing.sigmult-Tuple{signal, signal}","page":"Home","title":"MySignalProcessing.sigmult","text":"sigmult(s1::signal, s2::signal)\n\nFunction to multiply two signal s1 and s2. pls note that the signals must have the same length If sequences are of unequal lenghts or if the sample positions are      different for equal-length sequences, the we cannot directly add         We have to first augment x1(n) and x2(n) , so that they have the same          position vector n (and hence the same length)\n\nparameters\n\n`s1::signal` : signal to be added\n`s2::signal` : signal to be added\n\nreturns\n\n`s::signal` : signal s1 * s2\n\n\n\n\n\n","category":"method"},{"location":"#MySignalProcessing.sigrand-Tuple{Int64, Int64}","page":"Home","title":"MySignalProcessing.sigrand","text":"sigrand(start::Int, stop::Int)\n\nFunction to generate a random signal starting at sample position start and ending at sample position stop. The function generates a length N random sequence whose elements are uniformely distributed between 0 and 1.\n\nparameters\n\n`start::Int` : start  the sample positon signal\n`stop::Int` : stop  of the sample positon  signal\n\nreturns\n\ns::signal\n\n\n\n\n\n","category":"method"},{"location":"#MySignalProcessing.sigscale-Tuple{Real}","page":"Home","title":"MySignalProcessing.sigscale","text":"sigscale(α::Real)\n\nEach signal sample is multiple by a scalar α\n\nparameters\n\n`α::Real` : scalar\n\nreturns\n\nanonimous function that takes a signal as argument and returns \n     scaled signal (designed to be composable)\n\n\n\n\n\n","category":"method"},{"location":"#MySignalProcessing.sigshift-Tuple{Int64}","page":"Home","title":"MySignalProcessing.sigshift","text":"sigshift(n₀::Int)\n\nparameters\n\n`n₀::Int` : shift amount\n\nreturns\n\ns:: anonimous  function that shifts a signal (designed to be composable)\n\n\n\n\n\n","category":"method"},{"location":"#MySignalProcessing.sinseq","page":"Home","title":"MySignalProcessing.sinseq","text":"sinSeq(start::Int, stop::Int, ω::Real, φ::Real)\n\nSinusoidal function\n\nparameters\n\n`start::Int` : start  the sample positon signal\n`stop::Int` : stop  of the sample positon  signal\n`ω::Real` : frequency of the sinusoid in radians\n`φ::Real` : phase of the sinusoid, in radians\n\nreturns\n\ns::sinusoidal signal\n\n\n\n\n\n","category":"function"},{"location":"#MySignalProcessing.sinseqmn","page":"Home","title":"MySignalProcessing.sinseqmn","text":"sinSeq(start::Int, stop::Int, M::Int,N::Int, φ::Real)\n\nSinusoidal function with more specific constructor\n\nparameters\n\n`start::Int` : start  the sample positon signal\n`stop::Int` : stop  of the sample positon  signal\n`M::Int` : multiple of 2π\n`N::Int` : number of periods before pattern repeats itself\n\nreturns\n\ns::sinusoidal signal\n\n\n\n\n\n","category":"function"},{"location":"#MySignalProcessing.stepseq-Tuple{Int64, Int64}","page":"Home","title":"MySignalProcessing.stepseq","text":"stepseq(start::Int, stop::Int)\n\nUnit Step Sequence This function has the form of :\n\nstepseq(n) = 1 if n ≥ 0\n            = 0 if n < 0\n\nparameters\n\n`start:: Int` : start of the sampple position n (horizontal axis)\n`stop:: Int` : stop of the sample position n (horizontal axis)\n\nreturns\n\ns::signal\n\n\n\n\n\n","category":"method"}]
}
