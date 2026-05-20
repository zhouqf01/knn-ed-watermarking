function s2 = FtAddByStorageRandom(s, ratio, seed)
% FtAddByStorageRandom  Addition attack on a point feature set.
%
%   s2 = FtAddByStorageRandom(s, ratio, seed) adds round(ratio*n) new
%   features whose coordinates are drawn uniformly at random from the
%   axis-aligned bounding box of the original n features, then appends
%   them at the end of the structure array. The optional seed controls
%   reproducibility (default 0).

    arguments
        s
        ratio
        seed uint32 = 0
    end

    s2   = s;
    n    = numel(s);
    nadd = round(ratio * n);

    if nadd == 0
        return;
    end

    [x, y] = GetPoints(s);
    xmin = min(x); xmax = max(x);
    ymin = min(y); ymax = max(y);

    rng(seed);
    xnew = xmin + (xmax - xmin) * rand(nadd, 1);
    ynew = ymin + (ymax - ymin) * rand(nadd, 1);

    snew = repmat(s(1), nadd, 1);
    for i = 1:nadd
        snew(i).X = xnew(i);
        snew(i).Y = ynew(i);
    end

    s2 = [s2; snew];
end
