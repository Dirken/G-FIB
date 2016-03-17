#version 330 core

in vec4 frontColor;
in vec2 vtexCoord;
out vec4 fragColor;
uniform float time;
uniform sampler2D sampler;

void main()
{
	vec2 ull, boca, offset,aux;
	float radi = 0.025;
	offset.s = 0.057; offset.t = -0.172;
	ull.s = 0.393; ull.t = 1-0.348;
	boca.s = 0.45; boca.t = 1-0.52;
	if(fract(time) <= 0.5) {//ulls oberts fract(time) <= 0.5
		fragColor = texture(sampler, vtexCoord);
	}
	else{//Ulls tancats
		if(radi > distance(ull,vtexCoord)){
			fragColor = texture(sampler,boca+distance(ull,vtexCoord));
		}
		else fragColor = texture(sampler, vtexCoord);
	}
	
	
}

