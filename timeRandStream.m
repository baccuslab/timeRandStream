% time RandStream random number generation
% Niru Maheswaranathan
% 01:50 AM Dec 4, 2013
% times = timeRandStream(algorithm, numTrials, numSamples, seed)

function times = timeRandStream(algorithm, numTrials, numSamples, seed)

    if nargin < 4
        seed = 0;
    end

    % create stream with seed 0
    stream = RandStream(algorithm, 'Seed', seed);

    % store times
    times = zeros(numTrials, 1);

    % iterate over trials
    for t = 1:numTrials

        % start timer
        tic;

        % draw samples
        x = randn(stream, numSamples, numSamples);

        % stop timer
        times(t) = toc;

    end
