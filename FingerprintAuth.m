% To remove the warning messages for using old syntax
warning('off','fuzzy:general:warnDeprecation_Newfis') 
warning('off','fuzzy:general:warnDeprecation_Addvar')
warning('off','fuzzy:general:warnDeprecation_Addmf')
warning('off','fuzzy:general:warnDeprecation_Evalfis')

fisQuality = newfis('FingerprintQuality','DefuzzificationMethod', 'lom');


% Define input variables for Minutiae Match
fisQuality = addvar(fisQuality,'input','MinutiaeMatch',[0 100]);  
% Define membership functions for Minutiae Match
fisQuality = addmf(fisQuality,'input',1,'Very Low','trapmf',[0 0 10 20]);
fisQuality = addmf(fisQuality,'input',1,'Low','trapmf',[10 14 25 32]);
fisQuality = addmf(fisQuality,'input',1,'Medium','trapmf',[26.6 31 52 59]);
fisQuality = addmf(fisQuality,'input',1,'High','trapmf',[50 60 82 88]);
fisQuality = addmf(fisQuality,'input',1,'Very High','trapmf',[77 87 99 100]);

% Define input variables for Ridge Density
fisQuality = addvar(fisQuality,'input','RidgeDensity',[0 1]);     
% Define membership functions for Ridge Density
fisQuality = addmf(fisQuality,'input',2,'Sparse','trapmf',[0 0 0.46 0.6]);
fisQuality = addmf(fisQuality,'input',2,'Dense','trapmf',[0.4 0.58 1 1]);

% Define input variables for Whorl Pattern
fisQuality = addvar(fisQuality,'input','WhorlPattern',[0 1]);     
% Define membership functions for Whorl Pattern
fisQuality = addmf(fisQuality,'input',3,'Weak','trapmf',[0 0 0.3 0.48]);
fisQuality = addmf(fisQuality,'input',3,'Average','trapmf',[0.3 0.4 0.62 0.78]);
fisQuality = addmf(fisQuality,'input',3,'Strong','trapmf',[0.5 0.7 1 1]);

% Define output variable for Fingerprint Quality
fisQuality = addvar(fisQuality,'output','Fingerprint Damage',[0 100]);
% Define membership functions for Fingerprint Damage
fisQuality = addmf(fisQuality,'output',1,'Poor','trapmf',[0 0 14.59 26.2]);
fisQuality = addmf(fisQuality,'output',1,'Decent','trapmf',[20.3 22.4 38.7 43]);
fisQuality = addmf(fisQuality,'output',1,'Average','trapmf',[40.5 44.8 58 61]);
fisQuality = addmf(fisQuality,'output',1,'Good','trapmf',[56 61 91 96]);
fisQuality = addmf(fisQuality,'output',1,'Excellent','trapmf',[91 95 100 100]);

