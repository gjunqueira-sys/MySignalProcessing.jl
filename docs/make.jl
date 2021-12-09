using MySignalProcessing
using Documenter

DocMeta.setdocmeta!(MySignalProcessing, :DocTestSetup, :(using MySignalProcessing); recursive=true)

makedocs(;
    modules=[MySignalProcessing],
    authors="Gil Junqueira",
    repo="https://github.com/gjunqueira-sys/MySignalProcessing.jl/blob/{commit}{path}#{line}",
    sitename="MySignalProcessing.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://gjunqueira-sys.github.io/MySignalProcessing.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/gjunqueira-sys/MySignalProcessing.jl",
    devbranch="master",
)
