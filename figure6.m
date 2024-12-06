%% Figure 6 - Beach and Polymer
%
%
% Davidson, B.; Batista, K.; Samrah, S.; Rios Mendoza, L. M.; Pujara, N.
% Microplastic Contamination of Sediments across and within
%       Three Beaches in Western Lake Superior.
% Journal of Great Lakes Research 2022, 48 (6), 1563–1572.
% https://doi.org/10.1016/j.jglr.2022.09.011.

clear; close all; clc;
load figure6_data.mat
%% Plot Particles by shape
f = figure;
f.Position = [230 250 1021 577]

%WIP
first = 1;
last = 9;
Wbar = [(PlasticFibers_noRayon(first:last))'; (PlasticFragments_noCello(first:last))'; (PlasticFibers_withRayon(first:last)-PlasticFibers_noRayon(first:last))'; (PlasticFragments_withCello(first:last)-PlasticFragments_noCello(first:last))'];
Wbar(Wbar<0) = 0;
Wav = mean(Wbar,2)';

%MNP
first = 19;
last = 27;
Mbar = [(PlasticFibers_noRayon(first:last))'; (PlasticFragments_noCello(first:last))'; (PlasticFibers_withRayon(first:last)-PlasticFibers_noRayon(first:last))'; (PlasticFragments_withCello(first:last)-PlasticFragments_noCello(first:last))'];
Mbar(Mbar<0) = 0;
Mav = mean(Mbar,2)';


%THMN
first = 10;
last = 18;
Tbar = [(PlasticFibers_noRayon(first:last))'; (PlasticFragments_noCello(first:last))'; (PlasticFibers_withRayon(first:last)-PlasticFibers_noRayon(first:last))'; (PlasticFragments_withCello(first:last)-PlasticFragments_noCello(first:last))'];
Tbar(Tbar<0) = 0;
Tav = mean(Tbar,2)';

subplot(1,2,1)
bar([1 2 3],[Wav; Mav; Tav],'stacked')
legend({'Synthetic Fibers','Synthetic Fragments','Semi-synthetic Fibers','Semi-synthetic Fragments'},'Position',[0.3056 0.8388 0.2267 0.1412])
ylabel('particles / kg dry sediement')
xlabel('beach')
set(gca,'xtick',1:3,'xticklabel',{'WIP','MNP','THMN'})
%title('Average Concentration of Particles By Beach')
set(gca,'FontSize',18)

%% Fibers by type
fbs = {'PET','Modacrylic','PAN','PS','PP','Nylon'};
cts = [62 2 4 2 6 1];
tot_plastic_fbs = sum(cts);

subplot(1,2,2)
bar((cts/tot_plastic_fbs)*100)
ylabel('% Confirmed Plastic Fibers')
xlabel('Polymer')
set(gca,'xtick',[1:6],'xticklabel',fbs)
set(gca,'FontSize',18)

