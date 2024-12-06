%% Figure 7 - Morphology
%
%
% Davidson, B.; Batista, K.; Samrah, S.; Rios Mendoza, L. M.; Pujara, N.
% Microplastic Contamination of Sediments across and within
%       Three Beaches in Western Lake Superior.
% Journal of Great Lakes Research 2022, 48 (6), 1563–1572.
% https://doi.org/10.1016/j.jglr.2022.09.011.
clear; close all; clc;

load figure7_data.mat

%% Test whether fibers dominate over non-fibers
A = PlasticFibers_noRayon;
B = PlasticFragments_noCello;
AB_differences = A - B;

% pick which variable to run stats on
variable_to_test = AB_differences;

% illustrate with box plot
surface_core_comparison_plot = [A, B];
surface_core_comparison_plot(surface_core_comparison_plot<0) = 0;
figure
h = boxplot(surface_core_comparison_plot,categorical({'Fibers','Fragments'}));
ylabel({'MP Particles / kg Dry Sediment'})
set(h,'LineWidth',2)
set(gca,'FontSize',18)


% pick p value threshold for significance
p_val_threshold = 0.05; 

% check whether data look to be reasonably approximated by normal
% distribution; does it follow the straight line within reason? if yes,
% carry on with anova
figure
normplot(variable_to_test)

% run t-test
[h,p] = ttest(variable_to_test) %null hypothesis, mean is zero
% the data suggest there is a difference between the average plastic
% concentration of fibers and fragments --
% interesting!

% run f-test
[h, p] = vartest2(A,B)
