var documenterSearchIndex = {"docs":
[{"location":"","page":"Home","title":"Home","text":"CurrentModule = MySignalProcessing","category":"page"},{"location":"#MySignalProcessing","page":"Home","title":"MySignalProcessing","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Documentation for MySignalProcessing.","category":"page"},{"location":"","page":"Home","title":"Home","text":"","category":"page"},{"location":"","page":"Home","title":"Home","text":"Modules = [MySignalProcessing]","category":"page"},{"location":"#MySignalProcessing.impseq-Tuple{Int64, Int64}","page":"Home","title":"MySignalProcessing.impseq","text":"δ(start::Int, stop::Int)\n\nUnit impulse signal This function has the form of :\n\nδ(n) = 1 if n=0\n     = 0 if n!=0\n\nparameters\n\n`start:: Int` : start of the impulse sequence n (horizontal axis)\n`stop:: Int` : stop of the impulse sequence n (horizontal axis)\n\nreturns\n\ns::signal\n\n\n\n\n\n","category":"method"},{"location":"#MySignalProcessing.realexp-Tuple{Real, Int64, Int64}","page":"Home","title":"MySignalProcessing.realexp","text":"realexp(a::Real, n₀::Int , nf::Int)\n\nFunction to generate a real exponential signal.\n\nSignal of the form:\n\nr(a n) = a^n\n\nparameters\n\n`a::Real` : real-valued parameter of the exponential\n`n₀::Int` : start  the signal\n`nf::Int` : stop  of the signal\n\nreturns\n\ns::signal\n\n\n\n\n\n","category":"method"},{"location":"#MySignalProcessing.sigshift-Tuple{signal, Int64}","page":"Home","title":"MySignalProcessing.sigshift","text":"sigshift(s::signal, m::Int)\n\nFunction to shift signal s by adding m to each element of s.n It implements y(n) = x(n-n₀)\n\nparameters\n\n`s::signal` : signal to be shifted\n`n₀::Int` : shift amount\n\nreturns\n\ns'::signal shifted\n\n\n\n\n\n","category":"method"},{"location":"#MySignalProcessing.stepseq-Tuple{Int64, Int64}","page":"Home","title":"MySignalProcessing.stepseq","text":"stepseq(start::Int, stop::Int)\n\nUnit Step Sequence This function has the form of :\n\nstepseq(n) = 1 if n ≥ 0\n            = 0 if n < 0\n\nparameters\n\n`start:: Int` : start of the step sequence n (horizontal axis)\n`stop:: Int` : stop of the step sequence n (horizontal axis)\n\nreturns\n\ns::signal\n\n\n\n\n\n","category":"method"}]
}