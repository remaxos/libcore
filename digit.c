#define MAX_DIGITS 100

int nr_digits_int(int n)
{
	int nr_digits;
	
	nr_digits = 0;
	
	while (n) {
		n /= 10;	
		nr_digits++;
	}
	return nr_digits;
}

int nr_digits_long_int(long int n)
{
	int nr_digits;
	
	nr_digits = 0;
	
	while (n) {
		n /= 10;	
		nr_digits++;
	}
	return nr_digits;
}

int get_digits(int n)
{
	char digits[MAX_DIGITS];	

	while (n) {
		n /= 10;
	}

	return 0;
}
