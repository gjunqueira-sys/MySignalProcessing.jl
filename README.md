# MySignalProcessing

[![Stable](https://img.shields.io/badge/docs-stable-blue.svg)](https://gjunqueira-sys.github.io/MySignalProcessing.jl/stable)
[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://gjunqueira-sys.github.io/MySignalProcessing.jl/dev)
[![Build Status](https://github.com/gjunqueira-sys/MySignalProcessing.jl/actions/workflows/CI.yml/badge.svg?branch=master)](https://github.com/gjunqueira-sys/MySignalProcessing.jl/actions/workflows/CI.yml?query=branch%3Amaster)
[![Coverage](https://codecov.io/gh/gjunqueira-sys/MySignalProcessing.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/gjunqueira-sys/MySignalProcessing.jl)
[![Code Style: Blue](https://img.shields.io/badge/code%20style-blue-4495d1.svg)](https://github.com/invenia/BlueStyle)
[![ColPrac: Contributor's Guide on Collaborative Practices for Community Packages](https://img.shields.io/badge/ColPrac-Contributor's%20Guide-blueviolet)](https://github.com/SciML/ColPrac)

# Jupyter Notebook

For completed examples, pls see provided Jupyter notebook.
# Installation

## This package is not yet release, so pls clone this repository:

> git clone, cd to project directory and run the following commands:

```julia
pkg> activate .

pkg> instantiate
```
For Applications examples, pls see:

[https://gjunqueira-sys.github.io/J-J-Engineering-Blog/](https://gjunqueira-sys.github.io/J-J-Engineering-Blog/)


# Creating a signal (Constructors)

- _signal(A::Real, start::Int, stop::Int)_

```julia
using MySignalProcessing

signal(1.5, -5, 7) # creates a signal with 1.5 amplitude at range n = -5 to 7

signal(Real[1.5, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5], Real[-5, -4, -3, -2, -1, 0, 1, 2, 3, 4, 5, 6, 7])
```

- _signal(A::Real, n::Int)_

```julia
s = signal(2.0, 10) # creates a signal with 2.0 amplitude and n samples starting at n=0

signal(Real[2.0, 2.0, 2.0, 2.0, 2.0, 2.0, 2.0, 2.0, 2.0, 2.0], Real[0, 1, 2, 3, 4, 5, 6, 7, 8, 9])
```

- _signal(A::Vector, n::Vector)_ 

```julia
s - signal([1.0, 2.0, 2.1], [-1, 0, 1]) # creates a signal from amplitude vector and n sample vector

signal(Real[1.5, 2.0, 3.0], Real[-1, 0, 1])
```

# UNIT SAMPLE SEQUENCE

- _impseq(start::Int, stop::Int)_

```julia
using MySignalProcessing
using Plots
s = impseq(-10, 10); # creates a unit sample sequence from -10 to 10
plot(s.n, s.A, line =:stem, marker=:o)

```
<img src="src\impulse.png" alt="Imp. Sequence" width="400"/>


# UNIT STEP SEQUENCE

- _stepseq(start::Int, stop::Int)_

```julia
s = stepseq(-10, 10); # creates a unit step sequence from -10 to 10
plot(s.n, s.A, line =:stem, marker=:o)
```
<img src="src\step.png" alt="Step  Sequence" width="400"/>

# Signal Shift

- _sigshift(n₀::Int)_

```julia
s = impseq(-10, 10);
sshifted = s |> sigshift(5) # generate impulse signal then pipe it to sigshift(5) , to shift it by 5 samples
p1 = plot(s.n, s.A, line =:stem, marker=:o)
p2 = plot(sshifted.n, sshifted.A, line =:stem, marker=:o)
plot(p1,p2, layout=(1,2))
```
<img src="src\impulse_shifted.png" alt="Imp. Shifted" width="400"/>

