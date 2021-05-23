# *Data Repository* <br/>Melanopic limits of metamer spectral optimisation in multi-channel smart lighting systems

<div align="center">
  <a href="https://www.mdpi.com/1996-1073/14/3/527" alt="Published">
        <img src="https://img.shields.io/badge/MDPI%20Energies-Published-green"/></a>
 <a href="https://doi.org/10.3390/en14030527" alt="DOI">
        <img src="https://img.shields.io/badge/DOI-10.3390%2Fen14030525-blue"/></a>
 <a href="http://creativecommons.org/licenses/by/4.0/" alt="CC BY 4.0">
        <img src="https://img.shields.io/badge/License-CC%20BY%204.0-lightgrey"/></a>
</div>

This reporsitory provides over 1.2 million optimised multi-channel LED metamer spetra presented in the article *"Melanopic limits of metamer spectral optimisation in multi-channel smart lighting systems"* authored by [Babak Zandi](https://www.lichttechnik.tu-darmstadt.de/fachgebiet_lichttechnik_lt/team_lt/mitarbeiter_lt_detail_65600.en.jsp), Adrian Eissfeldt, Alexander Herzog and Trand Quoc Khanh. <br/>

-----
<div align="center">
<a style="font-weight:bold" href="https://www.mdpi.com/1996-1073/14/3/527">[Paper]</a>
<a style="font-weight:bold" href="https://www.mdpi.com/1996-1073/14/3/527/s1">[Supplementary materials]</a>
</div>
-----

**Correspondence:** zandi@lichttechnik.tu-darmstadt.de<br/>
**Google Scholar Profile:** [Babak Zandi](https://scholar.google.de/citations?user=LSA7SdAAAAAJ&hl=de)<br/>
**Twitter:** [@BkZandi](https://twitter.com/bkzandi)

## Overview

We have used  561 chromaticity coordinates as optimisation targets which were located along the Planckian locus between 2700 K and 7443 K. The targets were selected with Duv's between -0.048 to +0.048 from Planck (see Figure). Spectra were generated using a 6-channel, 8-channel and 11-channel luminaire each with different LED combinations. The spectra were optimised at a luminance of 140 cd/m<sup>2</sup>, 180 cd/m<sup>2</sup> and 220 cd/m<sup>2</sup>, respectively. At low CCTs, the chromaticity targets were outside of the colour space; therefore, no optimisation results are available for these points. 

<p align="center">
  <img src="img/Figures_Publication/PNG/Figure_2.png">
</p>

In this repository, we provide the raw spectra data of our optimisation procedure. Additionally, a demo script is available that reproduces the figures and reported values from the paper using the optimised spectra. The plots and sketches from the publication are available as high-resolution files in this repository as well:

- Figure 1 - PNG:  [`img/Figures_Publication/PNG/Figure_1`](img/Figures_Publication/PNG/Figure_1.png), PDF: [`img/Figures_Publication/PDF/Figure_1`](img/Figures_Publication/PDF/Figure_1.pdf)
- Figure 2 - PNG:  [`img/Figures_Publication/PNG/Figure_2`](img/Figures_Publication/PNG/Figure_2.png), PDF: [`img/Figures_Publication/PDF/Figure_2`](img/Figures_Publication/PDF/Figure_2.pdf)
- Figure 3 - PNG:  [`img/Figures_Publication/PNG/Figure_3`](img/Figures_Publication/PNG/Figure_3.png), PDF: [`img/Figures_Publication/PDF/Figure_3`](img/Figures_Publication/PDF/Figure_3.pdf)
- Figure 4 - PNG:  [`img/Figures_Publication/PNG/Figure_4`](img/Figures_Publication/PNG/Figure_4.png), PDF: [`img/Figures_Publication/PDF/Figure_4`](img/Figures_Publication/PDF/Figure_4.pdf)

## Database of Multi-Channel LED Metamer Spectra

The spectral database is divided into three individual files each containing the spectra from the  6-channel, 8-channel and 11-channel luminaire. The use of a certain number of LED channels does not mean that all spectra were generated with a constant channel count. For instance, there may be spectra in the 6-channel data set that were generated with three or four channels. The labeling of the channel count of a luminaire defines the upper limit of available channels for generating the spectra for reaching a target chromaticity point. The special feature of the database is that for each chromaticity coordinate a large number of metamer spectra is included,  allowing a systematic investigation of contrast values at a given constant chromaticity coordinate. 

**Spectral raw database of the 6-channel LED luminaire:** [Download-Link (646 695 spectra, 1.9 GB)](https://bit.ly/3sxYUhu-CH6-Spectra)

**Spectral raw database of the 8-channel LED luminaire:** [Download-Link (306 429 spectra, 1.2 GB)](http://bit.ly/3nRx6RF-CH8-Spectra)

**Spectral raw database of the 11-channel LED luminaire:** [Download-Link (113 719 spectra, 452.1 MB)](http://bit.ly/38RCrUF-CH11-Spectra)

The table with the used chromaticity targets with which the optimisation was carried out can be found here in the GitHub repository in the CSV file [`A00_Data/01_Compact_Optim Results/Optimisation_Targets.csv`](A00_Data/01_Compact_Optim Results/Optimisation_Targets.csv). The table contains the following columns:

**Column 1 -** `IndexNumberTarget`: Continuous number that identifies the index of the optimisation target. A total of 561 optimisation targets were used.

**Column 2 -** `CCT_Target`: The CCT of the chromaticity target.

**Column 3 -** `Duv_Target`: Duv from Planck in absolut units.

**Column 4 -** `Duv_signed`: Duv from Planck.

**Column 5 & 6 -** `CIEu1960_Target` and `CIEv1960_Target`: CIEuv chromaticity targets

**Column 7 & 8-** `CIEu1976_Target` and `CIEv1976_Target`: CIEu'v' chromaticity targets for optimising the spectra.

The spectral raw dara data are in tidy format in a CSV file in which the respective target chromaticity coordinates and target luminances are given. The columns of the CSV file are listed and described below:

 **Column 1 -** `IndexNumber_Target`: Continuous number that identifies the index of the optimisation target. A total of 561 optimisation targets were used. The index number matches with the file [`A00_Data/01_Compact_Optim Results/Optimisation_Targets.csv`](A00_Data/01_Compact_Optim Results/Optimisation_Targets.csv)

**Column 2 -** `ChannelCount_Luminaire`: Upper limit of the luminaire's channel count.

**Column 3 -** `OptimCounter`: The optimisation was performed in a loop to obtain as many spectra for a given chromaticity target as possible. This index defines from which optimisation round the respective optimised spectrum originates. If the same number appears repeatedly, it means that several spectra were found in one optimisation round. The number is not continuous, as it is also possible that no spectra were found in an optimisation round. The counter must be considered in relation to the `IndexNumber_Target`, because with a new optimisation target the counter started from 0.

**Column 4 -** `CCT_Target`: The CCT of the chromaticity target.

**Column 5 -** `Duv_Target`: The target Duv from Planck in absolut units.

**Column 6 -** `Luminance_Target`: The target luminance of the optimised spectra in cd/m<sup>2</sup>. The optimisation was carried out for three luminance levels.

**Column 7 & 8 -** `u1976_Target` and `v1976_Target`: CIEu'v' target coordinates for optimisation.

**Column 9 -** `Luminance_Actual`: The actual luminance calculated from the optimised spectrum.

**Column 10 & 11 -** `u1976_Actual` and `v1976_Actual`: The actual CIEu'v' coordinates calculated from the optimised spectrum.

**Column 12 -** `MelanopicRadiance_Actual`: The actual melanopic radiance W/m<sup>2</sup>sr calculated from the optimised spectrum.

**Column 13 & 14 -** `CIEx2Degree_Actual` and `CIEy2Degree_Actual`: The actual CIExy-2° coordinates calculated from the CIEu'v' coordinates.

**Column 15 -** `LuminanceDifference_TargetTOActucal`: The difference between the specified target luminance and the actual luminance. In the optimisation, the difference was restricted to 1 cd/m<sup>2</sup>.

**Column 16 & 17 -** `u1976_Difference_TargetTOActural` and `v1976_Difference_TargetTOActural`: The difference between the specified target CIEu'v' coordinates and the actual CIEu'v' coordinates. 

**Column 18 -** `OptimResult_Number`:  Since several spectra could be found in an optimisation round, this index indicates the number of spectra found in an optimisation round.

**Column 19 to 419 -** `x380Nm`, `x381Nm`, `....`, `x780Nm`: The optimised spectrum which is stated in radiance W/m<sup>2</sup>sr nm 

## Demo Code

The raw data of the optimisation must be downloaded externally from the links, as the size exceeds the absolute allowed limit of a GitHub repository. In addition, we have also uploaded the processed optimisation data directly here in the repository, but without the spectra columns `x380Nm`, `x381Nm`, `....`, `x780Nm`. These processed optimisation results have the same column labels as the raw spectral data. The processed optimisation results are located in the folder [`A00_Data/01_Compact_Optim Results`](A00_Data/01_Compact_Optim Results). We provide a Matlab script [`Main.m`](Main.m) with demo code for reproducing the plots from our paper and give an example of how the data can be analysed.

The following code snippet can be used in Matlab to load the preprocessed optimisation results:

```matlab
%% Load optimization results into matlab
% Data of 6 channel optimization
Optim_CH6_L140 = readtable("A00_Data/01_Compact_Optim Results/OptimResults_CH6_L140.csv");
Optim_CH6_L180 = readtable("A00_Data/01_Compact_Optim Results/OptimResults_CH6_L180.csv");
Optim_CH6_L220 = readtable("A00_Data/01_Compact_Optim Results/OptimResults_CH6_L220.csv");

% Data of 8 channel optimization
Optim_CH8_L140 = readtable("A00_Data/01_Compact_Optim Results/OptimResults_CH8_L140.csv");
Optim_CH8_L180 = readtable("A00_Data/01_Compact_Optim Results/OptimResults_CH8_L180.csv");
Optim_CH8_L220 = readtable("A00_Data/01_Compact_Optim Results/OptimResults_CH8_L220.csv");

% Data of 11 channel optimization
Optim_CH11_L140 = readtable("A00_Data/01_Compact_Optim Results/OptimResults_CH11_L140.csv");
Optim_CH11_L180 = readtable("A00_Data/01_Compact_Optim Results/OptimResults_CH11_L180.csv");
Optim_CH11_L220 = readtable("A00_Data/01_Compact_Optim Results/OptimResults_CH11_L220.csv");

% Load in optimisation targets
OptimisationTargets = readtable("A00_Data/01_Compact_Optim Results/Optimisation_Targets.csv");
```

To answer the question of how many optimisation results were found for each chromaticity target, the following code snipped can be used. Here, the stated number of optimisation results are broken down for each luminaire configuration (6-channel, 8-channel, 11-channel) and luminance target (140 cd/m<sup>2</sup>, 180 cd/m<sup>2</sup>, 220 cd/m<sup>2</sup>).

```matlab
%% Table S1 (supplementary materials) - Descriptive Values of the optimisation data
% The folowing optimisation targets were used
% CCT: 2700, 2796, 2901, 3017, 3147, 3292, 3456, 3642, 3855, 4101
%      4386, 4717, 5102, 5552, 6080, 6702, 7443

% For each CCT the following \pm Duv targets were used:
% DUV: 0, 0.003, 0.006, 0.009, 0.012, 0.015, 0.018,
%      0.021, 0.024, 0.027, 0.03, 0.033, 0.036, 0.039, 0.042,
%      0.045, 0.048

% How many optimisation targets were found ?
% Number of optimisation result for each CCT-Target and Duv-Target

format long

% 6 Channel -----------------------------------------------------------------------
[G, TargetGroups] = findgroups(categorical(Optim_CH6_L140.IndexNumber_Target));
CountResults = splitapply(@(x) max(x), Optim_CH6_L140.OptimResult_Number, G);
CH6_L140 = ['Mean spectra count each target ' num2str(mean(CountResults)) ' SD ' num2str(std(CountResults)) ' Total ' num2str(sum(CountResults))];
CountOptim_CH6_L140 = sum(CountResults);
fprintf('6-Channel Luminance 140 cd/m2: Solutions found for %d of 561 optimisation targets. Mean spectra count for each optimisation target is %.2f SD %.2f - Total: %d \n',...
    size(categories(categorical(Optim_CH6_L140.IndexNumber_Target)),1), mean(CountResults), std(CountResults), CountOptim_CH6_L140);
Table_S2_CH6_140 = table(6, 140, size(categories(categorical(Optim_CH6_L140.IndexNumber_Target)),1), mean(CountResults), std(CountResults), CountOptim_CH6_L140,...
    'VariableNames', {'Luminaire_Configuration', 'Target_Luminance', 'Solutions', 'Mean_metamer_count', 'SD_metamer_count', 'Total_optimised_spectra'});


[G, TargetGroups] = findgroups(categorical(Optim_CH6_L180.IndexNumber_Target));
CountResults = splitapply(@(x) max(x), Optim_CH6_L180.OptimResult_Number, G);
CH6_L180 = ['Mean spectra count each target ' num2str(mean(CountResults)) ' SD ' num2str(std(CountResults)) ' Total spectra ' num2str(sum(CountResults))];
CountOptim_CH6_L180 = sum(CountResults);
fprintf('6-Channel Luminance 180 cd/m2: Solutions found for %d of 561 optimisation targets. Mean spectra count for each optimisation target is %.2f SD %.2f - Total: %d \n',...
    size(categories(categorical(Optim_CH6_L180.IndexNumber_Target)),1), mean(CountResults), std(CountResults), CountOptim_CH6_L180);
Table_S2_CH6_180 = table(6, 180, size(categories(categorical(Optim_CH6_L180.IndexNumber_Target)),1), mean(CountResults), std(CountResults), CountOptim_CH6_L180,...
    'VariableNames', {'Luminaire_Configuration', 'Target_Luminance', 'Solutions', 'Mean_metamer_count', 'SD_metamer_count', 'Total_optimised_spectra'});

[G, TargetGroups] = findgroups(categorical(Optim_CH6_L220.IndexNumber_Target));
CountResults = splitapply(@(x) max(x),Optim_CH6_L220.OptimResult_Number,G);
CH6_L220 = ['Mean spectra count each target ' num2str(mean(CountResults)) ' SD ' num2str(std(CountResults)) ' Total spectra' num2str(sum(CountResults))];
CountOptim_CH6_L220 = sum(CountResults);
fprintf('6-Channel Luminance 220 cd/m2: Solutions found for %d of 561 optimisation targets. Mean spectra count for each optimisation target is %.2f SD %.2f - Total: %d \n',...
    size(categories(categorical(Optim_CH6_L220.IndexNumber_Target)),1), mean(CountResults), std(CountResults), CountOptim_CH6_L220);
Table_S2_CH6_220 = table(6, 220, size(categories(categorical(Optim_CH6_L220.IndexNumber_Target)),1), mean(CountResults), std(CountResults), CountOptim_CH6_L220,...
    'VariableNames', {'Luminaire_Configuration', 'Target_Luminance', 'Solutions', 'Mean_metamer_count', 'SD_metamer_count', 'Total_optimised_spectra'});


OptimisationCount_6Channel = table({'CH 6'}, {CH6_L140}, {CH6_L180}, {CH6_L220},...
    'VariableNames', {'Channel', 'Luminance 140 cd/m2' 'Luminance 180 cd/m2' 'Luminance 220 cd/m2'});
% ---------------------------------------------------------------------------------------

% 8 Channel -----------------------------------------------------------------------
[G, TargetGroups] = findgroups(categorical(Optim_CH8_L140.IndexNumber_Target));
CountResults = splitapply(@(x) max(x), Optim_CH8_L140.OptimResult_Number, G);
CH8_L140 = ['Mean spectra count each target ' num2str(mean(CountResults)) ' SD ' num2str(std(CountResults)) ' Total ' num2str(sum(CountResults))];
CountOptim_CH8_L140 = sum(CountResults);
fprintf('8-Channel Luminance 140 cd/m2: Solutions found for %d of 561 optimisation targets. Mean spectra count for each optimisation target is %.2f SD %.2f - Total: %d \n',...
    size(categories(categorical(Optim_CH8_L140.IndexNumber_Target)),1), mean(CountResults), std(CountResults), CountOptim_CH8_L140);
Table_S2_CH8_140 = table(8, 140, size(categories(categorical(Optim_CH8_L140.IndexNumber_Target)),1), mean(CountResults), std(CountResults), CountOptim_CH8_L140,...
    'VariableNames', {'Luminaire_Configuration', 'Target_Luminance', 'Solutions', 'Mean_metamer_count', 'SD_metamer_count', 'Total_optimised_spectra'});

[G, TargetGroups] = findgroups(categorical(Optim_CH8_L180.IndexNumber_Target));
CountResults = splitapply(@(x) max(x), Optim_CH8_L180.OptimResult_Number, G);
CH8_L180 = ['Mean spectra count each target ' num2str(mean(CountResults)) ' SD ' num2str(std(CountResults)) ' Total ' num2str(sum(CountResults))];
CountOptim_CH8_L180 = sum(CountResults);
fprintf('8-Channel Luminance 180 cd/m2: Solutions found for %d of 561 optimisation targets. Mean spectra count for each optimisation target is %.2f SD %.2f - Total: %d \n',...
    size(categories(categorical(Optim_CH8_L180.IndexNumber_Target)),1), mean(CountResults), std(CountResults), CountOptim_CH8_L180);
Table_S2_CH8_180 = table(8, 180, size(categories(categorical(Optim_CH8_L180.IndexNumber_Target)),1), mean(CountResults), std(CountResults), CountOptim_CH8_L180,...
    'VariableNames', {'Luminaire_Configuration', 'Target_Luminance', 'Solutions', 'Mean_metamer_count', 'SD_metamer_count', 'Total_optimised_spectra'});

[G, TargetGroups] = findgroups(categorical(Optim_CH8_L220.IndexNumber_Target));
CountResults = splitapply(@(x) max(x), Optim_CH8_L220.OptimResult_Number, G);
CH8_L220 = ['Mean spectra count each target ' num2str(mean(CountResults)) ' SD ' num2str(std(CountResults)) ' Total ' num2str(sum(CountResults))];
CountOptim_CH8_L220 = sum(CountResults);
fprintf('8-Channel Luminance 220 cd/m2: Solutions found for %d of 561 optimisation targets. Mean spectra count for each optimisation target is %.2f SD %.2f - Total: %d \n',...
    size(categories(categorical(Optim_CH8_L220.IndexNumber_Target)),1), mean(CountResults), std(CountResults), CountOptim_CH8_L220);
Table_S2_CH8_220 = table(8, 220, size(categories(categorical(Optim_CH8_L220.IndexNumber_Target)),1), mean(CountResults), std(CountResults), CountOptim_CH8_L220,...
    'VariableNames', {'Luminaire_Configuration', 'Target_Luminance', 'Solutions', 'Mean_metamer_count', 'SD_metamer_count', 'Total_optimised_spectra'});


OptimisationCount_6Channel = table({'CH 8'}, {CH8_L140}, {CH8_L180}, {CH8_L220},...
    'VariableNames', {'Channel', 'Luminance 140 cd/m2' 'Luminance 180 cd/m2' 'Luminance 220 cd/m2'});
% ---------------------------------------------------------------------------------------

% 11 Channel -----------------------------------------------------------------------
[G, TargetGroups] = findgroups(categorical(Optim_CH11_L140.IndexNumber_Target));
CountResults = splitapply(@(x) max(x),Optim_CH11_L140.OptimResult_Number,G);
CH11_L140 = ['Mean spectra count each target ' num2str(mean(CountResults)) ' SD ' num2str(std(CountResults)) ' Total ' num2str(sum(CountResults))];
CountOptim_CH11_L140 = sum(CountResults);
fprintf('11-Channel Luminance 140 cd/m2: Solutions found for %d of 561 optimisation targets. Mean spectra count for each optimisation target is %.2f SD %.2f - Total: %d \n',...
    size(categories(categorical(Optim_CH11_L140.IndexNumber_Target)),1), mean(CountResults), std(CountResults), CountOptim_CH11_L140);
Table_S2_CH11_140 = table(11, 140, size(categories(categorical(Optim_CH11_L140.IndexNumber_Target)),1), mean(CountResults), std(CountResults), CountOptim_CH11_L140,...
    'VariableNames', {'Luminaire_Configuration', 'Target_Luminance', 'Solutions', 'Mean_metamer_count', 'SD_metamer_count', 'Total_optimised_spectra'});

[G, TargetGroups] = findgroups(categorical(Optim_CH11_L180.IndexNumber_Target));
CountResults = splitapply(@(x) max(x),Optim_CH11_L180.OptimResult_Number,G);
CH11_L180 = ['Mean spectra count each target ' num2str(mean(CountResults)) ' SD ' num2str(std(CountResults)) ' Total ' num2str(sum(CountResults))];
CountOptim_CH11_L180 = sum(CountResults);
fprintf('11-Channel Luminance 180 cd/m2: Solutions found for %d of 561 optimisation targets. Mean spectra count for each optimisation target is %.2f SD %.2f - Total: %d \n',...
    size(categories(categorical(Optim_CH11_L180.IndexNumber_Target)),1), mean(CountResults), std(CountResults), CountOptim_CH11_L180);
Table_S2_CH11_180 = table(11, 180, size(categories(categorical(Optim_CH11_L180.IndexNumber_Target)),1), mean(CountResults), std(CountResults), CountOptim_CH11_L180,...
    'VariableNames', {'Luminaire_Configuration', 'Target_Luminance', 'Solutions', 'Mean_metamer_count', 'SD_metamer_count', 'Total_optimised_spectra'});

[G, TargetGroups] = findgroups(categorical(Optim_CH11_L220.IndexNumber_Target));
CountResults = splitapply(@(x) max(x),Optim_CH11_L220.OptimResult_Number,G);
CH11_L220 = ['Mean spectra count each target ' num2str(mean(CountResults)) ' SD ' num2str(std(CountResults)) ' Total found spectra' num2str(sum(CountResults))];
CountOptim_CH11_L220 = sum(CountResults);
fprintf('11-Channel Luminance 220 cd/m2: Solutions found for %d of 561 optimisation targets. Mean spectra count for each optimisation target is %.2f SD %.2f - Total: %d \n',...
    size(categories(categorical(Optim_CH11_L220.IndexNumber_Target)),1), mean(CountResults), std(CountResults), CountOptim_CH11_L220);

Table_S2_CH11_220 = table(11, 220, size(categories(categorical(Optim_CH11_L220.IndexNumber_Target)),1), mean(CountResults), std(CountResults), CountOptim_CH11_L220,...
    'VariableNames', {'Luminaire_Configuration', 'Target_Luminance', 'Solutions', 'Mean_metamer_count', 'SD_metamer_count', 'Total_optimised_spectra'});

OptimisationCount_11Channel = table({'CH 11'}, {CH11_L140}, {CH11_L180}, {CH11_L220},...
    'VariableNames', {'Channel', 'Luminance 140 cd/m2' 'Luminance 180 cd/m2' 'Luminance 220 cd/m2'});
% ---------------------------------------------------------------------------------------

% Total count of optimised spectra
TotalCount = CountOptim_CH6_L140 + CountOptim_CH6_L180 + CountOptim_CH6_L220 +...
    CountOptim_CH8_L140 + CountOptim_CH8_L180 + CountOptim_CH8_L220 +...
    CountOptim_CH11_L140 + CountOptim_CH11_L180 + CountOptim_CH11_L220;

fprintf('Number of total optimised spectra across all optimisation targets %d \n', TotalCount);

% For how many chromaticity targets spectra where found in average across all lumiances and channel combinations ?
fprintf('Spectra were found for %.3f SD %.3f chromaticity targets across all luminanes and channel combinations \n',...
    mean([size(categories(categorical(Optim_CH6_L140.IndexNumber_Target)),1),...
size(categories(categorical(Optim_CH6_L180.IndexNumber_Target)),1),...
size(categories(categorical(Optim_CH6_L220.IndexNumber_Target)),1),...
size(categories(categorical(Optim_CH8_L140.IndexNumber_Target)),1),...
size(categories(categorical(Optim_CH8_L180.IndexNumber_Target)),1),...
size(categories(categorical(Optim_CH8_L220.IndexNumber_Target)),1),...
size(categories(categorical(Optim_CH11_L140.IndexNumber_Target)),1),...
size(categories(categorical(Optim_CH11_L180.IndexNumber_Target)),1),...
size(categories(categorical(Optim_CH11_L220.IndexNumber_Target)),1)]),...
std([size(categories(categorical(Optim_CH6_L140.IndexNumber_Target)),1),...
size(categories(categorical(Optim_CH6_L180.IndexNumber_Target)),1),...
size(categories(categorical(Optim_CH6_L220.IndexNumber_Target)),1),...
size(categories(categorical(Optim_CH8_L140.IndexNumber_Target)),1),...
size(categories(categorical(Optim_CH8_L180.IndexNumber_Target)),1),...
size(categories(categorical(Optim_CH8_L220.IndexNumber_Target)),1),...
size(categories(categorical(Optim_CH11_L140.IndexNumber_Target)),1),...
size(categories(categorical(Optim_CH11_L180.IndexNumber_Target)),1),...
size(categories(categorical(Optim_CH11_L220.IndexNumber_Target)),1)]))


% Table S1 (supplementary materials) 
disp(" ")
disp(" ")
disp(" ")
disp("Table S1: Supplementary materials")
Table_S2 = [Table_S2_CH6_140; Table_S2_CH6_180; Table_S2_CH6_220;...
    Table_S2_CH8_140; Table_S2_CH8_180; Table_S2_CH8_220;...
    Table_S2_CH11_140;Table_S2_CH11_180; Table_S2_CH11_220];
disp(Table_S2)
```

For further examples of how the available data can be evaluated, checkout the file [`Main.m`](Main.m).

## Citation

Please consider to cite our work if you find this repository or our results useful for your research:

Zandi, B.; Eissfeldt, A.; Herzog, A.; Khanh, T.Q. Melanopic Limits of Metamer Spectral Optimisation in Multi-Channel Smart Lighting Systems. *Energies* **2021**, *14*,* 527*. https://doi.org/10.3390/en14030527

```bib
@Article{Zandi2021B,
AUTHOR = {Zandi, Babak and Eissfeldt, Adrian and Herzog, Alexander and Khanh, Tran Quoc},
TITLE = {Melanopic Limits of Metamer Spectral Optimisation in Multi-Channel Smart Lighting Systems},
JOURNAL = {Energies},
VOLUME = {14},
YEAR = {2021},
NUMBER = {3},
ARTICLE-NUMBER = {527},
URL = {https://www.mdpi.com/1996-1073/14/3/527},
ISSN = {1996-1073},
DOI = {10.3390/en14030527}}
```
## License

This work is licensed under a [Creative Commons Attribution 4.0 International License.](http://creativecommons.org/licenses/by/4.0/)

