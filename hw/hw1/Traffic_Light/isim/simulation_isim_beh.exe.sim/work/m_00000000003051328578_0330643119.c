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

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/quang/Dropbox/School/Penn State/Spring/CSE 557 - VLSI/Traffic_Light/TRAFFIC_LIGHT.v";
static int ng1[] = {1, 0};
static unsigned int ng2[] = {6U, 0U};
static unsigned int ng3[] = {0U, 0U};
static unsigned int ng4[] = {4U, 0U};
static unsigned int ng5[] = {1U, 0U};
static int ng6[] = {0, 0};
static unsigned int ng7[] = {9U, 0U};
static unsigned int ng8[] = {2U, 0U};
static unsigned int ng9[] = {3U, 0U};
static unsigned int ng10[] = {5U, 0U};
static unsigned int ng11[] = {145U, 0U};
static unsigned int ng12[] = {65U, 0U};
static unsigned int ng13[] = {33U, 0U};
static unsigned int ng14[] = {25U, 0U};
static unsigned int ng15[] = {20U, 0U};
static unsigned int ng16[] = {18U, 0U};
static unsigned int ng17[] = {17U, 0U};



static void Always_33_0(char *t0)
{
    char t6[8];
    char t32[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t7;
    char *t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    char *t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    char *t29;
    char *t30;
    char *t31;
    char *t33;
    char *t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    char *t47;
    char *t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    char *t54;
    char *t55;
    char *t56;
    char *t57;
    int t58;

LAB0:    t1 = (t0 + 4368U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(33, ng0);
    t2 = (t0 + 4936);
    *((int *)t2) = 1;
    t3 = (t0 + 4400);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(33, ng0);

LAB5:    xsi_set_current_line(35, ng0);
    t4 = (t0 + 2568U);
    t5 = *((char **)t4);
    t4 = ((char*)((ng1)));
    memset(t6, 0, 8);
    t7 = (t5 + 4);
    t8 = (t4 + 4);
    t9 = *((unsigned int *)t5);
    t10 = *((unsigned int *)t4);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t7);
    t13 = *((unsigned int *)t8);
    t14 = (t12 ^ t13);
    t15 = (t11 | t14);
    t16 = *((unsigned int *)t7);
    t17 = *((unsigned int *)t8);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB9;

LAB6:    if (t18 != 0)
        goto LAB8;

LAB7:    *((unsigned int *)t6) = 1;

LAB9:    t22 = (t6 + 4);
    t23 = *((unsigned int *)t22);
    t24 = (~(t23));
    t25 = *((unsigned int *)t6);
    t26 = (t25 & t24);
    t27 = (t26 != 0);
    if (t27 > 0)
        goto LAB10;

LAB11:    xsi_set_current_line(40, ng0);

LAB21:    xsi_set_current_line(41, ng0);
    t2 = (t0 + 3128);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);

LAB22:    t5 = ((char*)((ng3)));
    t58 = xsi_vlog_unsigned_case_compare(t4, 3, t5, 3);
    if (t58 == 1)
        goto LAB23;

LAB24:    t2 = ((char*)((ng5)));
    t58 = xsi_vlog_unsigned_case_compare(t4, 3, t2, 3);
    if (t58 == 1)
        goto LAB25;

LAB26:    t2 = ((char*)((ng8)));
    t58 = xsi_vlog_unsigned_case_compare(t4, 3, t2, 3);
    if (t58 == 1)
        goto LAB27;

LAB28:    t2 = ((char*)((ng9)));
    t58 = xsi_vlog_unsigned_case_compare(t4, 3, t2, 3);
    if (t58 == 1)
        goto LAB29;

LAB30:    t2 = ((char*)((ng4)));
    t58 = xsi_vlog_unsigned_case_compare(t4, 3, t2, 3);
    if (t58 == 1)
        goto LAB31;

LAB32:    t2 = ((char*)((ng10)));
    t58 = xsi_vlog_unsigned_case_compare(t4, 3, t2, 3);
    if (t58 == 1)
        goto LAB33;

LAB34:    t2 = ((char*)((ng2)));
    t58 = xsi_vlog_unsigned_case_compare(t4, 3, t2, 3);
    if (t58 == 1)
        goto LAB35;

LAB36:
LAB38:
LAB37:    xsi_set_current_line(80, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 3128);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 3, 0LL);

