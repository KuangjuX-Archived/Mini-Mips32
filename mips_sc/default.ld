OUTPUT_ARCH(mips)
ENTRY(main)
SECTIONS
{
        . = 0x00000000;
        .text : 
        {
            *(.text)
            _etext = .;
        }

        . = 0x10000000;
        .data : 
        {
            *(.data)              
        }

	.bss :
        {
            *(.bss)
        }

} 
