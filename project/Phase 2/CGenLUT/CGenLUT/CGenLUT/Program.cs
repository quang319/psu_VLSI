using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;

namespace CGenLUT
{

    class Program
    {
        const double W_Cb = 46.97;
        const int WL_Cb = 23;
        const int WH_Cb = 14;
        const double W_Cr = 38.76;
        const int WL_Cr = 20;
        const int WH_Cr = 10;
        const int K_l = 125;
        const int K_h = 188;

        const double Cx = 109.38;
        const double Cy = 152.02;
        const double Theta = 2.53;
        const double ECx = 1.60;
        const double ECy = 2.41;
        const int Y_min = 16;
        const int Y_max = 235;
        static void Main(string[] args)
        {
            List<short> listCr = new List<short>();
            List<short> listCb = new List<short>();
            List<double> listCr_exp = new List<double>();
            List<double> listCb_exp = new List<double>();
            short resultCr;
            short resultCb;
            for (int i = 0; i < 256; i++)
            {
                double CrTemp = MeanCr(i);
                double CbTemp = MeanCb(i);
                resultCr = doubleToShort(CrTemp);
                resultCb = doubleToShort(CbTemp);
                listCr_exp.Add(CrTemp);
                listCb_exp.Add(CbTemp);
                listCr.Add(resultCr);
                listCb.Add(resultCb);
            }

            System.IO.File.WriteAllText("MeanCr_LUT.list", string.Empty);
            using (StreamWriter writer = new StreamWriter("MeanCr_LUT.list"))
            {
                foreach(short item in listCr)
                {
                    //writer.WriteLine(Convert.ToString(item,2).PadLeft(16,'0'));
                    writer.WriteLine(item.ToString("X").PadLeft(4, '0'));
                }
            }
        }

        static double MeanCr(int Y)
        {
            if (Y <= K_l)
            {
                return WL_Cr + (Y - Y_min) * (W_Cr - WL_Cr) / (K_l - Y_min);
            }
            else if (K_h <= Y)
            {
                return WH_Cr + (Y_max - Y) * (W_Cr - WH_Cr) / (Y_max - K_h);
            }
            else
                return 0.0;
        }

        static double MeanCb(int Y)
        {
            if (Y <= K_l)
                return WL_Cb + (Y - Y_min) * (W_Cb - WL_Cb) / (K_l - Y_min);
            else if (K_h <= Y)
                return WH_Cb + (Y_max - Y) * (W_Cb - WH_Cb) / (Y_max - K_h);
            else
                return 0.0;
        }

        static short doubleToShort(double input)
        {
            return Convert.ToInt16(input * 256.0);
        }

    }
}