LAB39:
LAB12:    goto LAB2;

LAB8:    t21 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB9;

LAB10:    xsi_set_current_line(35, ng0);

LAB13:    xsi_set_current_line(36, ng0);
    t28 = (t0 + 3128);
    t29 = (t28 + 56U);
    t30 = *((char **)t29);
    t31 = ((char*)((ng2)));
    memset(t32, 0, 8);
    t33 = (t30 + 4);
    t34 = (t31 + 4);
    t35 = *((unsigned int *)t30);
    t36 = *((unsigned int *)t31);
    t37 = (t35 ^ t36);
    t38 = *((unsigned int *)t33);
    t39 = *((unsigned int *)t34);
    t40 = (t38 ^ t39);
    t41 = (t37 | t40);
    t42 = *((unsigned int *)t33);
    t43 = *((unsigned int *)t34);
    t44 = (t42 | t43);
    t45 = (~(t44));
    t46 = (t41 & t45);
    if (t46 != 0)
        goto LAB15;

LAB14:    if (t44 != 0)
        goto LAB16;

LAB17:    t48 = (t32 + 4);
    t49 = *((unsigned int *)t48);
    t50 = (~(t49));
    t51 = *((unsigned int *)t32);
    t52 = (t51 & t50);
    t53 = (t52 != 0);
    if (t53 > 0)
        goto LAB18;

LAB19:
LAB20:    xsi_set_current_line(37, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 3128);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 3, 0LL);
    goto LAB12;

LAB15:    *((unsigned int *)t32) = 1;
    goto LAB17;

LAB16:    t47 = (t32 + 4);
    *((unsigned int *)t32) = 1;
    *((unsigned int *)t47) = 1;
    goto LAB17;

LAB18:    xsi_set_current_line(36, ng0);
    t54 = (t0 + 3128);
    t55 = (t54 + 56U);
    t56 = *((char **)t55);
    t57 = (t0 + 3448);
    xsi_vlogvar_assign_value(t57, t56, 0, 0, 3);
    goto LAB20;

LAB23:    xsi_set_current_line(42, ng0);
    t7 = (t0 + 3288);
    t8 = (t7 + 56U);
    t21 = *((char **)t8);
    t22 = ((char*)((ng4)));
    memset(t6, 0, 8);
    t28 = (t21 + 4);
    if (*((unsigned int *)t28) != 0)
        goto LAB41;

LAB40:    t29 = (t22 + 4);
    if (*((unsigned int *)t29) != 0)
        goto LAB41;

LAB44:    if (*((unsigned int *)t21) < *((unsigned int *)t22))
        goto LAB42;

LAB43:    t31 = (t6 + 4);
    t9 = *((unsigned int *)t31);
    t10 = (~(t9));
    t11 = *((unsigned int *)t6);
    t12 = (t11 & t10);
    t13 = (t12 != 0);
    if (t13 > 0)
        goto LAB45;

LAB46:    xsi_set_current_line(44, ng0);

LAB48:    xsi_set_current_line(45, ng0);
    t2 = ((char*)((ng5)));
    t3 = (t0 + 3128);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 3, 0LL);
    xsi_set_current_line(46, ng0);
    t2 = ((char*)((ng6)));
    t3 = (t0 + 3288);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 4, 0LL);

LAB47:    goto LAB39;

LAB25:    xsi_set_current_line(48, ng0);
    t3 = (t0 + 3288);
    t5 = (t3 + 56U);
    t7 = *((char **)t5);
    t8 = ((char*)((ng7)));
    memset(t6, 0, 8);
    t21 = (t7 + 4);
    if (*((unsigned int *)t21) != 0)
        goto LAB50;

LAB49:    t22 = (t8 + 4);
    if (*((unsigned int *)t22) != 0)
        goto LAB50;

LAB53:    if (*((unsigned int *)t7) < *((unsigned int *)t8))
        goto LAB51;

