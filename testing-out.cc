#include <iostream>
using namespace std;



int main(){
	int count = 53;
	int vegades = 3;
	bool found = false;
	bool primer = true;
	for (int j = 0; j < 7; ++j){
		for (int k = 0; k < 8 and not found; ++k) {
			if (not primer) cout << "else ";
			cout << "if ("<< j*7+(k)<<"*slice"<< " <= time " << j*7+(k+1) <<"*slice"<< ") { ";
			if (j != 0){
				if (vegades > 0) {
					cout << "  ";
					--vegades;
				}
				
			}
			if (j == 0) cout << "  ";
			cout << "fragColor = ";
			cout << "texCoord.x* " << "(1/8) *" <<k << " , " << j << "+(1/6)*texCoord.y" <<"}" << endl;
			primer = false;
			--count;
			if (count == 0) found = true;
		}
	}
		
}
