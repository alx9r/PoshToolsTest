Import-Module PoshToolsTest -Force

# these tests are shown in Test Explorer...
Describe 'Describe block 1' { 
	# ...but only the describe label is shown in Test Explorer...
	# ...and only one test is counted...
	Context 'Context block 1.1' { # ...Context Labels are not shown in Test Explorer...
		It "see if function defined in this module works" { # ...It labels are also not shown in Test Explorer...
			$r = Get-Functiona3c7354e
			$r | Should be 'return value'
		}
		It 'failing test 1 (deeper stack trace)' {
			f-a3c7354e
		}
		It 'some passing test' { 1 | Should be 1 }
		It 'some passing test' { 1 | Should be 1 }
		It 'some passing test' { 1 | Should be 1 }
		It 'some passing test' { 1 | Should be 1 }
		It 'some passing test' { 1 | Should be 1 }
		It 'some passing test' { 1 | Should be 1 }
		It 'some passing test' { 1 | Should be 1 }
		It 'some passing test' { 1 | Should be 1 }
		It 'some passing test' { 1 | Should be 1 }
		It 'some passing test' { 1 | Should be 1 }
		It 'some passing test' { 1 | Should be 1 }
		It 'some passing test' { 1 | Should be 1 }
		It 'some passing test' { 1 | Should be 1 }
		It 'some passing test' { 1 | Should be 1 }
		It 'some passing test' { 1 | Should be 1 }
		It 'some passing test' { 1 | Should be 1 }
		It 'some passing test' { 1 | Should be 1 }
		It 'some passing test' { 1 | Should be 1 }
		It 'some passing test' { 1 | Should be 1 }
		It 'some passing test' { 1 | Should be 1 }
		It 'some passing test' { 1 | Should be 1 }
		It 'some passing test' { 1 | Should be 1 }
		It 'some passing test' { 1 | Should be 1 }
		It 'some passing test' { 1 | Should be 1 }
		It 'some passing test' { 1 | Should be 1 }
		It 'some passing test' { 1 | Should be 1 }
		It 'failing test 2' { 2 | Should be 1 }
		It 'some passing test' { 1 | Should be 1 }
		It 'some passing test' { 1 | Should be 1 }
		It 'some passing test' { 1 | Should be 1 }
		It 'some passing test' { 1 | Should be 1 }
		It 'some passing test' { 1 | Should be 1 }
		It 'failing test 3 (deeper stack trace)' {
			f-a3c7354e
		}
	}
}
Describe 'Describe block 2' {
	Context 'Context block 2.1' {
		It 'some passing test' { 1 | Should be 1 }
		It 'some passing test' { 1 | Should be 1 }
		It 'some passing test' { 1 | Should be 1 }
		It 'some passing test' { 1 | Should be 1 }
		It 'some passing test' { 1 | Should be 1 }
		It 'some passing test' { 1 | Should be 1 }
	}
	Context 'Context block 2.2' {
		It 'some passing test' { 1 | Should be 1 }
		It 'some passing test' { 1 | Should be 1 }
		It 'some passing test' { 1 | Should be 1 }
		It 'some passing test' { 1 | Should be 1 }
		It 'some passing test' { 1 | Should be 1 }
		It 'some passing test' { 1 | Should be 1 }
	}
}
$h = @{
	i = 0
}
Describe 'Describe block 3' {
	BeforeEach {
		$h.i += 1
	}
	It '1' {
		$h.i | Should be 1
	}
	It '2' {
		$h.i | Should be 2
	}
}

 
# This region runs fine in the REPL...
# ... but throws an exception when invoked from Test Explorer.
#region
#foreach ( $i in 0..9 )
#{
#	Describe "Index $i" {
#		It 'test variable name in Describe label' {
#			$true | should be $true
#		}
#	}
#}
#endregion