% Example rule definitions for fisQuality
rule1 = [1 1 1 1 1 1]; % If MinutiaeMatch is Very Low, RidgeDensity is Sparse, and WhorlPattern is Weak, then Fingerprint Damage is Poor
rule2 = [1 1 2 1 1 1]; % If MinutiaeMatch is Very Low, RidgeDensity is Sparse, and WhorlPattern is Average, then Fingerprint Damage is Poor
rule3 = [1 1 3 2 1 1]; % If MinutiaeMatch is Very Low, RidgeDensity is Sparse, and WhorlPattern is Strong, then Fingerprint Damage is Decent
rule4 = [1 2 1 2 1 1]; % If MinutiaeMatch is Very Low, RidgeDensity is Dense, and WhorlPattern is Weak, then Fingerprint Damage is Decent
rule5 = [1 2 2 2 1 1]; % If MinutiaeMatch is Very Low, RidgeDensity is Dense, and WhorlPattern is Average, then Fingerprint Damage is Decent
rule6 = [1 2 3 3 1 1]; % If MinutiaeMatch is Very Low, RidgeDensity is Dense, and WhorlPattern is Strong, then Fingerprint Damage is Average
rule7 = [2 1 1 2 1 1]; % If MinutiaeMatch is Low, RidgeDensity is Sparse, and WhorlPattern is Weak, then Fingerprint Damage is Decent
rule8 = [2 1 2 2 1 1]; % If MinutiaeMatch is Low, RidgeDensity is Sparse, and WhorlPattern is Average, then Fingerprint Damage is Decent
rule9 = [2 1 3 3 1 1]; % If MinutiaeMatch is Low, RidgeDensity is Sparse, and WhorlPattern is Strong, then Fingerprint Damage is Average
rule10 = [2 2 1 3 1 1]; % If MinutiaeMatch is Low, RidgeDensity is Dense, and WhorlPattern is Weak, then Fingerprint Damage is Average
rule11 = [2 2 2 3 1 1]; % If MinutiaeMatch is Low, RidgeDensity is Dense, and WhorlPattern is Average, then Fingerprint Damage is Average
rule12 = [2 2 3 4 1 1]; % If MinutiaeMatch is Low, RidgeDensity is Dense, and WhorlPattern is Strong, then Fingerprint Damage is Good
rule13 = [3 1 1 3 1 1]; % If MinutiaeMatch is Medium, RidgeDensity is Sparse, and WhorlPattern is Weak, then Fingerprint Damage is Average
rule14 = [3 1 2 3 1 1]; % If MinutiaeMatch is Medium, RidgeDensity is Sparse, and WhorlPattern is Average, then Fingerprint Damage is Average
rule15 = [3 1 3 4 0.8 1]; % If MinutiaeMatch is Medium, RidgeDensity is Sparse, and WhorlPattern is Strong, then Fingerprint Damage is Good
rule16 = [3 2 1 4 0.8 1]; % If MinutiaeMatch is Medium, RidgeDensity is Dense, and WhorlPattern is Weak, then Fingerprint Damage is Good
rule17 = [3 2 2 4 0.8 1]; % If MinutiaeMatch is Medium, RidgeDensity is Dense, and WhorlPattern is Average, then Fingerprint Damage is Good
rule18 = [3 2 3 5 0.7 1]; % If MinutiaeMatch is Medium, RidgeDensity is Dense, and WhorlPattern is Strong, then Fingerprint Damage is Excellent
rule19 = [4 1 1 4 0.7 1]; % If MinutiaeMatch is High, RidgeDensity is Sparse, and WhorlPattern is Weak, then Fingerprint Damage is Good
rule20 = [4 1 2 4 0.7 1]; % If MinutiaeMatch is High, RidgeDensity is Sparse, and WhorlPattern is Average, then Fingerprint Damage is Good
rule21 = [4 2 1 5 0.7 1]; % If MinutiaeMatch is High, RidgeDensity is Dense, and WhorlPattern is Weak, then Fingerprint Damage is Excellent
rule22 = [4 2 2 5 0.75 1]; % If MinutiaeMatch is High, RidgeDensity is Dense, and WhorlPattern is Average, then Fingerprint Damage is Excellent
rule23 = [4 2 3 5 0.7 1]; % If MinutiaeMatch is High, RidgeDensity is Dense, and WhorlPattern is Strong, then Fingerprint Damage is Excellent
rule24 = [5 1 1 5 0.7 1]; % If MinutiaeMatch is Very High, RidgeDensity is Sparse, and WhorlPattern is Weak, then Fingerprint Damage is Excellent
rule25 = [5 1 2 5 0.7 1]; % If MinutiaeMatch is Very High, RidgeDensity is Sparse, and WhorlPattern is Average, then Fingerprint Damage is Excellent
rule26 = [5 1 3 5 0.7 1]; % If MinutiaeMatch is Very High, RidgeDensity is Sparse, and WhorlPattern is Strong, then Fingerprint Damage is Excellent
rule27 = [5 2 1 5 0.8 1]; % If MinutiaeMatch is Very High, RidgeDensity is Dense, and WhorlPattern is Weak, then Fingerprint Damage is Excellent
rule28 = [5 2 2 5 0.8 1]; % If MinutiaeMatch is Very High, RidgeDensity is Dense, and WhorlPattern is Average, then Fingerprint Damage is Excellent
rule29 = [5 2 3 5 0.8 1]; % If MinutiaeMatch is Very High, RidgeDensity is Dense, and WhorlPattern is Strong, then Fingerprint Damage is Excellent
rule30 = [1 2 3 2 0.8 1]; % If MinutiaeMatch is Very Low, RidgeDensity is Dense, and WhorlPattern is Strong, then Fingerprint Damage is Decent
rule31 = [1 1 2 2 1 1];
rule32 = [1 1 3 3 1 1];
rule33 = [1 2 1 2 1 1];
rule34 = [1 2 2 2 1 1];
rule35 = [1 2 3 3 1 1];
rule36 = [2 1 1 2 1 1];
rule37 = [2 1 2 3 1 1];
rule38 = [2 1 3 3 1 1];
rule39 = [2 2 1 3 1 1];
rule40 = [2 2 2 3 1 1];
rule41 = [2 2 3 4 1 1];
rule42 = [3 1 1 3 1 1];
rule43 = [3 1 2 3 1 1];
rule44 = [3 1 3 4 1 1];
rule45 = [3 2 1 4 1 1];
rule46 = [3 2 2 4 1 1];
rule47 = [3 2 3 5 1 1];
rule48 = [4 1 1 4 1 1];
rule49 = [4 1 2 4 1 1];
rule50 = [4 1 3 5 1 1];
rule51 = [4 2 1 5 1 1];
rule52 = [4 2 2 5 1 1];
rule53 = [4 2 3 5 1 1];
rule54 = [5 1 1 5 1 1];
rule55 = [5 1 2 5 1 1];
rule56 = [5 1 3 5 1 1];
rule57 = [5 2 1 5 1 1];
rule58 = [5 2 2 5 1 1];
rule59 = [5 2 3 5 1 1];
rule60 = [1 1 1 1 1 1];
rule61 = [1 2 2 2 1 1];
rule62 = [2 1 3 2 1 1];
rule63 = [2 2 1 3 1 1];
rule64 = [3 1 2 3 1 1];
rule65 = [3 2 3 4 1 1];
rule66 = [4 1 1 4 1 1];
rule67 = [4 2 2 5 1 1];
rule68 = [5 1 3 5 1 1];
rule69 = [1 2 3 2 1 1];
rule70 = [5 2 1 5 1 1];
rule71 = [1 2 1 1 1 1];
rule72 = [2 1 1 1 1 1];
rule73 = [2 1 2 1 1 1];
rule74 = [2 2 1 1 1 1];
rule75 = [3 1 1 1 1 1];
rule76 = [1 2 2 1 1 1];
rule77 = [3 1 2 1 1 1];

