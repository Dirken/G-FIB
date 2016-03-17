#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

in vec4 vfrontColor[];
out vec4 gfrontColor;

uniform vec3 boundingBoxMin;
uniform vec3 boundingBoxMax;
uniform mat4 modelViewProjectionMatrix;

in vec3 vVertex[];
in vec3 vNormal[];

uniform float speed = 0.5;
uniform float time;


void main( void )
{
	
    vec3 n = (vNormal[0] + vNormal[1] + vNormal[2])/3.0;
    vec3 T = speed*time*n;

    for( int i = 0 ; i < 3 ; i++ ) {
	gfrontColor = vfrontColor[i];
	gl_Position =  modelViewProjectionMatrix*vec4(vVertex[i] + T,1.0);
	EmitVertex();
    }
    EndPrimitive();
    
}/*#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

in vec4 vfrontColor[];
out vec4 gfrontColor;

in vec3 vnormal[];
in vec3 pos[];

uniform mat4 modelViewProjectionMatrix;
uniform float time;

const float speed = 0.5;

void main( void )
{
	vec3 n = (vnormal[0] + vnormal[1] + vnormal[2])/3;
	vec3 alpha = speed*time*n;
	for( int i = 0 ; i < 3 ; i++ )
  	{
		gfrontColor = vfrontColor[i];
		gl_Position = modelViewProjectionMatrix * (vec4(pos[i],0) +vec4(alpha,1));
		EmitVertex();
	}
    EndPrimitive();
}
*/
