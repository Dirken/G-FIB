#version 330 core

layout (location = 0) in vec3 vertex;
layout (location = 1) in vec3 normal;
layout (location = 2) in vec3 color;
layout (location = 3) in vec2 texCoord;

uniform vec3 boundingBoxMin; // cantonada mínima de la capsa englobant
uniform vec3 boundingBoxMax; // cantonada màxima de la capsa englobant

out vec3 frontColor;
out vec2 vtexCoord;

uniform mat4 modelViewProjectionMatrix;
uniform mat3 normalMatrix;


 
void main(){
	vec3 blue = vec3(0,0,1);
	vec3 green = vec3(0,1,0);
	vec3 red = vec3(1,0,0);
	vec3 cyan = vec3(0,1,1);
	vec3 yellow = vec3(1,1,0);
	vec3 color; 
	float ymax = boundingBoxMax.y;
	float ymin = boundingBoxMin.y ; 
	float unidad = (ymax - ymin) / 4; 
	if(ymax >= vertex.y && vertex.y > (ymin + (3* unidad))){
		float prop = (vertex.y - (ymin + 3* unidad))/unidad;
		color = mix(cyan, blue, prop); 
	}

	else if(ymin + 3* unidad >= vertex.y&& vertex.y  > (ymin + (2* unidad))){
		float prop = (vertex.y - (ymin + 2* unidad))/unidad;
		color = mix(green, cyan, prop); 
	}		
	else if(ymin + 2*unidad >= vertex.y && vertex.y > (ymin + unidad)){
		float prop = (vertex.y - (ymin + 1* unidad))/unidad;
		color = mix(yellow, green, prop); 
	}   
	else if(unidad +ymin >= vertex.y && (vertex.y > ymin)){
		float prop = (vertex.y - ymin)/unidad;
		color = mix(red, yellow, prop);  
	}				
    vec3 N = normalize(normalMatrix * normal);
    frontColor = color; 
    vtexCoord = texCoord;
    gl_Position = modelViewProjectionMatrix * vec4(vertex.xyz, 1.0);
}

//mix (YMAX, YMIN) RGB
				   
