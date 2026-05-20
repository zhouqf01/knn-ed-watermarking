%% Demo_Uniqueness.m
% Uniqueness experiment for the proposed algorithm (Section X.X of the
% manuscript). The 100 independently generated point sets in
% ./data-random/ are processed by A_KNN_ED, yielding 100 zero-watermarks.
% All C(100,2) = 4950 pairwise similarities are computed with getsim2
% and summarised; a histogram is plotted at the end.
%
% A well-behaved zero-watermark should produce low pairwise similarity
% values among unrelated data sets — i.e. the watermarks are unique.
%
% Usage:
%   >> Demo_Uniqueness

clear; clc;

n = 100;                 % number of random point sets in ./data-random
warr = cell(1, n);       % cell array of watermarks

fprintf('Generating %d watermarks ...\n', n);
for i = 1:n
    fn = fullfile('data-random', sprintf('a%d.shp', i));
    s  = shaperead(fn);
    warr{i} = A_KNN_ED(s);
    if mod(i, 10) == 0
        fprintf('  %3d / %d done\n', i, n);
    end
end

% all unordered pairs (i, j) with i < j
combIdx = nchoosek(1:n, 2);
ncmb    = size(combIdx, 1);

ncarr = zeros(1, ncmb);
fprintf('Computing %d pairwise similarities ...\n', ncmb);
for k = 1:ncmb
    ncarr(k) = getsim2(warr{combIdx(k,1)}, warr{combIdx(k,2)});
end

fprintf('\n--- Uniqueness summary (n=%d, pairs=%d) ---\n', n, ncmb);
fprintf('min    Sim : %.4f\n', min(ncarr));
fprintf('mean   Sim : %.4f\n', mean(ncarr));
fprintf('median Sim : %.4f\n', median(ncarr));
fprintf('max    Sim : %.4f\n', max(ncarr));

figure;
histogram(ncarr, 0:0.0025:1, 'FaceColor', [0.75 0 0.75], 'EdgeColor', 'w');
xline(0.75, '--r', '\tau = 0.75', 'LineWidth', 1.5);
xlabel('Sim'); ylabel('Count');
title(sprintf('Pairwise similarity of %d watermarks (%d pairs)', n, ncmb));
xlim([0.6, 0.8]);
set(gca, 'FontName', 'Times New Roman', 'FontSize', 12);
