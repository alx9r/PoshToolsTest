Using the fully featured Visual Studio would be a great way to develop PowerShell modules.  PoshTools makes that a pretty good experience, in general.  Getting an efficient TDD workflow working for PowerShell in Visual Studio has proven challenging.  This module is meant to help evaluate the best way to set up and use Visual Studio and PoshTools for a TDD workflow for developing PowerShell modules.

To reproduce the tests perform the following:

1. Install Visual Studio.
1. Install the PoshTools Visual Studio Extension.
1. Copy a release of the Pester module to `C:\Program Files\WindowsPowerShell\Modules`.  
Ensure that `Pester.psm1` and the other files and folders from the module are in the 
root of the `Pester` folder, not inside a version number folder.
1. Copy this repository to `C:\Program Files\WindowsPowerShell\Modules`.
1. Run Visual Studio as an administrator.
1. Open `PoshToolsTest.soln` from Visual Studio.
1. Open the 'PowerShell Interactive Window' in Visual Studio to open the REPL.
1. Change the location of the REPL to `PoshToolsTest.Tests.ps1`.
1. Run Invoke-Pester in the REPL.
1. Open the 'Test Explorer Window' in Visual Studio.
1. Invoke 'Run All' in the 'Test Explorer Window'

## Notes from 2016-09-24 Test

PoshTools Version: 3.0.399

Pester Version: 3.4.3

Visual Studio Edition: Community 2015

Visual Studio Version: 14.0.25425.01 update 3

.Net Framework Version: 4.6.01590

The main remaining sources of friction seeem to related to the following:

* efficiently finding and jumping to offending tests and line numbers from Test Explorer
* the rather course granularity of tests showing in Test Explorer

### Test Explorer can't find modules in the usual places.

There are two customary places for PowerShell modules where the tests invoked via
Test Explorer do not seem to look for dependencies:

* in version number folders inside folders in `C:\Program Files\WindowsPowerShell\Modules` - This
complicates using modules obtained using PowerShellGet which seem get installed inside verison
number folders.
* in `%USERPROFILE%\Documents\WindowsPowerShell\Modules`

This seems to be the case regardless of the contents of `%PSModulePath%`.

Putting well-formed modules directly in `C:\Program Files\WindowsPowerShell\Modules` 
seems to make them accessible to tests invoked from Test Explorer.  The downside
is that elevated privileges are required to write to 
`C:\Program Files\WindowsPowerShell\Modules`.  One workaround is to run Visual Studio
as an administrator.  The downside to that is that the code you are developing also
runs with elevated privileges.  That can become awkward if the behavior of the thing 
you are developing is affected by privilege escalation.

### Jumping to error in test output windows don't work.

When testing is invoked from Test Explorer, it outputs error messages from failed tests in three 
places:

* for the offending `Describe{}` block in the bottom of the Test Explorer pane 
* for the offending stack traces in the bottom of the Test Explorer pane
* the Output pane

There doesn't seem to  be any way to jump to the file name and line numbers from any of those 
outputs.

### Deeper stack traces are truncated.

When testing is invoked from Test Explorer, stack traces from failed Pester assertions
show fine.  On the other hand, deeper stack traces are truncated.  This slows the 
test-change-test TDD workflow because it takes digging to find offending `It{}` and
`function{}` blocks.

### Neither `Context{}` nor `It{}` blocks are shown in Test Explorer.

Neither `Context{}` nor `It{}` blocks are shown in Test Explorer.  This means that the 
"Failed Tests" section in the Test Explorer pane only shows the label of the `Describe{}` block
inside which the test failed, not the specific `Context{}` and `It{}`.   This slows the 
test-change-test TDD workflow because it takes digging to figure out which `It{}` block failed.

### Looping over `Describe{}` blocks causes Test Explorer to throw an exception.

Putting `Describe{}` inside a foreach block and then invoking that from Test Explorer causes 
Test Explorer to throw an exception.  While looping over tests is a common use case for Pester
in general, it doesn't seem critical for module development.