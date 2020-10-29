[![Abcdspec-compliant](https://img.shields.io/badge/ABCD_Spec-v1.1-green.svg)](https://github.com/soichih/abcd-spec)
[![Run on Brainlife.io](https://img.shields.io/badge/Brainlife-bl.app.251-blue.svg)](https://doi.org/10.25663/brainlife.app.251)

# app-extractTCKfromWMC
This application takes an [input tractography amalgum](https://brainlife.io/datatypes/5907d922436ee50ffde9c549) (i.e. whole brain fiber group (WBFG) or composite) and, using the categories designated in the associated [White Matter Classification (WMC) structure](https://brainlife.io/datatype/5cc1d64c44947d8aea6b2d8b) input, extracts and outputs a tck file for each category into the output directory. Intended to facilitate users performing analyses offline/outside of the brainlife platform.

WARNING: Submitting mismatched input TCK and WMC (e.g the WMC does not correspond to the TCK) will likely result in an error. However, in certian cases, this senario may also result in garbage output.  This would happen in the event that the mismatch cannot be inferred by the checks implemented by the code (i.e. matching streamline numbers).  This could also happen in the case that the order of the streamlines in the TCK has changed since the WMC was generated.

### Authors
- [Daniel Bullock](https://github.com/DanNBullock) (dnbulloc@iu.edu)

### Contributors
- [Soichi Hayashi](https://github.com/soichih) (hayashis@iu.edu)

### Project Director
- [Franco Pestilli](https://github.com/francopestilli) (franpest@indiana.edu)


### Funding
[![NSF-BCS-1734853](https://img.shields.io/badge/NSF_BCS-1734853-blue.svg)](https://nsf.gov/awardsearch/showAward?AWD_ID=1734853)
[![NSF-BCS-1636893](https://img.shields.io/badge/NSF_BCS-1636893-blue.svg)](https://nsf.gov/awardsearch/showAward?AWD_ID=1636893)
[![NIMH-T32-5T32MH103213-05](https://img.shields.io/badge/NIMH_T32-5T32MH103213--05-blue.svg)](https://projectreporter.nih.gov/project_info_description.cfm?aid=9725739)

## Running the App 

### Inputs
- a [track/tck](https://brainlife.io/datatypes/5907d922436ee50ffde9c549) input - this is the tractogram to which the associated [White Matter Classification (WMC) structure](https://brainlife.io/datatype/5cc1d64c44947d8aea6b2d8b) corresponds.
- a [White Matter Classification (WMC) structure](https://brainlife.io/datatype/5cc1d64c44947d8aea6b2d8b) - Each of the identified anatomical structures (presumptave tracts) in the input [White Matter Classification (WMC) structure](https://brainlife.io/datatype/5cc1d64c44947d8aea6b2d8b) will have a Tck generated for the [output product](https://brainlife.io/datatypes/5dcf0047c4ae28d7f2298f48)

### On Brainlife.io

You can submit this App online at [https://doi.org/10.25663/brainlife.app.251](https://https://doi.org/10.25663/brainlife.app.251) via the "Execute" tab.

### Running Locally (on your machine)

1. git clone this repo.
2. Inside the cloned directory, create `config.json` with something like the following content with paths to your input files.

```json
{
	"track": "path/to/tck/associated/with/classification/tck.tck",
	"classification": "path/to/classification.mat",
}
```

### Sample Datasets

You can download sample datasets from Brainlife using [Brainlife CLI](https://github.com/brain-life/cli).

```
npm install -g brainlife
bl login
mkdir input

tck classification example data needed

```


3. Launch the App by executing `main`

```bash
./main
```

## Output

-  [Tcks](https://brainlife.io/datatypes/5dcf0047c4ae28d7f2298f48) - collection of Tck files (one per classification item) with json file describing each Tck file.

#### Product.json
The secondary output of this app is `product.json` and contains various descriptors of the tracts.

### Dependencies

This App requires the following libraries when run locally.

  - singularity: https://singularity.lbl.gov/
  - VISTASOFT: https://github.com/vistalab/vistasoft/
  - ENCODE: https://github.com/brain-life/encode
  - SPM 8 or 12: https://www.fil.ion.ucl.ac.uk/spm/software/spm8/
  - WMA: https://github.com/DanNBullock/wma_tools/tree/master
  - jsonlab: https://github.com/fangq/jsonlab.git
