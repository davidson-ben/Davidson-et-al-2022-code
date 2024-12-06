%% Figure 8 - Fibers by Beach
%
%
% Davidson, B.; Batista, K.; Samrah, S.; Rios Mendoza, L. M.; Pujara, N.
% Microplastic Contamination of Sediments across and within
%       Three Beaches in Western Lake Superior.
% Journal of Great Lakes Research 2022, 48 (6), 1563–1572.
% https://doi.org/10.1016/j.jglr.2022.09.011.

clear; close all; clc;

load figure8_data.mat

%% ANOVA (testing whether plastic concentrations on different beaches are different)

% pick p value threshold for significance
p_val_threshold = 0.05; 

% check whether data look to be reasonably approximated by normal
% distribution; does it follow the straight line within reason? if yes,
% carry on with anova
normplot(PlasticFibers_noRayon)

% run anova with beach and sample as independent variables, with an
% interaction term
[p0,~,stats0] = anovan(PlasticFibers_noRayon,{beach,sample},'model','interaction','varnames',{'beach','sample'});

% if the interaction term is not sigificant (high p value), re-run anova without interaction
[p0,~,stats0] = anovan(PlasticFibers_noRayon,{beach,sample},'varnames',{'beach','sample'});

% if one of the p values falls below our decided threshold, then check
% which data are different from each other by running multcompare
[results0,~,~,gnames0] = multcompare(stats0,'Dimension',[1],'Ctype','lsd'); 
% here we are running the comparison along the beach variable, hence dimension is 1
% in this example, we see that WIP has an average contamination that is
% lower than the other beaches, at the p < 0.05 statistical significance

% To illustrate this example, perhaps a good method is a box plot
allplastics_by_beach = [PlasticFibers_noRayon(1:9), PlasticFibers_noRayon(10:18), PlasticFibers_noRayon(19:27)];
% replace negative values with zero for plotting
allplastics_by_beach(allplastics_by_beach<0) = 0;
%subplot(2,1,1) %use for graphical abstract
h = boxplot(allplastics_by_beach,beach(1:9:end)','Orientation','horizontal');
xlabel('MP Fibers / kg Dry Sediment');
set(h,'LineWidth',2)
set(gca,'FontSize',22)