LAB52:    t29 = (t6 + 4);
    t9 = *((unsigned int *)t29);
    t10 = (~(t9));
    t11 = *((unsigned int *)t6);
    t12 = (t11 & t10);
    t13 = (t12 != 0);
    if (t13 > 0)
        goto LAB54;

LAB55:    xsi_set_current_line(50, ng0);

LAB57:    xsi_set_current_line(51, ng0);
    t2 = ((char*)((ng8)));
    t3 = (t0 + 3128);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 3, 0LL);
    xsi_set_current_line(52, ng0);
    t2 = ((char*)((ng6)));
    t3 = (t0 + 3288);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 4, 0LL);

LAB56:    goto LAB39;

LAB27:    xsi_set_current_line(54, ng0);
    t3 = (t0 + 3288);
    t5 = (t3 + 56U);
    t7 = *((char **)t5);
    t8 = ((char*)((ng8)));
    memset(t6, 0, 8);
    t21 = (t7 + 4);
    if (*((unsigned int *)t21) != 0)
        goto LAB59;

LAB58:    t22 = (t8 + 4);
    if (*((unsigned int *)t22) != 0)
        goto LAB59;

LAB62:    if (*((unsigned int *)t7) < *((unsigned int *)t8))
        goto LAB60;

LAB61:    t29 = (t6 + 4);
    t9 = *((unsigned int *)t29);
    t10 = (~(t9));
    t11 = *((unsigned int *)t6);
    t12 = (t11 & t10);
    t13 = (t12 != 0);
    if (t13 > 0)
        goto LAB63;

LAB64:    xsi_set_current_line(56, ng0);

LAB66:    xsi_set_current_line(57, ng0);
    t2 = ((char*)((ng9)));
    t3 = (t0 + 3128);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 3, 0LL);
    xsi_set_current_line(58, ng0);
    t2 = ((char*)((ng6)));
    t3 = (t0 + 3288);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 4, 0LL);

LAB65:    goto LAB39;

LAB29:    xsi_set_current_line(60, ng0);
    t3 = (t0 + 3288);
    t5 = (t3 + 56U);
    t7 = *((char **)t5);
    t8 = ((char*)((ng4)));
    memset(t6, 0, 8);
    t21 = (t7 + 4);
    if (*((unsigned int *)t21) != 0)
        goto LAB68;

LAB67:    t22 = (t8 + 4);
    if (*((unsigned int *)t22) != 0)
        goto LAB68;

LAB71:    if (*((unsigned int *)t7) < *((unsigned int *)t8))
        goto LAB69;

LAB70:    t29 = (t6 + 4);
    t9 = *((unsigned int *)t29);
    t10 = (~(t9));
    t11 = *((unsigned int *)t6);
    t12 = (t11 & t10);
    t13 = (t12 != 0);
    if (t13 > 0)
        goto LAB72;

LAB73:    xsi_set_current_line(62, ng0);

LAB75:    xsi_set_current_line(63, ng0);
    t2 = ((char*)((ng4)));
    t3 = (t0 + 3128);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 3, 0LL);
    xsi_set_current_line(64, ng0);
    t2 = ((char*)((ng6)));
    t3 = (t0 + 3288);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 4, 0LL);

LAB74:    goto LAB39;

LAB31:    xsi_set_current_line(66, ng0);
    t3 = (t0 + 3288);
    t5 = (t3 + 56U);
    t7 = *((char **)t5);
    t8 = ((char*)((ng7)));
    memset(t6, 0, 8);
    t21 = (t7 + 4);
    if (*((unsigned int *)t21) != 0)
        goto LAB77;

LAB76:    t22 = (t8 + 4);
    if (*((unsigned int *)t22) != 0)
        goto LAB77;

LAB80:    if (*((unsigned int *)t7) < *((unsigned int *)t8))
        goto LAB78;

LAB79:    t29 = (t6 + 4);
    t9 = *((unsigned int *)t29);
    t10 = (~(t9));
    t11 = *((unsigned int *)t6);
    t12 = (t11 & t10);
    t13 = (t12 != 0);
    if (t13 > 0)
        goto LAB81;

LAB82:    xsi_set_current_line(68, ng0);

