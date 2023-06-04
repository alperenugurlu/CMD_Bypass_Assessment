# CMD Bypass Method Analysis

[![Windows](https://svgshare.com/i/ZhY.svg)](https://svgshare.com/i/ZhY.svg)

CMD Bypass Method Analysis is a PowerShell script that automatically tests CMD bypass methods on Windows systems and evaluates the results. The script checks for various CMD bypass methods and saves the results to a text file, providing security recommendations.

# Use

To run the PowerShell script, open a PowerShell session.
Add the script file to the PowerShell session or run it directly:

* .\Cmd_Bypass_Score_Card.ps1

When the script is run, CMD automatically tests the bypass methods and evaluates the results.
The results are saved in the output.txt file.

# Commands That The Script Tests

- Check CMD Restriction: Checks the CMD restriction.
- Disable CMD Restriction: Disables the CMD restriction.
- PowerShell Bypass: Controls the bypass method of PowerShell.
- HKCU Bypass: Controls the HKCU CMD bypass method.
- /k Bypass: Uses the /k parameter to test the CMD bypass method.
- /c Bypass: Uses the /c parameter to test the CMD bypass method.
- Registry Enumeration: Queries HKEY_CURRENT_USER records.
- System Information: Retrieves system information.
- Process List: Lists running processes.
- Check IP Configuration: Checks the IP configuration.
- Check Network Connections: Checks network connections.

# Output
As a result of the script running, a separate output is generated for each command. The outputs contain the following information:

Command name
command
Output
return code
Status (PASSED or FAILED)
The results are saved in the output.txt file and are also displayed in the PowerShell session when the script is run.

# Success Score and Safety Recommendations

As a result of the script running, a success score is calculated and security recommendations are presented. The success score is calculated as a percentage of successful commands. 

# Security Recommendations Are Provided Based On the Following Criteria:

- If the pass score is below 50%: Further security hardening measures are required.
- If the success score is between 50% and 80%: Some security hardening measures can be improved.
- If the success score is above 80%: The system is sufficiently secure.

# Cyber Security Consultant <p><a href="https://www.linkedin.com/in/alperen-ugurlu-7b57b7178/">Alperen Ugurlu</a></p>

<picture>
<source
  srcset="https://github-readme-stats.vercel.app/api?username=alperenugurlu&show_icons=true&theme=dark"
  media="(prefers-color-scheme: dark)"
/>
<source
  srcset="https://github-readme-stats.vercel.app/api?username=alperenugurlu&show_icons=true"
  media="(prefers-color-scheme: light), (prefers-color-scheme: no-preference)"
/>
<img src="https://github-readme-stats.vercel.app/api?username=alperenugurlu&show_icons=true" />
</picture>






