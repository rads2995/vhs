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