LAB84:    xsi_set_current_line(69, ng0);
    t2 = ((char*)((ng10)));
    t3 = (t0 + 3128);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 3, 0LL);
    xsi_set_current_line(70, ng0);
    t2 = ((char*)((ng6)));
    t3 = (t0 + 3288);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 4, 0LL);

LAB83:    goto LAB39;

LAB33:    xsi_set_current_line(72, ng0);
    t3 = (t0 + 3288);
    t5 = (t3 + 56U);
    t7 = *((char **)t5);
    t8 = ((char*)((ng8)));
    memset(t6, 0, 8);
    t21 = (t7 + 4);
    if (*((unsigned int *)t21) != 0)
        goto LAB86;

LAB85:    t22 = (t8 + 4);
    if (*((unsigned int *)t22) != 0)
        goto LAB86;

LAB89:    if (*((unsigned int *)t7) < *((unsigned int *)t8))
        goto LAB87;

LAB88:    t29 = (t6 + 4);
    t9 = *((unsigned int *)t29);
    t10 = (~(t9));
    t11 = *((unsigned int *)t6);
    t12 = (t11 & t10);
    t13 = (t12 != 0);
    if (t13 > 0)
        goto LAB90;

LAB91:    xsi_set_current_line(74, ng0);

LAB93:    xsi_set_current_line(75, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 3128);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 3, 0LL);
    xsi_set_current_line(76, ng0);
    t2 = ((char*)((ng6)));
    t3 = (t0 + 3288);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 4, 0LL);

LAB92:    goto LAB39;

LAB35:    xsi_set_current_line(79, ng0);
    t3 = (t0 + 3448);
    t5 = (t3 + 56U);
    t7 = *((char **)t5);
    t8 = (t0 + 3128);
    xsi_vlogvar_wait_assign_value(t8, t7, 0, 0, 3, 0LL);
    goto LAB39;

LAB41:    t30 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t30) = 1;
    goto LAB43;

LAB42:    *((unsigned int *)t6) = 1;
    goto LAB43;

LAB45:    xsi_set_current_line(43, ng0);
    t33 = (t0 + 3288);
    t34 = (t33 + 56U);
    t47 = *((char **)t34);
    t48 = ((char*)((ng1)));
    memset(t32, 0, 8);
    xsi_vlog_unsigned_add(t32, 32, t47, 4, t48, 32);
    t54 = (t0 + 3288);
    xsi_vlogvar_wait_assign_value(t54, t32, 0, 0, 4, 0LL);
    goto LAB47;

LAB50:    t28 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t28) = 1;
    goto LAB52;

LAB51:    *((unsigned int *)t6) = 1;
    goto LAB52;

LAB54:    xsi_set_current_line(49, ng0);
    t30 = (t0 + 3288);
    t31 = (t30 + 56U);
    t33 = *((char **)t31);
    t34 = ((char*)((ng1)));
    memset(t32, 0, 8);
    xsi_vlog_unsigned_add(t32, 32, t33, 4, t34, 32);
    t47 = (t0 + 3288);
    xsi_vlogvar_wait_assign_value(t47, t32, 0, 0, 4, 0LL);
    goto LAB56;

LAB59:    t28 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t28) = 1;
    goto LAB61;

LAB60:    *((unsigned int *)t6) = 1;
    goto LAB61;

LAB63:    xsi_set_current_line(55, ng0);
    t30 = (t0 + 3288);
    t31 = (t30 + 56U);
    t33 = *((char **)t31);
    t34 = ((char*)((ng1)));
    memset(t32, 0, 8);
    xsi_vlog_unsigned_add(t32, 32, t33, 4, t34, 32);
    t47 = (t0 + 3288);
    xsi_vlogvar_wait_assign_value(t47, t32, 0, 0, 4, 0LL);
    goto LAB65;

LAB68:    t28 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t28) = 1;
    goto LAB70;

LAB69:    *((unsigned int *)t6) = 1;
    goto LAB70;

LAB72:    xsi_set_current_line(61, ng0);
    t30 = (t0 + 3288);
    t31 = (t30 + 56U);
    t33 = *((char **)t31);
    t34 = ((char*)((ng1)));
    memset(t32, 0, 8);
    xsi_vlog_unsigned_add(t32, 32, t33, 4, t34, 32);
    t47 = (t0 + 3288);
    xsi_vlogvar_wait_assign_value(t47, t32, 0, 0, 4, 0LL);
    goto LAB74;

