#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

out vec4 gfrontColor;
in vec3 vnormal[];
in vec4 vfrontColor[];

uniform mat4 modelViewProjectionMatrix;
uniform float d = 0.5;

void main( void )
{
	vec4 N = normalize(vec4(((vnormal[0] + vnormal[1] + vnormal[2])/3.0), 0.0));
	for( int i = 0 ; i < 3 ; i++ )
	{
		gfrontColor = vfrontColor[i];
		gl_Position = modelViewProjectionMatrix * gl_in[i].gl_Position;
		EmitVertex();		
	}
    EndPrimitive();

  for( int i = 0 ; i < 3 ; i++ )
	{
		gfrontColor = vfrontColor[i];
		gl_Position = modelViewProjectionMatrix * (gl_in[i].gl_Position + d*N);
		EmitVertex();
	}
    EndPrimitive();

  for( int i = 0 ; i < 3 ; i++ )
	{
		vec4 aux1 = modelViewProjectionMatrix * (gl_in[i].gl_Position + d*N);
		vec4 aux2 = modelViewProjectionMatrix * (gl_in[(i + 1)%3].gl_Position + d*N);
		gfrontColor = vec4(normalize((cross(aux1.xyz, aux2.xyz))).z);
		gl_Position = aux1;
		EmitVertex();
		gl_Position = aux2;
		EmitVertex();
		gl_Position = modelViewProjectionMatrix * gl_in[i].gl_Position;
		EmitVertex();		
		gl_Position = modelViewProjectionMatrix * gl_in[(i + 1)%3].gl_Position;
		EmitVertex();		
	}
    EndPrimitive();
}
