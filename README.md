# Plans Within Plans
This tool was created for the article [An Exploration of AV Evasion Techniques ](https://www.scip.ch/en/?labs.20230413). The script was made for educational reasons to demonstrate basic evasion techniques.

The tool explores a range of techniques an attacker could utilize to avoid detection while leveraging PowerShell. Gaining insight into these potential evasion methods and their functionality can assist defenders in understanding the constraints of monitoring PowerShell and consequently strengthening their defenses. The presented evasion techniques are not novel, and therefore, a modern Endpoint Detection and Response (EDR) system may flag the techniques as malicious.

## Usage
1. Copy the files you want to execute to the /files folder. 
..* For the PoC we used etw.exe, Seatbelt.exe, Sharphound.exe and PrivescCheck.ps1
2. Modify the run commands in the file PlansWithInPlans3.ps1
..* the application is the name of the tool that you copied to the /files folder. After encryption .txt is added as a suffix. But you can also use an arbitrary name.
3. Modify and run the PreparePlansWithinPlans.ps1
..* You can change the encryption key in this file -> $encryptionKey
..* Whenever you change something in PlansWithInPlans1 or PlansWithInPlans2, or PlansWithInPlans3 you must run the PreparePlansWithinPlans.ps1 again to create an updated data.txt
4. If you changed the executable names in the PlansWithInPlans3.ps1 file, rename the encrypted *.txt files accordingly.
..* e.g. SharpHound.exe-readme.txt -> readme1.txt
5. Transfer the files in the root folder to the victim. In our example: data.txt, etw.exe.txt, Seatb.exe.txt, Sharph.exe.txt, PrivCheck.ps1.txt
6. Run the PlansRunner.ps1 script on the victims machine

If the PowerShell execution policy is not restricted 
```Powershell
Import-Module .\PlansRunner.ps1 | Update-AVSignature -arg1 <pw>
```

If the PowerShell execution policy is restricted
```Powershell
Get-Content .\PlansRunner.ps1 | out-string | iex
Update-AVSignature -arg1 <pw>
```
7. The script should now decrypt and execute your files in sequence
8. Review the events in the Event Viewer under Microsoft-Windows-PowerShell/Operational
9. Review the ETW events
10. Review the AV events

## Disclaimer
Unauthorized and illegal use of this tool or any other projects I've authored for the purpose of unsolicited hacking, cyber-espionage, or any other illicit activity is strictly prohibited. These tools are intended for use by Penetration Testers, Security Consultants, Security Engineers, and other security personnel to enhance the cyber defense capabilities.

The authors and copyright holders shall not be held liable for any claims, damages, or liabilities arising from the illegal use of this tool. However, if you have any concerns, copyright issues, or inquiries regarding this software, I am open to collaborating in a responsible manner to address them.

It is worth noting that this tool employs well-known AV evasion techniques and, as such, does not introduce any new threats to the cybersecurity landscape.
