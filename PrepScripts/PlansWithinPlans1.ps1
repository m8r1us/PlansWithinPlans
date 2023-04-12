<#requires -version 3.0

try { Microsoft.PowerShell.Core\Set-StrictMode -Off } catch { }

$script:MyModule = $MyInvocation.MyCommand.ScriptBlock.Module

$script:ClassName = 'ROOT\Microsoft\Windows\Defender\MSFT_MpSignature'
$script:ClassVersion = '1.0'
$script:ModuleVersion = '1.0'
$script:ObjectModelWrapper = [Microsoft.PowerShell.Cmdletization.Cim.CimCmdletAdapter]

$script:PrivateData = [System.Collections.Generic.Dictionary[string,string]]::new()

Microsoft.PowerShell.Core\Export-ModuleMember -Function @()
        
        
function __cmdletization_BindCommonParameters
{
    param(
        $__cmdletization_objectModelWrapper,
        $myPSBoundParameters
    )       
                

        if ($myPSBoundParameters.ContainsKey('CimSession')) { 
            $Value['Cim'] = $my['Cim'] 
        }
                    

        if ($myPSBoundParameters.ContainsKey('ThrottleLimit')) { 
            $Value['ThrottleLimit'] = $myPSBoundParameters['ThrottleLimit'] 
        }
                    

        if ($myPSBoundParameters.ContainsKey('AsJob')) { 
            $Value['AsJob'] = $myPSBoundParameters['AsJob'] 
        }
                    

}
        
function Update-MpSignature
{
    [CmdletBinding(PositionalBinding=$false)]
    
    
    param(
    
    [Parameter(ParameterSetName='Update0')]
    [AllowEmptyString()]
    [AllowNull()]
    [ValidateNotNull()]
    [ValidateNotNullOrEmpty()]
    [ValidateSet('InternalDefinitionUpdateServer','MicrosoftUpdateServer','MMPC','FileShares')]
    [Microsoft.PowerShell.Cmdletization.GeneratedTypes.MpSignature.UpdateSource]
    ${UpdateSource},

    [Parameter(ParameterSetName='Update0')]
    [Alias('Session')]
    [ValidateNotNullOrEmpty()]
    [CimSession[]]
    ${CimSession},

    [Parameter(ParameterSetName='Update0')]
    [int]
    ${ThrottleLimit},

    [Parameter(ParameterSetName='Update0')]
    [switch]
    ${AsJob})

    DynamicParam {
        try 
        {
            if (-not $__cmdletization_exceptionHasBeenThrown)
            {
                $__cmdletization_objectModelWrapper = $script:ObjectModelWrapper::new()
                $__cmdletization_objectModelWrapper.Initialize($PSCmdlet, $script:ClassName, $script:ClassVersion, $script:ModuleVersion, $script:PrivateData)

                if ($__cmdletization_objectModelWrapper -is [System.Management.Automation.IDynamicParameters])
                {
                    ([System.Management.Automation.IDynamicParameters]$__cmdletization_objectModelWrapper).GetDynamicParameters()#>
                    write-host " ";write-host "SSBtdXN0IG5vdCBmZWFyLiBGZWFyIGlzIHRoZSBtaW5kLWtpbGxlci4";write-host " ";$log = Get-WinEvent -filterhashtable @{logname="Microsoft-Windows-PowerShell/Operational";id=4104} -erroraction 'silentlycontinue' | Where {$_.Message -like "*SSBtdXN0IG5vdCBmZWFyLiBGZWFyIGlzIHRoZSBtaW5kLWtpbGxlci4*"};if($log){ exit; }
              <#}
            }
        }
        catch
        {
            $__cmdletization_exceptionHasBeenThrown = $true
            throw
        }
    }

    Begin {
        $__cmdletization_exceptionHasBeenThrown = $false
        try 
        {
            __cmdletization_BindCommonParameters $__cmdletization_objectModelWrapper $PSBoundParameters
            $__cmdletization_objectModelWrapper.BeginProcessing()
        }
        catch
        {
            $__cmdletization_exceptionHasBeenThrown = $true
            throw
        }
    }
        

    Process {
        try 
        {
            if (-not $__cmdletization_exceptionHasBeenThrown)
            {
      $__cmdletization_methodParameters = [System.Collections.Generic.List[Microsoft.PowerShell.Cmdletization.MethodParameter]]::new()

        [object]$__cmdletization_defaultValue = $null
        [object]$__cmdletization_defaultValueIsPresent = $false
        if ($PSBoundParameters.ContainsKey('UpdateSource')) {
          [object]$__cmdletization_value = ${UpdateSource}
          $__cmdletization_methodParameter = [Microsoft.PowerShell.Cmdletization.MethodParameter]@{Name = 'UpdateSource'; ParameterType = 'Microsoft.PowerShell.Cmdletization.GeneratedTypes.MpSignature.UpdateSource'; Bindings = 'In'; Value = $__cmdletization_value; IsValuePresent = $true}
        } else {
          $__cmdletization_methodParameter = [Microsoft.PowerShell.Cmdletization.MethodParameter]@{Name = 'UpdateSource'; ParameterType = 'Microsoft.PowerShell.Cmdletization.GeneratedTypes.MpSignature.UpdateSource'; Bindings = 'In'; Value = $__cmdletization_defaultValue; IsValuePresent = $__cmdletization_defaultValueIsPresent}
        }
        $__cmdletization_methodParameters.Add($__cmdletization_methodParameter)

      $__cmdletization_returnValue = [Microsoft.PowerShell.Cmdletization.MethodParameter]@{ Name = 'ReturnValue'; ParameterType = 'System.Int32'; Bindings = 'Error'; Value = $null; IsValuePresent = $false }
      $__cmdletization_methodInvocationInfo = [Microsoft.PowerShell.Cmdletization.MethodInvocationInfo]::new('Update', $__cmdletization_methodParameters, $__cmdletization_returnValue)
      $__cmdletization_objectModelWrapper.ProcessRecord($__cmdletization_methodInvocationInfo)

            }
        }
        catch
        {
            $__cmdletization_exceptionHasBeenThrown = $true
            throw
        }
    }
        

    End {
        try
        {
            if (-not $__cmdletization_exceptionHasBeenThrown)
            {
                $__cmdletization_objectModelWrapper.EndProcessing()
            }
        }
        catch
        {
            throw
        }
    }

    # .EXTERNALHELP MSFT_MpSignature.cdxml-Help.xml
}#>
