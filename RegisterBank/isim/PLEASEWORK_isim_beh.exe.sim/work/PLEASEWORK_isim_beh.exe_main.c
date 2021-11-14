/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

#include "xsi.h"

struct XSI_INFO xsi_info;



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    work_m_13087300670111431221_2679331840_init();
    work_m_02801036786732474123_2501440112_init();
    work_m_02009637976334663206_3385901664_init();
    work_m_07966685923572299824_1723761585_init();
    work_m_16827536921476101228_2415336395_init();
    work_m_16099994766132079480_1258791838_init();
    work_m_16541823861846354283_2073120511_init();


    xsi_register_tops("work_m_16099994766132079480_1258791838");
    xsi_register_tops("work_m_16541823861846354283_2073120511");


    return xsi_run_simulation(argc, argv);

}
