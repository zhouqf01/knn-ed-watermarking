function s2 = FtDeleteByStorageRandom(s, ratio, seed)
% FtDeleteByStorageRandom  Deletion attack on a point feature set.
%
%   s2 = FtDeleteByStorageRandom(s, ratio, seed) removes round(ratio*n)
%   features chosen uniformly at random from the n features of s. The
%   pseudo-random selection is reproducible through the optional seed
%   (default 0).

    arguments
        s
        ratio
        seed uint32 = 0
    end

    s2   = s;
    n    = numel(s);
    ndel = round(ratio * n);

    rng(seed);
    idxdel = randperm(n, ndel);
    s2(idxdel) = [];
end
