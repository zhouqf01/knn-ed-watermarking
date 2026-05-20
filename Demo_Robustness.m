%% Demo_Robustness.m
% Robustness experiment for the proposed algorithm under two attacks:
%   - Random deletion of a fraction of points
%   - Random addition of a fraction of points (uniformly inside the
%     bounding box of the original point set)
%
% The original point set is loaded from ./data-poi/a.shp, the
% zero-watermark w0 is generated, then for each attack ratio the
% attacked set is built, its watermark w1 is generated, and the
% similarity getsim2(w0, w1) is reported.
%
% Usage:
%   >> Demo_Robustness

clear; clc;

fprintf('Loading original point set from ./data-poi/a.shp ...\n');
s0 = shaperead(fullfile('data-poi', 'a.shp'));

fprintf('Generating reference watermark w0 ...\n');
w0 = A_KNN_ED(s0);
fprintf('  reference watermark length = %d bits\n\n', numel(w0));

%% 1. Deletion attack
DelRatio  = 0:1:10;       % percent
delSeed   = 2;
simDel    = zeros(size(DelRatio));

fprintf('--- Deletion attack ---\n');
for k = 1:numel(DelRatio)
    s_att     = FtDeleteByStorageRandom(s0, DelRatio(k)/100, delSeed);
    w_att     = A_KNN_ED(s_att);
    simDel(k) = getsim2(w0, w_att);
    fprintf('  ratio = %2d%%   Sim = %.4f\n', DelRatio(k), simDel(k));
end

%% 2. Addition attack
AddRatio  = 0:1:10;       % percent
addSeed   = 2;
simAdd    = zeros(size(AddRatio));

fprintf('\n--- Addition attack ---\n');
for k = 1:numel(AddRatio)
    s_att     = FtAddByStorageRandom(s0, AddRatio(k)/100, addSeed);
    w_att     = A_KNN_ED(s_att);
    simAdd(k) = getsim2(w0, w_att);
    fprintf('  ratio = %2d%%   Sim = %.4f\n', AddRatio(k), simAdd(k));
end
