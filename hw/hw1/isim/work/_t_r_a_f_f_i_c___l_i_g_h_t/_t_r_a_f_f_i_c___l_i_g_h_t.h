////////////////////////////////////////////////////////////////////////////////
//   ____  ____  
//  /   /\/   /  
// /___/  \  /   
// \   \   \/    
//  \   \        Copyright (c) 2003-2004 Xilinx, Inc.
//  /   /        All Right Reserved. 
// /___/   /\   
// \   \  /  \  
//  \___\/\___\ 
////////////////////////////////////////////////////////////////////////////////

#ifndef H_workM_t_r_a_f_f_i_c___l_i_g_h_t_H
#define H_workM_t_r_a_f_f_i_c___l_i_g_h_t_H

#ifdef _MSC_VER
#pragma warning(disable: 4355)
#endif

#ifdef __MINGW32__
#include "xsimMinGW.h"
#else
#include "xsim.h"
#endif

class workM_t_r_a_f_f_i_c___l_i_g_h_t : public HSim__s5{
public: 
    workM_t_r_a_f_f_i_c___l_i_g_h_t(const char *instname);
    ~workM_t_r_a_f_f_i_c___l_i_g_h_t();
    void setDefparam();
    void constructObject();
    void moduleInstantiate(HSimConfigDecl *cfg);
    void connectSigs();
    void reset();
    virtual void archImplement();
    HSim__s2 *driver_us0;
    HSim__s1 us[3];
    HSim__s3 uv[3];
    HSimVlogParam up[10];
};

#endif
