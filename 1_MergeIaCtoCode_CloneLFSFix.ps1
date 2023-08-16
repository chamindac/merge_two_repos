$repoPath = 'C:/temp/repos/';
$sourceRepoName = 'mysourcerepo';
$targetRepoName = 'mytargetrepo';
$targetRepoCloneUrl = 'https://myorg@dev.azure.com/myorg/myproject/_git/mytargetrepo';

$sourceRepoPath = -join ($repoPath,$sourceRepoName);
$targetRepoPath = -join ($repoPath,$targetRepoName);
# run beow two only once and then comment
#git config --global --add safe.directory $sourceRepoPath
#git config --global --add safe.directory $targetRepoPath
# to check use --> git config --global --list

#git clone $targetRepoCloneUrl $targetRepoPath

#once clone completed comment clone and run below two if cloning for first time
# 

# then run below one by one in git bash
# cd to target repo path --> cd "C:/temp/repos/mysourcerepo"
# git remote add source https://myorg@dev.azure.com/myorg/myproject/_git/mytargetrepo
# git remote add target $targetrepocloneurl --> git remote add target https://myorg@dev.azure.com/myorg/myproject/_git/mytargetrepo
# git remote get-url source
# git remote get-url target
# git lfs fetch source --all
# git remote remove source
# git lfs push target --all
# git remote remove target
