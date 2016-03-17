#version 330 core

in vec4 frontColor;
in vec2 vtexCoord;
out vec4 fragColor;

uniform sampler2D tex;
uniform int textureSize;
uniform int edgeSize = 2;
uniform float threshold = 0.1;
float textureSize = 1024;

void main(){
	float left =   vtexCoord + edgeSize * vec2(-1, 0) / textureSize;
	float right =  vtexCoord + edgeSize * vec2(1, 0) / textureSize;
	float bottom = vtexCoord + edgeSize * vec2(0, -1) / textureSize;
	float top = 	 vtexCoord + edgeSize * vec2(0, 1) / textureSize;
	float GX = abs(tex(right) - tex(left));
	float GY = abs(tex(top) - tex(bottom));
 	fragColor = texture(sampler, vtexCoord);
 	if(threshold < GX && threshold < GY) fragColor = vec4(0.,0.,0.,1.0);
 	else fragColor = texture(sampler, vtexCoord);
}



