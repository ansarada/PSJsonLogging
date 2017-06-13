###############################################################################
# Customize these properties and tasks
###############################################################################
param(
	$Artifacts = './artifacts',
	$ModuleName = 'PSJsonLogging',
	$ModulePath = './PSJsonLogging',
	$BuildNumber = $env:BUILD_NUMBER,
	$PercentCompliance  = '40'
)

###############################################################################
# Static settings -- no reason to include these in the param block
###############################################################################
$Settings = @{
	SMBRepoName = 'DSCGallery'
	SMBRepoPath = '\\Server01\Repo'

	Author =  "Michael Willis"
	Owners = "Michael Willis"
	LicenseUrl = 'https://github.com/ansarada/PSJsonLogging/LICENSE'
	ProjectUrl = "https://github.com/ansarada/PSJsonLogging"
	PackageDescription = "PSJsonLogging module pipeline demonstration"
	Repository = 'https://github.com/ansarada/PSJsonLogging.git'
	Tags = ""

	# TODO: fix any redudant naming
	GitRepo = "ansarada/PSJsonLogging"
	CIUrl = "http://jenkins/job/PSJsonLogging/"
}

###############################################################################
# Before/After Hooks for the Core Task: Clean
###############################################################################

# Synopsis: Executes before the Clean task.
task BeforeClean -Before Clean {}

# Synopsis: Executes after the Clean task.
task AfterClean -After Clean {}

###############################################################################
# Before/After Hooks for the Core Task: Analyze
###############################################################################

# Synopsis: Executes before the Analyze task.
task BeforeAnalyze -Before Analyze {}

# Synopsis: Executes after the Analyze task.
task AfterAnalyze -After Analyze {}

###############################################################################
# Before/After Hooks for the Core Task: Test
###############################################################################

# Synopsis: Executes before the Test task.
task BeforeTest -Before Test {}

# Synopsis: Executes after the Test task.
task AfterTest -After Test {}

###############################################################################
# Before/After Hooks for the Core Task: Archive
###############################################################################

# Synopsis: Executes before the Archive task.
task BeforeArchive -Before Archive {}

# Synopsis: Executes after the Archive task.
task AfterArchive -After Archive {}

###############################################################################
# Before/After Hooks for the Core Task: Publish
###############################################################################

# Synopsis: Executes before the Publish task.
task BeforePublish -Before Publish {}

# Synopsis: Executes after the Publish task.
task AfterPublish -After Publish {}
