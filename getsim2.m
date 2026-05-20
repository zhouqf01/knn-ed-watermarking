function sim = getsim2(w1, w2)
% getsim2  Edit-distance-based similarity between two binary watermarks.
%
%   sim = getsim2(w1, w2) treats each watermark as a string of '0'/'1'
%   characters and returns
%       sim = 1 - editDistance / max(length(w1), length(w2))
%   so that sim is in [0, 1] with 1 = identical.
%
%   Used as the similarity metric for both the uniqueness experiment and
%   the robustness experiment in the manuscript.

    ed  = editDistance(int2str(w1)', int2str(w2)');
    sim = 1 - ed / max(numel(w1), numel(w2));
end
