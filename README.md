# Virtual Hardware Simulator (VHS)

## Build Instructions

### Build PIC64GX Embedded Image

`podman build . --file Containerfile.buildroot --tag buildroot`

### Build gem5 (Custom Branch)

`podman build . --file Containerfile.gem5 --tag gem5`

## Notes

### PIC64GX1000

- [PIC64-GX 64-bit Microprocessor Data Sheet](https://ww1.microchip.com/downloads/aemDocuments/documents/MPU64/ProductDocuments/DataSheets/PIC64GX1000-64-bit-Microprocessor-Data-Sheet-DS50003724.pdf)
- [Linux4Microchip GitHub](https://github.com/linux4microchip)
- [PIC64GX Buildroot configuration](https://github.com/linux4microchip/buildroot-external-microchip/blob/master/configs/pic64gx_curiosity_kit_defconfig)

## Future Plans

### PIC64-HPSC High-Performance Spaceflight Computing

Once release, we want to be able to model the [PIC64-HPSC1000](https://www.microchip.com/en-us/product/pic64-hpsc1000) radiation-hardened MPU.

## Tests

### Built-in gem5 Test
```
./build/RISCV/gem5.opt tests/gem5/riscv_boot_tests/configs/riscv_boot_exit_run.py -n 1 -c o3 -m classic -d SingleChannelDDR4_2400 -t 10000000000 -r ../vhs/
```

```
OpenSBI v1.3.1
   ____                    _____ ____ _____
  / __ \                  / ____|  _ \_   _|
 | |  | |_ __   ___ _ __ | (___ | |_) || |
 | |  | | '_ \ / _ \ '_ \ \___ \|  _ < | |
 | |__| | |_) |  __/ | | |____) | |_) || |_
  \____/| .__/ \___|_| |_|_____/|___/_____|
        | |
        |_|

Platform Name             : Generic
Platform Features         : medeleg
Platform HART Count       : 1
Platform IPI Device       : aclint-mswi
Platform Timer Device     : aclint-mtimer @ 10000000Hz
Platform Console Device   : uart8250
Platform HSM Device       : ---
Platform PMU Device       : ---
Platform Reboot Device    : ---
Platform Shutdown Device  : ---
Platform Suspend Device   : ---
Platform CPPC Device      : ---
Firmware Base             : 0x80000000
Firmware Size             : 194 KB
Firmware RW Offset        : 0x20000
Firmware RW Size          : 66 KB
Firmware Heap Offset      : 0x28000
Firmware Heap Size        : 34 KB (total), 2 KB (reserved), 9 KB (used), 22 KB (free)
Firmware Scratch Size     : 4096 B (total), 760 B (used), 3336 B (free)
Runtime SBI Version       : 1.0

Domain0 Name              : root
Domain0 Boot HART         : 0
Domain0 HARTs             : 0*
Domain0 Region00          : 0x0000000002008000-0x000000000200bfff M: (I,R,W) S/U: ()
Domain0 Region01          : 0x0000000002000000-0x0000000002007fff M: (I,R,W) S/U: ()
Domain0 Region02          : 0x0000000080000000-0x000000008001ffff M: (R,X) S/U: ()
Domain0 Region03          : 0x0000000080020000-0x000000008003ffff M: (R,W) S/U: ()
Domain0 Region04          : 0x0000000000000000-0xffffffffffffffff M: (R,W,X) S/U: (R,W,X)
Domain0 Next Address      : 0x0000000080200000
Domain0 Next Arg1         : 0x0000000087e00000
Domain0 Next Mode         : S-mode
Domain0 SysReset          : yes
Domain0 SysSuspend        : yes

Boot HART ID              : 0
Boot HART Domain          : root
Boot HART Priv Version    : v1.10
Boot HART Base ISA        : rv64imafdcv
Boot HART ISA Extensions  : time
Boot HART PMP Count       : 16
Boot HART PMP Granularity : 4
Boot HART PMP Address Bits: 54
Boot HART MHPM Count      : 0
Boot HART MIDELEG         : 0x0000000000000222
Boot HART MEDELEG         : 0x000000000000b109
```
