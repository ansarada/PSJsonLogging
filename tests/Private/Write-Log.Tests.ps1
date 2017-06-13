$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'

#since we match the srs/tests organization this works
$here = $here -replace 'tests', 'PSJsonLogging'

. "$here\$sut"

# Import our module to use InModuleScope
Import-Module (Resolve-Path ".\PSJsonLogging\PSJsonLogging.psm1") -Force

InModuleScope "PSJsonLogging" {
	Describe "Private/Write-Log" {
		BeforeEach{
			# Need to start the log first as this creates the log file. Write log does not create the file so it'll fail if you try to unit test it by itself
			$Log = @{
				LogPath = 'TestDrive:\file.log';
				AddtionalLogData = @{}
			}
			Set-Content -Path $Log.LogPath -Value ''

		}

		Context "Write default log" {
			It "Creates a line entry in example.log with default"{
				Write-Log -Log $Log -LogData 'Test Message Default'
				$Log.LogPath | Should Contain '"logData":"Test Message Default".*"severity":"Information"'
			}
		}

		Context "Write error log" {
			It "Creates a line entry in example.log with error"{
				Write-Log -Log $Log -LogData 'Test Message Error' -Severity 'Error'
				$Log.LogPath | Should Contain '"logData":"Test Message Error".*"severity":"Error"'
			}
		}

		Context "Write warning log" {
			It "Creates a line entry in example.log with warning"{
				Write-Log -Log $Log -LogData 'Test Message warning' -Severity 'Warning'
				$Log.LogPath | Should Contain '"logData":"Test Message warning".*"severity":"Warning"'
			}
		}

		Context "Write Debug log" {
			It "Creates a line entry in example.log with debug"{
				Write-Log -Log $Log -LogData 'Test Message Debug' -Severity 'Debug'
				$Log.LogPath | Should Contain '"logData":"Test Message Debug".*"severity":"Debug"'
			}
		}

		Context "Write Information log" {
			It "Creates a line entry in example.log with info"{
				Write-Log -Log $Log -LogData 'Test Message Information'
				$Log.LogPath | Should Contain '"logData":"Test Message Information".*"severity":"Information"'
			}
		}

		Context "Unknown severity type" {
			It "Throw unknown Severity Type" {
				{ Write-Log -Log $Log -LogData 'Test Message Information' -Severity 'ASDjklSDFIOU' } | Should Throw
			}
		}
	}
}
