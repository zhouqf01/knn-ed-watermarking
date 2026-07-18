# Zero Watermarking for Vector Geographic Point Data Based on K-NN and Edit Distance

Zero watermarking plays a critical role in the copyright protection of vector geographic data because it does not distort the original data. However, extracting stable features from point data remains a challenging problem due to its structural simplicity compared with polylines and polygons. Existing methods rely on partitioning the point set into spatial groups and deriving watermark bits from group-level statistics. Such partition-dependent approaches are vulnerable to vertex deletion and insertion attacks because these attacks disrupt the partition structure. To address this issue, a zero watermarking method based on K-nearest neighbors (K-NN) and edit distance is proposed. For each point, its three nearest neighbors are retrieved and the relative magnitude among the sorted distances is quantified into a binary digit. The digits of all points are arranged by the third-nearest distance to form the watermark sequence. Edit distance is employed as the similarity metric for watermark detection, naturally accommodating the variable-length watermarks caused by deletion and insertion attacks. Experiments show that the proposed method achieves a similarity of 1.00 under rotation, uniform scaling, and translation attacks. Under vertex deletion up to 7% and insertion up to 9%, the similarity remains above the 0.75 threshold, outperforming existing partition-based methods under identical conditions. The uniqueness of the watermark is also verified through pairwise comparison of 100 randomly generated datasets.

## Repository contents

| File / Folder                  | Description                                                                |
| ------------------------------ | -------------------------------------------------------------------------- |
| `A_KNN_ED.m`                   | The proposed algorithm                                                     |
| `GetPoints.m`                  | Extracts coordinate arrays from a shapefile struct                         |
| `getsim2.m`                    | Edit-distance based similarity used by the manuscript                      |
| `FtDeleteByStorageRandom.m`    | Random deletion attack on a point feature set                              |
| `FtAddByStorageRandom.m`       | Random addition attack on a point feature set                              |
| `Demo.m`                       | Minimal example: load `data-sample`, run the algorithm, print the watermark   |
| `Demo_Uniqueness.m`            | Uniqueness experiment over 100 independent point sets in `data-random/`    |
| `Demo_Robustness.m`            | Robustness experiment: deletion and addition attacks on `data-sample/a.shp`   |
| `data-sample/`                    | Original point shapefile used as the watermark carrier                     |
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
>> Demo_Robustness    % deletion and addition robustness on data-sample/a.shp
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
