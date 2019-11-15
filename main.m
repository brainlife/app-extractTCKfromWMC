function main()

if ~isdeployed
    disp('\n adding paths');
    addpath(genpath('/N/u/brlife/git/jsonlab'))
    addpath(genpath('/N/u/brlife/git/vistasoft'))
    addpath(genpath('/N/u/brlife/git/wma_tools'))
end

config = loadjson('config.json');
wbFG = fgRead(config.track);
load(config.classification)

tractStruc = bsc_makeFGsFromClassification_v4(classification, wbFG);

tractStruc{1}.name
   for itracts=1:length(classification.names)
      [~] = dtiExportFibersMrtrix(tractStruc{itracts}, strcat('output/tcks/',tractStruc{itracts}.name,'.tck'));
   end

for it = 1:length(tractStruc)
    all_tracts(it).name = tractStruc{it}.name;
    all_tracts(it).color = tractStruc{it}.colorRgb;
    all_tracts(it).filename = sprintf('%s.json',tractStruc{it}.name);
end
savejson('', all_tracts, 'output/tcks.json');

end
