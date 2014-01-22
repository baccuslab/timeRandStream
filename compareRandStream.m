% RandStream speed comparisons
% Niru Maheswaranathan
% 01:48 AM Dec 4, 2013
%
% Note: this was tested with RandStream from Matlab 2012a

%% Parameters
numTrials  = 10;
numSamples = 500;
algorithms = {'mt19937ar', 'mcg16807', 'mlfg6331_64', 'mrg32k3a', 'shr3cong', 'swb2712'};

%% loop over algorithms
runTimes = zeros(numTrials, length(algorithms));
for aIdx = 1:length(algorithms)

    % update user
    fprintf(['(%i of %i) Testing ' algorithms{aIdx} '\n'], aIdx, length(algorithms));

    % run test
    runTimes(:,aIdx) = timeRandStream(algorithms{aIdx}, numTrials, numSamples);

end

%% plot results (uses errorb and cbrewer functions from file exchange)
figure(1); clf; hold on;
scaleFactor = 1e3;
bar(mean(runTimes)*scaleFactor, 0.8);
%errorb(mean(runTimes)*scaleFactor, std(runTimes)*scaleFactor, 'top');
set(gca, 'XTick', 1:length(algorithms), 'XTickLabel', algorithms)
%cmap = cbrewer('qual', 'Set1', length(algorithms)); colormap(cmap);
xlabel('Algorithm'); ylabel('Runtime (ms)');
%makepretty; grid on;
