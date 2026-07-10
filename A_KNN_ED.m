function w = A_KNN_ED(s)
% A_KNN_ED  Generate a zero-watermark from a vector point set using the
%           K-Nearest-Neighbour Euclidean-Distance feature proposed in the
%           accompanying manuscript. Implement Eq. (10)–(11).
%
%   w = A_KNN_ED(s) takes a shapefile structure s (as returned by
%   MATLAB's shaperead) whose geometry consists of 2D points, and
%   returns an int32 column vector w containing the binary watermark.
%
%   Dependency: GetPoints.m
%
%   This file is functionally identical to A_KNN_ED.mlx. The plain
%   .m version is provided so that the algorithm can be read directly
%   on GitHub and executed in MATLAB releases that do not support
%   Live Scripts.

    k = 3; % three nearest neighbours

    [x, y] = GetPoints(s);
    X = [x', y'];

    % [ids, ds] = knnsearch(X, X, 'K', k+1);
    [ids, ds] = knnsearch(KDTreeSearcher(X), X, 'K', k + 1);

    % drop the point itself (the first column of the kNN result)
    ids = ids(:, 2:end);
    ds  = ds(:,  2:end);
    assert(all(ds(:,1) <= ds(:,2)) && all(ds(:,2) <= ds(:,3)));

    % sort rows by the largest of the three distances, descending
    [~, order] = sortrows(ds, [-3 -2 -1]);
    ds  = ds(order, :);
    ids = ids(order, :);

    d1 = ds(:,1);
    d2 = ds(:,2);
    d3 = ds(:,3);

    w = int32(d2 > (d1 + d3) / 2);
end
