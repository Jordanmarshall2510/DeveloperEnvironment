# PowerShell

Below contains a description and usage of each file in this folder:

| File                              | Description                                                   | Parameters                                                        |
| ---                               | ---                                                           | ---                                                               |
| **GetCommitIDsFromFolder.ps1**    | Gathers all commit IDs from repositories in a specific path.  | ``--parentDirectory <string>``                                    |
| **GetSystemInformation.ps1**      | Gathers OS, CPU, memory, disk and network adapter information.| ``None``                                                          |
| **RestartService.ps1**            | Restarts a given service by stopping then starting service.   | ``--serviceName <string>``                                        |
| **SetDateTime.ps1**               | Sets date and time with given values.                         | ``--day <int>, --month <int>, --year <int>, --hours <int>, --minutes <int>, --seconds <int>``|
| **ToggleNUMADevicesByNode.ps1**   | Enables/disables devices based on specified NUMA node.        | ``--deviceName <string>, --numaNode <int>, --enable, --disable``  |
| **UpdateEnvironment.ps1**         | Updates Windows, applications and tools to latest versions.   | ``None``                                                          |
| **RestoreOldContextMenu.ps1**     | Restores the classic context menu in Windows 11.              | ``None``                                                          |
