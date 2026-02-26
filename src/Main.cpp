/* Importations: */
#include <iostream>


/* Main code: */
int main(int argc, char **argv)
{
	std::cout << "Hello, World from " << *(argv) << " in line " << __LINE__ << "!" << std::endl;

	return 0;
}
