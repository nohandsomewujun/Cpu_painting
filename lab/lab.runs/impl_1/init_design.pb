
v
Command: %s
53*	vivadotcl2E
1link_design -top pdu_cpu -part xc7a100ticsg324-1L2default:defaultZ4-113h px? 
g
#Design is defaulting to srcset: %s
437*	planAhead2
	sources_12default:defaultZ12-437h px? 
j
&Design is defaulting to constrset: %s
434*	planAhead2
	constrs_12default:defaultZ12-434h px? 
Y
Loading part %s157*device2&
xc7a100ticsg324-1L2default:defaultZ21-403h px? 
?
-Reading design checkpoint '%s' for cell '%s'
275*project2V
By:/Programs/Cpu_painting/lab/lab.srcs/sources_1/ip/clk50/clk50.dcp2default:default2
c22default:defaultZ1-454h px? 
?
-Reading design checkpoint '%s' for cell '%s'
275*project2T
@y:/Programs/Cpu_painting/lab/lab.srcs/sources_1/ip/VRAM/VRAM.dcp2default:default2
v12default:defaultZ1-454h px? 
?
-Reading design checkpoint '%s' for cell '%s'
275*project2b
Ny:/Programs/Cpu_painting/lab/lab.srcs/sources_1/ip/data_memory/data_memory.dcp2default:default2
c1/d12default:defaultZ1-454h px? 
?
-Reading design checkpoint '%s' for cell '%s'
275*project2p
\y:/Programs/Cpu_painting/lab/lab.srcs/sources_1/ip/instrcution_memory/instrcution_memory.dcp2default:default2
c1/i12default:defaultZ1-454h px? 
g
-Analyzing %s Unisim elements for replacement
17*netlist2
7952default:defaultZ29-17h px? 
j
2Unisim Transformation completed in %s CPU seconds
28*netlist2
02default:defaultZ29-28h px? 
x
Netlist was created with %s %s291*project2
Vivado2default:default2
2019.12default:defaultZ1-479h px? 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px? 
?
LRemoving redundant IBUF, %s, from the path connected to top-level port: %s 
35*opt2(
c2/inst/clkin1_ibufg2default:default2
clk2default:defaultZ31-35h px? 
?
?Could not create '%s' constraint because net '%s' is not directly connected to top level port. Synthesis is ignored for %s but preserved for implementation.
528*constraints2 
IBUF_LOW_PWR2default:default2 

c2/clk_in12default:default2 
IBUF_LOW_PWR2default:default8Z18-550h px? 
?
$Parsing XDC File [%s] for cell '%s'
848*designutils2^
Hy:/Programs/Cpu_painting/lab/lab.srcs/sources_1/ip/clk50/clk50_board.xdc2default:default2
c2/inst	2default:default8Z20-848h px? 
?
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2^
Hy:/Programs/Cpu_painting/lab/lab.srcs/sources_1/ip/clk50/clk50_board.xdc2default:default2
c2/inst	2default:default8Z20-847h px? 
?
$Parsing XDC File [%s] for cell '%s'
848*designutils2X
By:/Programs/Cpu_painting/lab/lab.srcs/sources_1/ip/clk50/clk50.xdc2default:default2
c2/inst	2default:default8Z20-848h px? 
?
%Done setting XDC timing constraints.
35*timing2X
By:/Programs/Cpu_painting/lab/lab.srcs/sources_1/ip/clk50/clk50.xdc2default:default2
572default:default8@Z38-35h px? 
?
Deriving generated clocks
2*timing2X
By:/Programs/Cpu_painting/lab/lab.srcs/sources_1/ip/clk50/clk50.xdc2default:default2
572default:default8@Z38-2h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2 
get_clocks: 2default:default2
00:00:102default:default2
00:00:102default:default2
1196.1562default:default2
531.9732default:defaultZ17-268h px? 
?
-Finished Parsing XDC File [%s] for cell '%s'
847*designutils2X
By:/Programs/Cpu_painting/lab/lab.srcs/sources_1/ip/clk50/clk50.xdc2default:default2
c2/inst	2default:default8Z20-847h px? 
?
Parsing XDC File [%s]
179*designutils2o
YY:/Programs/Cpu_painting/lab/lab.srcs/constrs_1/imports/cod_projects/Nexys4DDR_Master.xdc2default:default8Z20-179h px? 
?
Finished Parsing XDC File [%s]
178*designutils2o
YY:/Programs/Cpu_painting/lab/lab.srcs/constrs_1/imports/cod_projects/Nexys4DDR_Master.xdc2default:default8Z20-178h px? 
u
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02default:default2
02default:defaultZ31-138h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0022default:default2
1196.1562default:default2
0.0002default:defaultZ17-268h px? 
?
!Unisim Transformation Summary:
%s111*project2?
?  A total of 64 instances were transformed.
  RAM128X1D => RAM128X1D (RAMD64E, RAMD64E, MUXF7, MUXF7, RAMD64E, RAMD64E): 64 instances
2default:defaultZ1-111h px? 
?
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
132default:default2
22default:default2
02default:default2
02default:defaultZ4-41h px? 
]
%s completed successfully
29*	vivadotcl2
link_design2default:defaultZ4-42h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2!
link_design: 2default:default2
00:00:172default:default2
00:00:182default:default2
1196.1562default:default2
904.0392default:defaultZ17-268h px? 


End Record