ruleList = [rule1; rule2; rule3; rule4; rule5; rule6; rule7; rule8; rule9; rule10;
            rule11; rule12; rule13; rule14; rule15; rule16; rule17; rule18; rule19; rule20; 
            rule21; rule22; rule23; rule24; rule25; rule26; rule27; rule28; rule29; rule30
            rule31; rule32; rule33; rule34; rule35; rule36; rule37; rule38; rule39; rule40;
            rule41; rule42; rule43; rule44; rule45; rule46; rule47; rule48; rule49; rule50;
            rule51; rule52; rule53; rule54; rule55; rule56; rule57; rule58; rule59; rule60;
            rule61; rule62; rule63; rule64; rule65; rule66; rule67; rule68; rule69; rule70;
            rule71; rule72; rule73; rule74; rule75; rule76; rule77;];

fisQuality = addrule(fisQuality, ruleList);

% Input values
MinutiaeMatchInput = 75;
RidgeDensityInput = 0.7; 
WhorlPatternInput = 0.76;
format long;

evalQuality = evalfis([MinutiaeMatchInput, RidgeDensityInput, WhorlPatternInput], fisQuality);
disp(['Fingerprint Quality Evaluation: ', num2str(evalQuality)]);

% Using Centroid Method
fisQuality.DefuzzificationMethod = 'centroid';
evalCentroid = evalfis([MinutiaeMatchInput, RidgeDensityInput, WhorlPatternInput], fisQuality);

% Using Bisector Method
fisQuality.DefuzzificationMethod = 'bisector';
evalBisector = evalfis([MinutiaeMatchInput, RidgeDensityInput, WhorlPatternInput], fisQuality);

% Display or process the results
disp(['Centroid Method Output: ', num2str(evalCentroid)]);
disp(['Bisector Method Output: ', num2str(evalBisector)]);

%Plotting the Data

%figure; % Create a new figure
subplot(4,1,1), plotmf(fisQuality, 'input', 1); % MinutiaeMatch
title('MinutiaeMatch Membership Functions');

subplot(4,1,2), plotmf(fisQuality, 'input', 2); % RidgeDensity
title('RidgeDensity Membership Functions');

subplot(4,1,3), plotmf(fisQuality, 'input', 3); % WhorlPattern
title('WhorlPattern Membership Functions');

subplot(4,1,4), plotmf(fisQuality, 'output', 1); % FingerprintDamage
title('FingerprintDamage Membership Functions');







