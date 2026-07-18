%% Demo.m
% Minimal demonstration of the proposed K-Nearest-Neighbour
% Euclidean-Distance zero-watermarking algorithm (A_KNN_ED).
%
% Loads the sample point shapefile in ./data-sample, generates the
% zero-watermark with the proposed algorithm, and prints its length
% and the first 32 bits.
%
% Usage:
%   Open MATLAB, set this folder as the current directory, then run:
%       >> Demo
%
% See also: Demo_Uniqueness, Demo_Robustness

clear; clc;

fprintf('Loading point set from ./data-sample/a.shp ...\n');
s = shaperead(fullfile('data-sample', 'a.shp'));

fprintf('Generating zero-watermark with A_KNN_ED ...\n');
w = A_KNN_ED(s);

fprintf('\nWatermark length : %d bits\n', numel(w));
fprintf('First 32 bits    : %s\n', sprintf('%d', w(1:min(32, end))));
