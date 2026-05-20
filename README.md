# A_KNN_ED — K-Nearest-Neighbour Euclidean-Distance Zero-Watermarking

Reference MATLAB implementation of the zero-watermarking algorithm
proposed in the manuscript

> *(paper title to be added on acceptance)*

The algorithm constructs a binary zero-watermark from the geometric
relationships among a vector point set's K nearest neighbours, using
the relative magnitudes of the three nearest Euclidean distances.
Only the proposed algorithm is released here; the comparison methods
and the auxiliary experimental scripts used in the paper are kept in
a separate working repository.

## Repository contents

| File / Folder                  | Description                                                                |
| ------------------------------ | -------------------------------------------------------------------------- |
| `A_KNN_ED.m`                   | The proposed algorithm                                                     |
| `GetPoints.m`                  | Extracts coordinate arrays from a shapefile struct                         |
| `getsim2.m`                    | Edit-distance based similarity used by the manuscript                      |
| `FtDeleteByStorageRandom.m`    | Random deletion attack on a point feature set                              |
| `FtAddByStorageRandom.m`       | Random addition attack on a point feature set                              |
| `Demo.m`                       | Minimal example: load `data-poi`, run the algorithm, print the watermark   |
| `Demo_Uniqueness.m`            | Uniqueness experiment over 100 independent point sets in `data-random/`    |
| `Demo_Robustness.m`            | Robustness experiment: deletion and addition attacks on `data-poi/a.shp`   |
| `data-poi/`                    | Original point shapefile used as the watermark carrier                     |
| `data-random/`                 | 100 independently generated point sets used **only** for the uniqueness test |

## Requirements

* MATLAB R2021a or newer (tested on R2024a)
* Mapping Toolbox &nbsp;&nbsp;— for `shaperead`
* Statistics and Machine Learning Toolbox &nbsp;&nbsp;— for `knnsearch` and `KDTreeSearcher`
* Text Analytics Toolbox &nbsp;&nbsp;— for `editDistance` (used inside `getsim2.m`)
* Any desktop / laptop with Windows, macOS or Linux; no GPU required

## Quick start

Clone the repository, open MATLAB, `cd` to the repository folder, then run:

```matlab
>> Demo               % single-shapefile watermark generation
>> Demo_Uniqueness    % pairwise similarity across 100 independent datasets
>> Demo_Robustness    % deletion and addition robustness on data-poi/a.shp
```

## Using the algorithm in your own code

```matlab
s = shaperead('your_points.shp');
w = A_KNN_ED(s);     % w is an int32 binary watermark
```

## Citation

If this code helps your research, please cite the accompanying
manuscript (full bibliographic information will be added upon
publication).

## Contact

Open a GitHub issue, or contact the corresponding author by email.
