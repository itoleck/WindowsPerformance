# List of Windows 10 WPR profile System Provider keywords

|      **Keyword**     |           **Notes**           |      **Events**      |      **Graphs**      |
| ---------------------|-------------------------------|----------------------|----------------------|
|**AllFaults**|Different page fault information, need memory capture as well.|PageFault: Demand Zero, PageFault: Transition, PageFault: Copy on Write, PageFault [Provider], PageFault: Guard Page, PageFault: Hard Page Fault|None|
|**Alpc**|Asynchronous Local Procedure Call events. Need ProcessThread keyword for Process/Thread info.|ALPC: Receive Message, ALPC: Send Message, ALPC: Unwait, ALPC: Wait for Reply, ALPC: Wait for New Message, ALPC: Close Port, ALPC: Connect Request, ALPC: Connect Success|System Activity->Generic Events|
|**AntiStarvation**|Unknown, may need other keywords or related stack|
|**CacheFlush**|Unknown, may need other keywords or related stack|
|**CC**|Captures provider 7687a439-f752-45b8-b741-321aec0f8df9, May have something to do with Kernel compile, C language|
|**ClockInterrupt**|PerfInfo events, need ProcessThread keyword for Process/Thread info||System Activity->Generic Events|
|**ClusterOff**|Unknown, may need other keywords or related stack|
|**CompactCSwitch**|Unknown, may need other keywords or related stack|
|**ContiguousMemorygeneration**|Unknown, may need other keywords or related stack|
|**CpuConfig**|Unknown, may need other keywords or related stack|
|**CSwitch**|Need CpuConfig keyword or error. Context switching information. Thread provider. Useless without ProcessThread, ReadyThread keywords||CPU Usage (Precise)|
|**DiskIO**|Disk utilization information. Works better with ProcessThread keyword|[DiskIO]DiskIo: Read, DiskIo: Flush, DiskIo: Write, [FileIO]Filename: Create, Filename: Delete, Filename: Rundown|Disk Usage|
|**DiskIOInit**|Disk utilization information for write and flush Inits. DiskIO provider|DiskIO: Write Init, DiskIO: Flush Init|None|
|**DPC**|Kernel CPU DPC information|Dpc, TimerDpc|DPC/ISR|
|**DPCQueue**|Queue of DPCs on CPUs. PerfInfo provider.|DpcEnqueue, DpcExecute|System Activity->Generic Events|
|**Drivers**|Driver (.sys) usage information. Events in DiskIO & FileIO providers. Need other keywords to be useful: (CpuConfig, CSwitch, DiskIO, Loader, ProcessThread)|Driver: [DiskIO]Major Function Call, Driver: Major Function Return, Driver: Complete Request, Driver: Complete Request Return, Driver: Completion Routine Return, [FileIO]Filename: Rundown, Filename: Create, Filename: Delete|Device I/O|
|**FileIO**|File API events. Needs other keywords to be useful. (FileIOInit, ProcessThread)|FileIo: OperationEnd|None, unless more keywords are set|
|**FileIOInit**|File API events. Needs other keywords to be useful. (FileIO, ProcessThread)|FileIo: Create, FileIo: Close, FileIo: Cleanup, FileIo: QueryInfo, FileIo: DirEnum, FileIo: FSCTL, FileIo: Write, FileIo: Read, FileIo: QuerySecurity, FileIo: SetInfo, FileIo: QueryEA, FileIo: Flush, FileIo: Rename, FileIo: RenamePath, FileIo: Delete, FileIo: DirNotify, FileIo: DeletePath, FileIo: SetSecurity|File I/O|
|**Filename**|File API Events. Same events as Drivers keyword.|[FileIO]Filename: Rundown, Filename: Create, Filename: Delete|None|
|**FilterIO**|File/Mini Filter events. Needs other keywords to be useful. (FileIO, FileIOInit, FilterIOFailure, FilterIOFastIO, FilterIOInit, ProcessThread)|[FileIO]FileIo [Provider]|Storage->Mini-Filter Delays|
|**FilterIOFailure**|
|**FilterIOFastIO**|
|**FilterIOInit**|
|**FootPrint**|Memory usage information. Very high amount of events and data captured, 100s of MB per second or more. Contains all changed memory pages while trace is running.|[PageFault]Memory: PageInMemory, Session: End Rundown, Memory: MemInfoExWS, Memory: MemInfo, Memory: KeMemUsage, Memory: MemInfoExSessionWS, [Pool]Pool: BigPoolSnap End Rundown, Pool: PoolSnap End Rundown, Pool: BigPoolSnap Session End Rundown, Pool: PoolSnap Session End Rundown|Memory->Memory Utilization, Memory->Resident Set, Memory->Total Commit, Memory->Virtual Memory Snapshots|
|**KeClock**|Clock information|[Perfinfo]Clock: Dynamic Tick Veto, Clock: Mode Switch, Clock: Time Update|None|
|**Handle**|Handle information|[Object]Object [Provider]|Memory->Handles|
|**HardFaults**|Hard Fault/Paging information|[PageFault]Hardfault|Memory->Hard Faults|
|**HvHypercalls**|Hyper-v Hypercall information|[Perfinfo]Kernel Hypercall|Hyper-V->Hypercall Kernel Stack|
|**IdealProcessor**|Thread Scheduler Ideal CPU information|[Thread]Thread: Set Ideal Processor, Thread: Set User Ideal Processor|System Activity->General Events|
|**IdleStates**|CPU Power Idle State information|[Power]Power: Enter Idle State, Power: Exit Idle State|Power->CPU Idle States, Power->PDC Resiliency Activity, Power->Platform Idle State|
|**InterProcessorInterrupt**|Inter-Processor Interrupt(IPI) information. May be important to track on large CPU systems or CPUs with different CPU core strengths.|[Perinfo]Interprocessor Interrupt (IPI): Receive, Interprocessor Interrupt (IPI): Send|Computation->IPI Information|
|**Interrupt**|CPU Interrupt information|[Perfinfo]Interrupt, Message Signaled Interrupt|None|
|**KernelQueue**|Kernel Queue Thread information|[Thread]Thread: Kernel Queue Dequeue, Thread: Kernel Queue Enqueue|System Activity->General Events|
|**Loader**|Image loading information. Image PDB information.|[ImageId]ImageId: Info, DbgId: RSDS, DbgId: Portable PDB, DbgId: Deterministic, ImageId: FileVersion, DbgId: ILRSDS, DbgId: None, DbgId: DBG, DbgId: Embedded PDB, DbgId: Error; [Image]Image: End Rundown, Image: Load, Image: Unload, Image: Kernel Base, Image [Provider]|System Activity->Images|
|**Memory**|Detailed memory usage information, High # of events per second. May include other keywords (MemoryInfo, MemoryInfoWS). Section information. Pool memory information|Pool: Free, Pool: BigPoolSnap End Rundown, Pool: Allocate Session, Pool: Free Session, Pool: PoolSnap End Rundown, Pool: BigPoolSnap Session End Rundown, Pool: PoolSnap Session  Rundown, Memory: KeMemUsage, Memory: MemInfo, Memory: MemInfoExSessionWS, Memory: MemInfoExWS, Memory: PageAccess, Memory: PageAccessEx, Memory: PageInMemory, Memory: PageRangeAccess, Memory: PageRangeRelease, Memory: PageRelease, Section: Create, Section: Delete, Section: SectionObject Create, Section: SectionObject Delete|Memory->Memory Utilization, Pool Graphs, Resident Set, Total Commit, Virtual Memory Snapshots|
|**NonTradeableMemory**|Error, may rely on other keywords to enable|
|**MemoryInfo**|General system memory information|[PageFault]Memory: MemInfo, Memory: MMStat|Memory->Memory Utilization|
|**MemoryInfoWS**|General system working set memory information. More information needed, may be total working set since boot?|[PageFault]Memory: MemInfoExWS, Memory: MemInfoExSessionWS|Memory->Virtual Memory Snapshots|
|**NetworkTrace**|TCP/IP Send, receive, connect and disconnect information. Does not include packets.|[UdpIp]Udp: Send, Udp: Receive; [TcpIp]TCP: Send, TCP: Receive, TCP: Connect, TCP: Disconnect|System Activity->Generic Events|
|**Object**|Possibly Kernel Object information|[Object]Object [Provider]|System Activity->Generic Events|
|**OpticalIO**|No useful information on optical disks(CD/DVD/Bluray). Does not show optical usage even with OpticalIOInit/DiskIO/DiskIOInit and ProcessThread keywords.|[DiskIO]DiskIo [Provider]|System Activity->Generic Events|
|**OpticalIOInit**|No useful information on optical disks(CD/DVD/Bluray). Does not show optical usage even with OpticalIO/DiskIO/DiskIOInit and ProcessThread keywords.|[DiskIO]DiskIo [Provider]|System Activity->Generic Events|
|**Pool**|Kernel Pool Memory information.|[Pool]Pool: Free, Pool: Allocate, Pool: Free Session, Pool: Allocate Session, Pool: BigPoolSnap End Rundown, Pool: PoolSnap End Rundown, Pool: BigPoolSnap Session End Rundown, Pool: PoolSnap Session End Rundown|Memory->Pool Graphs|
|**Power**|CPU power state information|[Power]Power: Perf State Change, Power: Idle State Change|Power->CPU Idle States, Other->CPU Frequency|
|**PmcProfile**|Unknown, may need other keywords or related stack|
|**ProcessCounter**|Unknown, may need ProcessThread keyword
|**ProcessFreeze**|Unknown, may need ProcessThread keyword
|**ProcessThread**|Running processes information|||
|**ReadyThread**|Running process and thread information|[Thread]Thread: Create, Thread: Delete, Thread: End Rundown, Thread: Set Name[Process]Process: Create, Process: Delete, Process: Terminate, Process: Zombie, Process: End Rundown|System Activity->Processes, System Activity->Thread Lifetimes|
|**ReferenceSet**|Unknown, may need other keywords or related stack. May only be used with heap capture|
|**Registry**|Registry usage information|[Registry]Registry: Query Value, Registry: Open Key, Registry: Close Key, Registry: Kcb: End Rundown, Registry: Enumerate Keys, Registry: Query Key, Registry: Kcb: Create, Registry: Kcb: Delete, Registry: Query Security, Registry: Enumerate Values, Registry: Set Information, Registry: Set Value, Registry: Create Key, Registry: Counters, Registry: Config|Storage->Registry, System Activity->Generic Events|
|**RegistryHive**|Very low number of events, use with Registry keyword|[Registry]Registry: Config, Registry: Counters, Registry: Hive: Dirty, Registry: Hive: End Rundown|Storage->Registry(No Data), System Activity->Generic Events|
|**SampledProfile**|Sampled CPU information. Setting the 'wpr.exe -setprofint' argument will control how often samples are taken. Best when used with other keywords; CpuConfig, ProcessThread|[Perfinfo]Sampled Profile|Computation->CPU Usage (Sampled)|
|**Session**|Memory related. Combine with other memory keywords|[Pagefault]Section: Create, Section: Delete, Section: SectionObject Create, Section: SectionObject Delete, Session: End Rundown|None|
|**SpinLock**|Thread spinlocks. Combine with other thread keywords.|[Thread]Thread: Spinlock|System Activity->Generic Events|
|**SplitIO**|Unknown, may need other keywords or related stack|
|**SynchronizationObjects**|Thread Synchronization Objects information.|[Thread]Thread: Resource|System Activity->Generic Events|
|**SystemCall**|System Call information(User mode->Kernel mode). Best when included with other keywords and stack information|[Perfinfo]SysCall: Enter, SysCall: Exit|System Activity->Generic Events|
|**ThreadPriority**|Thread Priority information. Combine with other thread keywords.|[Thread]Thread: SetBasePriority, Thread: Set Page Priority, Thread: Set I/O Priority, Thread: SetPriority|System Activity->Generic Events|
|**Timer**|System/Kernel timer information|[Perfinfo]Timer: Set Thread, Timer: Cancel, Timer: Expiration, Timer: Expiration Start, Timer: Set One Shot Timer, KTimer2: Set, 
KTimer2: Expiration, Timer: Set Periodic Timer, KTimer2: Cancel, KTimer2: Disable, KTimer2: Finalization|System Activity->Generic Events|
|**VAMap**|File mapping information|[FileIO]File: Map, File: Unmap, File: End Rundown|None|
|**VirtualAllocation**|Virtual Memory Allocation information|[PageFault]Memory: VirtualAlloc, Memory: VirtualFree, Memory: VirtualAlloc End Rundown, PageFault [Provider]|Memory->VirtualAlloc Commit Lifetimes, Other->Virtual Allocations|
|**WakeCounter**|Unknown, may need other keywords or related stack|[Process]|None|
|**WakeDrop**|Unknown, may need other keywords or related stack|
|**WakeEvent**|Unknown, may need other keywords or related stack|
|**WDFDPC**|Unknown, may need other keywords or related stack|[Perfinfo]WDF: Dpc|
|**WDFInterrupt**|Unknown, may need other keywords or related stack|[Perfinfo]WDF: Interrupt|
|**HiberRundown**|Unknown, may need other keywords or related stack|
