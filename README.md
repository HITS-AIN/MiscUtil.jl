# MiscUtil.jl

To install and use this package, please add first the registry [CollaborativeAstronomyJulia](https://github.com/ngiann/CollaborativeAstronomyJulia).
Then, switch into "package mode" with ] and add the package with `add MiscUtil`.

This package containts my personal common utilities put in a package for easy usage:

### Cross-validation
- CVindices
- taketrainfold
- taketestfold
- folds

### Transform parameters
- `sigmoid` and `invsigmoid`
- `makepositive` and `invmakepositive`
- `transformbetween` and `invtransformbetween`

### Matrix related
- `addjitter` and `addjitter!`
- `makematrixsymmetric` and `makematrixsymmetric!`
- `woodbury_A_plus_UCV`
- `nearestposdef`

### Other
- `tasksleep`
- `safewrapper`
- `logrange`
- `bracket`
- `colourprint`
- `waitforkey`
- `plot_ellipse`
