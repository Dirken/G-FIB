 #version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

out vec4 frontColor;
out vec2 vtexCoord;
const float PI = 3.14159;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;
uniform float time; //temps en segons
mat3 MatrixRotation;
mat3 MatrixRotation2;



void main()
{
	float angle = 0.18*(sin(time));
	float angle2 = -0.18*(sin(time));
	MatrixRotation[0][0] = cos(angle);
	MatrixRotation[0][1] = -sin(angle);
	MatrixRotation[0][2] = 0;
		
	MatrixRotation[1][0] = sin(angle);
	MatrixRotation[1][1] = cos(angle);
	MatrixRotation[1][2] = 0;
		
	MatrixRotation[2][0] = 0;
	MatrixRotation[2][1] = 0;
	MatrixRotation[2][2] = 1;
	
	MatrixRotation2[0][0] = cos(angle2);
	MatrixRotation2[0][1] = -sin(angle2);
	MatrixRotation2[0][2] = 0;
		
	MatrixRotation2[1][0] = sin(angle2);
	MatrixRotation2[1][1] = cos(angle2);
	MatrixRotation2[1][2] = 0;
		
	MatrixRotation2[2][0] = 0;
	MatrixRotation2[2][1] = 0;
	MatrixRotation2[2][2] = 1;
	vec3 P = vertex.xyz;
	vec3 N = normalize(normalMatrix * normal);
	P.y = P.y - 0.94;
	
    frontColor = vec4(normalize(normalMatrix*normal).z);
    vtexCoord = texCoord;
    vec3 PosicioRotada = P.xyz*MatrixRotation;
    vec3 PosicioRotada2 = P.xyz*MatrixRotation2;
    float y = P.y;
    float x = P.x;
    float param =  clamp(-3.0*y, 0.0, 1.0);
     if (y < 0){
		if (x < 0){
			P = mix(P, PosicioRotada2, param);			
		}
		else if (x > 0) {
			P = mix(P, PosicioRotada, param);	
		}
	}
	P.y = P.y + 0.94;
	gl_Position = modelViewProjectionMatrix* vec4(P, 1.0);
}


