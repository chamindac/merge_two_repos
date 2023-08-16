$repoPath = 'C:/temp/repos/';
$sourceRepoName = 'mysourcerepo';
$targetRepoName = 'mytargetrepo';
$sourceRepoCloneUrl = 'https://myorg@dev.azure.com/myorg/myproject/_git/mysourcerepo';
$targetRepoCloneUrl = 'https://myorg@dev.azure.com/myorg/myproject/_git/mytargetrepo';


$sourceRepoPath = -join ($repoPath,$sourceRepoName);
$targetRepoPath = -join ($repoPath,$targetRepoName);

git clone $sourceRepoCloneUrl $sourceRepoPath
git clone $targetRepoCloneUrl $targetRepoPath