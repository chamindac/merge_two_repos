# Prerequisites
# git for windows (https://gitforwindows.org/) , git lfs for windows (https://git-lfs.com/)
# download python from https://www.python.org/downloads/ and install
# download https://github.com/newren/git-filter-repo/blob/main/git-filter-repo file raw content and create file named 'git-filter-repo' without extension
# modify first line from '#!/usr/bin/env python3' to '#!/usr/bin/env python' and save
# Run 'git --exec-path' to find the git install path for example C:/Program Files/Git/mingw64/libexec/git-core
# copy the file to git isntall path found above
# cd to a git repo folder and run 'git filter-repo --analyze' check if 'git filter-repo' commands work before running this script
# after clone run below commands first 
# git config --global --add safe.directory C:/temp/repos/mysourcerepo
# git config --global --add safe.directory C:/temp/repos/mytargetrepo



$repoPath = 'C:/temp/repos/';
$sourceRepoName = 'mysourcerepo';
$targetRepoName = 'mytargetrepo';
$targetFolderName = 'IaC';
$branches = @('develop','releases/saturn','releases/earth','releases/neptune','releases/pluto','releases/mars','releases/oceans','releases/pacific','releases/venus','releases/atlantic','releases/wave','releases/amazon','releases/congo'); #'master',

$sourceRepoPath = -join ($repoPath,$sourceRepoName);
$targetRepoPath = -join ($repoPath,$targetRepoName);

Write-Host ($sourceRepoPath);
Write-Host ($targetRepoPath);

<#
#>
cd $sourceRepoPath
git filter-repo --to-subdirectory-filter $targetFolderName --force

cd $targetRepoPath

foreach($branch in $branches)
{
    Write-Host ($branch);

    cd $sourceRepoPath
    git switch $branch

    $tagsInSource = git tag -l

    foreach($tagInSource in $tagsInSource)
    {
        Write-Host ($tagInSource);

        if (-not $tagInSource.EndsWith('-iac'))
        {
            git tag (-join($tagInSource,'-iac')) $tagInSource
            git tag -d $tagInSource
        }
    }
    
    cd $targetRepoPath
    git switch $branch

    git remote add $targetFolderName $sourceRepoPath
    git fetch $targetFolderName --tags
    git merge --allow-unrelated-histories $targetFolderName/$branch
    git remote remove $targetFolderName

    git stash push -a -m $branch
}

# Run beow to push all changes after checking them locally
#git push --all
#git push --tags