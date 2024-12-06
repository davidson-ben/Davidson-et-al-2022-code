%% Figure 9 - Surface/Subsurface and Wrack/Swash
%
%
% Davidson, B.; Batista, K.; Samrah, S.; Rios Mendoza, L. M.; Pujara, N.
% Microplastic Contamination of Sediments across and within
%       Three Beaches in Western Lake Superior.
% Journal of Great Lakes Research 2022, 48 (6), 1563–1572.
% https://doi.org/10.1016/j.jglr.2022.09.011.
clear; close all; clc;
load figure9_data.mat

%% testing whether the surface wrack and subsurface wrack paired data have significantly different means and variances

% pick which variable to run stats on
%variable_to_test = PlasticFibers_noRayon;
wrack_surface = surfacewrack_allfibers;%wrack surface
wrack_core = corewrack_comp_allfibers;%wrack core compensated
var_diff = wrack_surface-wrack_core;

% illustrate with box plot
surface_core_comparison_plot = [wrack_surface, wrack_core];
surface_core_comparison_plot(surface_core_comparison_plot<0) = 0;
boxplot(surface_core_comparison_plot,categorical({'surface wrack','core wrack'}));

% pick p value threshold for significance
p_val_threshold = 0.05; 

% check whether data look to be reasonably approximated by normal
% distribution; does it follow the straight line within reason? if yes,
% carry on with anova
normplot(var_diff)

% run t-test
[h,p] = ttest(var_diff)
% the data suggest there is no difference between the average plastic
% concentration on the surface and beneath the surface at the wrack line --
% interesting!

% run f-test
[h, p] = vartest2(wrack_surface,wrack_core)


% while the mean plastics concentration in the surface vs. under the
% surface is not statistically different across any and all beaches, the
% variance in plastics concentration is much higher under the surface in a
% statistically significant sense for all beaches (p < 0.05) and in a
% substantial sense for the polluted beach (p = 0.1, MNP and THMN)
figure
subplot(1,2,1)
h = boxplot(surface_core_comparison_plot,categorical({'surface','subsurface'}),'Orientation','horizontal');
set(h,'LineWidth',2)
xlabel('MP Fibers / kg Dry Sediment')
set(gca,'FontSize',18)
xlim([-10 290])


%% testing whether the core wrack and core swash paired data have significantly different means and variances
A = corewrack_allfibers;
B = coreswash_allfibers;
AB_differences = A - B;

% pick which variable to run stats on
variable_to_test = AB_differences;

% illustrate with box plot
surface_core_comparison_plot = [A, B];
surface_core_comparison_plot(surface_core_comparison_plot<0) = 0;
subplot(1,2,2)
boxplot(surface_core_comparison_plot,categorical({'Core Wrack','Core Swash'}));

% pick p value threshold for significance
p_val_threshold = 0.05; 

% check whether data look to be reasonably approximated by normal
% distribution; does it follow the straight line within reason? if yes,
% carry on with anova

normplot(variable_to_test)

% run t-test
[h,p] = ttest(variable_to_test)
% the data suggest there is no difference between the average plastic
% concentration on the surface and beneath the surface at the wrack line --
% interesting!

% run f-test
[h, p] = vartest2(A,B)


% while the mean plastics concentration in the surface vs. under the
% surface is not statistically different across any and all beaches, the
% variance in plastics concentration is much higher under the surface in a
% statistically significant sense for all beaches (p < 0.05) and in a
% substantial sense for the polluted beach (p = 0.1, MNP and THMN)

h = boxplot(surface_core_comparison_plot,categorical({'Core Wrack','Core Swash'}),'Orientation','horizontal');
set(h,'LineWidth',2)
xlabel('MP Fibers / kg Dry Sediment')
set(gca,'FontSize',18)