LAB77:    t28 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t28) = 1;
    goto LAB79;

LAB78:    *((unsigned int *)t6) = 1;
    goto LAB79;

LAB81:    xsi_set_current_line(67, ng0);
    t30 = (t0 + 3288);
    t31 = (t30 + 56U);
    t33 = *((char **)t31);
    t34 = ((char*)((ng1)));
    memset(t32, 0, 8);
    xsi_vlog_unsigned_add(t32, 32, t33, 4, t34, 32);
    t47 = (t0 + 3288);
    xsi_vlogvar_wait_assign_value(t47, t32, 0, 0, 4, 0LL);
    goto LAB83;

LAB86:    t28 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t28) = 1;
    goto LAB88;

LAB87:    *((unsigned int *)t6) = 1;
    goto LAB88;

LAB90:    xsi_set_current_line(73, ng0);
    t30 = (t0 + 3288);
    t31 = (t30 + 56U);
    t33 = *((char **)t31);
    t34 = ((char*)((ng1)));
    memset(t32, 0, 8);
    xsi_vlog_unsigned_add(t32, 32, t33, 4, t34, 32);
    t47 = (t0 + 3288);
    xsi_vlogvar_wait_assign_value(t47, t32, 0, 0, 4, 0LL);
    goto LAB92;

}

static void Always_85_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    int t8;
    char *t9;
    char *t10;

LAB0:    t1 = (t0 + 4616U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(85, ng0);
    t2 = (t0 + 4952);
    *((int *)t2) = 1;
    t3 = (t0 + 4648);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(85, ng0);

LAB5:    xsi_set_current_line(86, ng0);
    t4 = (t0 + 3128);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);

LAB6:    t7 = ((char*)((ng3)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 3, t7, 3);
    if (t8 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng5)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 3, t2, 3);
    if (t8 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng8)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 3, t2, 3);
    if (t8 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng9)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 3, t2, 3);
    if (t8 == 1)
        goto LAB13;

LAB14:    t2 = ((char*)((ng4)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 3, t2, 3);
    if (t8 == 1)
        goto LAB15;

LAB16:    t2 = ((char*)((ng10)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 3, t2, 3);
    if (t8 == 1)
        goto LAB17;

LAB18:    t2 = ((char*)((ng2)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 3, t2, 3);
    if (t8 == 1)
        goto LAB19;

LAB20:
LAB21:    goto LAB2;

LAB7:    xsi_set_current_line(87, ng0);
    t9 = ((char*)((ng11)));
    t10 = (t0 + 2968);
    xsi_vlogvar_assign_value(t10, t9, 0, 0, 8);
    goto LAB21;

LAB9:    xsi_set_current_line(88, ng0);
    t3 = ((char*)((ng12)));
    t4 = (t0 + 2968);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 8);
    goto LAB21;

LAB11:    xsi_set_current_line(89, ng0);
    t3 = ((char*)((ng13)));
    t4 = (t0 + 2968);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 8);
    goto LAB21;

LAB13:    xsi_set_current_line(90, ng0);
    t3 = ((char*)((ng14)));
    t4 = (t0 + 2968);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 8);
    goto LAB21;

LAB15:    xsi_set_current_line(91, ng0);
    t3 = ((char*)((ng15)));
    t4 = (t0 + 2968);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 8);
    goto LAB21;

LAB17:    xsi_set_current_line(92, ng0);
    t3 = ((char*)((ng16)));
    t4 = (t0 + 2968);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 8);
    goto LAB21;

LAB19:    xsi_set_current_line(93, ng0);
    t3 = ((char*)((ng17)));
    t4 = (t0 + 2968);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 8);
    goto LAB21;

}


extern void work_m_00000000003051328578_0330643119_init()
{
	static char *pe[] = {(void *)Always_33_0,(void *)Always_85_1};
	xsi_register_didat("work_m_00000000003051328578_0330643119", "isim/simulation_isim_beh.exe.sim/work/m_00000000003051328578_0330643119.didat");
	xsi_register_executes(pe);
}
