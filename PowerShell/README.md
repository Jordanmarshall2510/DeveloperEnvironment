# PowerShell

Below contains a description and usage of each file in this folder:

| File                              | Description                                                   | Parameters                                                        | Requires Administrator |
| ---                               | ---                                                           | ---                                                               | ---                    |
| **GetCommitIDsFromFolder.ps1**    | Gathers all commit IDs from repositories in a specific path.  | `--parentDirectory <string>`                                      | No                     |
| **GetSystemInformation.ps1**      | Gathers OS, CPU, memory, disk and network adapter information.| None                                                              | No                     |
| **RestartService.ps1**            | Restarts a given service by stopping then starting service.   | `--serviceName <string>`                                          | Yes                    |
| **SetDateTime.ps1**               | Sets date and time with given values.                         | `--day <int>, --month <int>, --year <int>, --hours <int>, --minutes <int>, --seconds <int>` | Yes                   |
| **ToggleNUMADevicesByNode.ps1**   | Enables/disables devices based on specified NUMA node.        | `--deviceName <string>, --numaNode <int>, --enable, --disable`    | Yes                    |
| **UpdateEnvironment.ps1**         | Updates Windows, applications and tools to latest versions.   | None                                                              | Yes                    |
| **RestoreOldContextMenu.ps1**     | Restores the classic context menu in Windows 11.              | None                                                              | Yes                    |
| **DeleteVM.ps1**                  | Deletes a specified virtual machine.                          | `--vmName <string>`                                               | Yes                    |
