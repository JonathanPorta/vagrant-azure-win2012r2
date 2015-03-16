$tempDir = 'C:\tmp'

$gitUrl = 'https://github.com/JonathanPorta/windows-gaming-cookbooks.git'
$repoPath = 'C:\cookbooks'
$repoRef = 'master'

# Clone the repository
Write-Host "Cloning $gitUrl into $repoPath"
git clone $gitUrl $repoPath

Write-Host "Reseting repository in $repoPath to origin/$repoRef"
cd $repoPath
git fetch origin
git reset --hard origin/$repoRef
