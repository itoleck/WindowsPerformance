# Performance Monitor Capture Instructions

To use the performance capture scripts use the steps below:

1. Clone the WindowsPerformance repository

2. Open PowerShell terminal as administrator

3. Navigate to the CaptureScripts folder for the product you want to capture; BasicPerformance, MSSQL, IIS, Hyper-v, ActiveDirectory and so on. Scripts are written for the repo folder structure so do not move files/folders. i.e. (cd \<repo\>\Perfmon\CaptureScripts\BasicPerformance)

4. Run the Capture script. i.e. (.\Basic1WeekCollector_Win11-2022_CaptureStart.ps1)

Some performance captures may stop at a certian duration and some will not. You can use Perfmon GUI, Logman and other tools to view and stop the capture created by the script in needed.
