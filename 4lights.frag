#version 330 core

in vec4 frontColor;
out vec4 fragColor;

in vec3 normalVec;
in vec3 posFrag;

uniform mat4 modelViewMatrixInverse;
uniform bool rotate;
uniform float time;


vec4 light(vec3 V, vec3 N, vec3 P, vec3 lightPos, vec3 lightColor){
	const float shininess = 100.0;
	const float Kd = 0.5;
	N = normalize(N);
	vec3 L = normalize(lightPos - P);
	vec3 R = normalize(2.0*dot(N,L)*N-L);
	float NdotL = max(0.0, dot(N,L));
	float RdotV = max(0.0, dot(R,V));
	float spec =  pow( RdotV, shininess);
	if (NdotL<=0) spec = 0;
	return vec4(Kd*lightColor*NdotL + vec3(spec),0);
}

void main()
{
	
	vec3 V = (modelViewMatrixInverse*vec4(0.0,0.0,0.0,1.0)).xyz - posFrag;
	//vec3 L = ((modelViewMatrixInverse)*lightPosition).xyz - P;
	vec3 posVerd, posGroc, posBlau, posVermell;
	if (rotate) {
		mat3 rot = transpose(mat3(vec3(cos(time),-sin(time),0), vec3(sin(time),cos(time),0), vec3(0,0,1)));
		posVerd    = (modelViewMatrixInverse* vec4(rot*vec3(0.0,10.0,0.0),1.0)).xyz;
		posGroc    = (modelViewMatrixInverse* vec4(rot*vec3(0.0,-10.0,0.0),1.0)).xyz;
		posBlau    = (modelViewMatrixInverse* vec4(rot*vec3(10.0,0.0,0.0),1.0)).xyz;
		posVermell = (modelViewMatrixInverse* vec4(rot*vec3(-10.0,0.0,0.0),1.0)).xyz;
	}
	else{
		posVerd = (modelViewMatrixInverse* vec4(0.0,10.0,0.0,1.0)).xyz;
		posGroc = (modelViewMatrixInverse* vec4(0.0,-10.0,0.0,1.0)).xyz;
		posBlau = (modelViewMatrixInverse* vec4(10.0,0.0,0,1.0)).xyz;
		posVermell = (modelViewMatrixInverse* vec4(-10.0,0.0,0.0,1.0)).xyz;
	}	
	
    fragColor = light(normalize(V),normalVec, posFrag, posVerd,vec3(0,1,0)) + 
				light(normalize(V),normalVec, posFrag, posGroc,vec3(1,1,0)) +
				light(normalize(V),normalVec, posFrag, posBlau,vec3(0,0,1)) +
				light(normalize(V),normalVec, posFrag, posVermell,vec3(1,0,0));
}
