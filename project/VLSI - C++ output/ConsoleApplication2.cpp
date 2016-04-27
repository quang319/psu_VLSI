// ConsoleApplication2.cpp : Defines the entry point for the console application.
//

#include "SkinToneDetector.h"

int main()
{
	for (int i = 0; i < 255; i += 5)
	{

		for (int j = 0; j < 255; j += 5)
		{
			for (int k = 0; k < 255; k += 5)
			{
				unsigned char output = get_skinscore((unsigned char) i, (unsigned char)j, (unsigned char)k);
			}
		}
	}
	
    return 0;
}