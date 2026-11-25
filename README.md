<h1 align="center">wmc to tcks</h1>

<p align="center">
  One <code>.tck</code> file per tract, extracted from a whole-brain or composite tractogram using the tract assignments in a white matter classification.
</p>

<p align="center">
  <a href="https://github.com/brainlife/abcd-spec"><img src="https://img.shields.io/badge/ABCD_Spec-v1.1-green.svg" alt="ABCD Spec v1.1"></a>
  <a href="https://doi.org/10.25663/brainlife.app.976"><img src="https://img.shields.io/badge/Brainlife-brainlife.app.976-blue.svg" alt="Run on brainlife.io"></a>
  <a href="LICENSE"><img src="https://img.shields.io/badge/License-MIT-lightgrey.svg" alt="MIT license"></a>
</p>

> **This branch, `mrtrix3-v1.0`, runs 2 brainlife.io Apps** that share the same code:
>
> - wmc to tcks ([doi:10.25663/brainlife.app.976](https://doi.org/10.25663/brainlife.app.976))
> - Extract multi-tcks from wmc + wbfg or composite tck ([doi:10.25663/brainlife.app.251](https://doi.org/10.25663/brainlife.app.251))
>
> The other Apps in this repository are listed under **Versions on brainlife.io** below.

## At a glance

<!-- brainlife-app:begin (generated from the App manifest; edit the manifest, not this block) -->

### wmc to tcks

> **Splits a whole-brain or composite tractogram into one .tck file per tract using the tract assignments in a white matter classification (wmc), with MRtrix3 connectome2tck.**

Converts the wmc classification into a streamline index list (DIPY container), then runs MRtrix3 connectome2tck to write each classified tract as its own .tck file named after the tract. Use it to obtain per-tract tractograms for visualisation or tract-wise analysis. The tck input must be the tractogram the classification was computed on, so that streamline indices match.

| | |
|---|---|
| **Inputs** | `neuro/wmc` · `neuro/track/tck` |
| **Outputs** | `neuro/tcks` |
| **Container** | `brainlife/dipy:1.4.1` |
| **Resources** | 4 CPUs · 30 GB memory · 1 h walltime |
| **Run it** | [doi.org/10.25663/brainlife.app.976](https://doi.org/10.25663/brainlife.app.976) |

#### Inputs

| Input | Datatype | Required | Description |
|---|---|---|---|
| `classification` | `neuro/wmc` | yes | White matter classification (wmc) assigning streamlines to named tracts. |
| `wbfg` | `neuro/track/tck` | yes | Whole-brain (or composite) tractogram the classification indexes into. Must be the tractogram used to generate the wmc classification. |

#### Outputs

| Output | Datatype | Description |
|---|---|---|
| `tcks` | `neuro/tcks` | Directory with one .tck tractogram per classified tract. |

### Extract multi-tcks from wmc + wbfg or composite tck

> **Splits a whole-brain or composite tractogram into one .tck file per tract using the tract assignments in a white matter classification (wmc), with MRtrix3 connectome2tck.**

Converts the wmc classification into a streamline index list (DIPY container), then runs MRtrix3 connectome2tck to write each classified tract as its own .tck file named after the tract. Use it to obtain per-tract tractograms for visualisation or tract-wise analysis. The tck input must be the tractogram the classification was computed on, so that streamline indices match.

| | |
|---|---|
| **Inputs** | `neuro/track/tck` · `neuro/wmc` |
| **Outputs** | `neuro/tcks` |
| **Container** | `brainlife/dipy:1.4.1` |
| **Resources** | 4 CPUs · 30 GB memory · 1 h walltime |
| **Run it** | [doi.org/10.25663/brainlife.app.251](https://doi.org/10.25663/brainlife.app.251) |

#### Inputs

| Input | Datatype | Required | Description |
|---|---|---|---|
| `wbfg` | `neuro/track/tck` | yes | Whole-brain (or composite) tractogram the classification indexes into. Must be the tractogram used to generate the wmc classification. |
| `classification` | `neuro/wmc` | yes | White matter classification (wmc) assigning streamlines to named tracts. |

#### Outputs

| Output | Datatype | Description |
|---|---|---|
| `tcks` | `neuro/tcks` | Directory with one .tck tractogram per classified tract. |

<!-- brainlife-app:end -->

## Versions on brainlife.io

Both Apps are built from the [`mrtrix3-v1.0`](https://github.com/brainlife/app-extractTCKfromWMC/tree/mrtrix3-v1.0) branch and run the same code.

| App | MRtrix3 | Branch | Run it | Status |
|---|---|---|---|---|
| **wmc to tcks** (this branch) | 3.0.3 | [`mrtrix3-v1.0`](https://github.com/brainlife/app-extractTCKfromWMC/tree/mrtrix3-v1.0) | [doi:10.25663/brainlife.app.976](https://doi.org/10.25663/brainlife.app.976) | current |
| **Extract multi-tcks from wmc + wbfg or composite tck** (this branch) | 3.0.3 | [`mrtrix3-v1.0`](https://github.com/brainlife/app-extractTCKfromWMC/tree/mrtrix3-v1.0) | [doi:10.25663/brainlife.app.251](https://doi.org/10.25663/brainlife.app.251) | current |

## How it works

The App takes an [input tractogram](https://brainlife.io/datatypes/5907d922436ee50ffde9c549), either a whole-brain fiber group (WBFG) or a composite of tracts, and the [White Matter Classification (WMC)](https://brainlife.io/datatype/5cc1d64c44947d8aea6b2d8b) that assigns its streamlines to tracts.

1. The tract names and the per-streamline tract index are read from `classification.mat` (Python, DIPY 1.4.1 container).
2. MRtrix3 `connectome2tck` writes the streamlines of each tract to its own `.tck` file, named after the tract.

It is meant to make per-tract tractograms easy to use for visualisation and for analyses outside brainlife.io.

> **Warning:** the tractogram must be the one the classification was computed on. A mismatched tractogram and WMC will usually cause an error, but if the mismatch cannot be detected (for example the streamline count matches but the streamline order has changed since the WMC was made) the output will be wrong without any error.

## Running the App

### On brainlife.io

Open the App at [doi.org/10.25663/brainlife.app.976](https://doi.org/10.25663/brainlife.app.976), choose a `neuro/track/tck` tractogram and the `neuro/wmc` classification computed on it, and press **Execute**. The per-tract tractograms are archived to your project as a [`neuro/tcks`](https://brainlife.io/datatypes/5dcf0047c4ae28d7f2298f48) dataset.

### Locally

You need [Singularity/Apptainer](https://apptainer.org/) and [`jq`](https://jqlang.github.io/jq/). `main` runs the steps in the `brainlife/dipy:1.4.1` and `brainlife/mrtrix3:3.0.3` containers.

1. Clone this repository and check out the App's branch: `git checkout mrtrix3-v1.0`.
2. Create `config.json` with the paths to your inputs:

   ```json
   {
       "track": "/input/track/track.tck",
       "classification": "/input/wmc/classification.mat"
   }
   ```

3. Run the App:

   ```bash
   ./main
   ```

## Outputs

```text
tcks/
├── <tract name>.tck    one tractogram per tract in the classification
└── …
```

## Troubleshooting

- **`something went wrong. check derivatives and logs`**: no `.tck` files were written to `tcks/`. Make sure the WMC classification was computed on the tractogram you provided.

## Citing

> [!TIP]
> If you use this App in your work, please cite the App, the software it builds on and brainlife.io (below). GitHub's **Cite this repository** button gives the App citation in APA and BibTeX.

- wmc to tcks. brainlife.io App. [doi:10.25663/brainlife.app.976](https://doi.org/10.25663/brainlife.app.976)
- Extract multi-tcks from wmc + wbfg or composite tck. brainlife.io App. [doi:10.25663/brainlife.app.251](https://doi.org/10.25663/brainlife.app.251)
- Tournier et al. MRtrix3: A fast, flexible and open software framework for medical image processing and visualisation. *NeuroImage* 202:116137 (2019). [doi:10.1016/j.neuroimage.2019.116137](https://doi.org/10.1016/j.neuroimage.2019.116137)
- Garyfallidis et al. Dipy, a library for the analysis of diffusion MRI data. *Frontiers in Neuroinformatics* 8 (2014). [doi:10.3389/fninf.2014.00008](https://doi.org/10.3389/fninf.2014.00008)
- Hayashi S, Caron BA, Heinsfeld AS, et al. brainlife.io: a decentralized and open-source cloud platform to support neuroscience research. *Nature Methods* 21:809–813 (2024). [doi:10.1038/s41592-024-02237-2](https://doi.org/10.1038/s41592-024-02237-2)
- Avesani P, McPherson B, Hayashi S, et al. The open diffusion data derivatives, brain data upcycling via integrated publishing of derivatives and reproducible open cloud services. *Scientific Data* 6:69 (2019). [doi:10.1038/s41597-019-0073-y](https://doi.org/10.1038/s41597-019-0073-y)

## Authors

- Franco Pestilli (project director)
- [Brad Caron](https://github.com/bacaron)
- [Daniel Bullock](https://github.com/DanNBullock)

**Contributors:** [Soichi Hayashi](https://github.com/soichih)

## Funding

[![Wellcome-226486/Z/22/Z](https://img.shields.io/badge/Wellcome-226486%2FZ%2F22%2FZ-purple.svg)](https://wellcome.org/)
[![NIH-NINDS-U24NS140384](https://img.shields.io/badge/NIH_NINDS-U24NS140384-green.svg)](https://reporter.nih.gov/project-details/11261037)
[![NIH-NINDS-UM1NS132207](https://img.shields.io/badge/NIH_NINDS-UM1NS132207-green.svg)](https://reporter.nih.gov/project-details/11411328)
[![NIH-NIBIB-R01EB029272](https://img.shields.io/badge/NIH_NIBIB-R01EB029272-green.svg)](https://reporter.nih.gov/project-details/10262925)
[![NIH-NIBIB-R01EB030896](https://img.shields.io/badge/NIH_NIBIB-R01EB030896-green.svg)](https://reporter.nih.gov/project-details/10428625)
[![NIH-NIMH-R01MH126699](https://img.shields.io/badge/NIH_NIMH-R01MH126699-green.svg)](https://reporter.nih.gov/project-details/10460628)
[![NIH-NIDCD-R01DC020088](https://img.shields.io/badge/NIH_NIDCD-R01DC020088-green.svg)](https://reporter.nih.gov/project-details/11140284)
[![NSF-BCS-1734853](https://img.shields.io/badge/NSF_BCS-1734853-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1734853)
[![NSF-BCS-2203524](https://img.shields.io/badge/NSF_BCS-2203524-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2203524)
[![NSF-IIS-1636893](https://img.shields.io/badge/NSF_IIS-1636893-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1636893)
[![NSF-OAC-2148729](https://img.shields.io/badge/NSF_OAC-2148729-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2148729)
[![NSF-IIS-1912270](https://img.shields.io/badge/NSF_IIS-1912270-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1912270)
[![NSF-IIS-2148700](https://img.shields.io/badge/NSF_IIS-2148700-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2148700)
[![NSF-OAC-1916518](https://img.shields.io/badge/NSF_OAC-1916518-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1916518)

<sub>brainlife.io is publicly funded, and acknowledging that support helps keep it running. This App was developed with support from Wellcome, the U.S. National Institutes of Health (including the BRAIN Initiative BRAIN CONNECTS program: The Axonal Projectome EXchange, U24NS140384, and the Center for Mesoscale Connectomics, UM1NS132207) and the U.S. National Science Foundation.</sub>

## License

[MIT](LICENSE). MRtrix3 is distributed under its own [license](https://www.mrtrix.org/).
