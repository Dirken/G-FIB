#version 330 core
        
layout(triangles) in;
layout(triangle_strip, max_vertices = 36) out;

in vec4 vfrontColor[];
out vec4 gfrontColor;
in float yMin[];
in float xMin[];
in float zMin[];
in float xMax[];
in float zMax[];
uniform mat4 modelViewProjectionMatrix;

void main( void )
{
	
	for( int i = 0 ; i < 3 ; i++ )
	{
		if (gl_PrimitiveIDIn == 0){
			//Primer triangle
			gfrontColor = vec4(0,1,1,1);
			gl_Position = modelViewProjectionMatrix*vec4(xMax[i], yMin[i]-0.01, zMax[i],gl_in[i].gl_Position.w);
			EmitVertex();
			gfrontColor = vec4(0,1,1,1);
			gl_Position = modelViewProjectionMatrix*vec4(xMax[i], yMin[i]-0.01, zMin[i],gl_in[i].gl_Position.w);
			EmitVertex();
			gfrontColor = vec4(0,1,1,1);
			gl_Position = modelViewProjectionMatrix*vec4(xMin[i], yMin[i]-0.01, zMin[i],gl_in[i].gl_Position.w);
			EmitVertex();

			EndPrimitive();
			//Segon triangle
			gfrontColor = vec4(0,1,1,1);
			gl_Position = modelViewProjectionMatrix*vec4(xMax[i], yMin[i]-0.01, zMax[i],gl_in[i].gl_Position.w);
			EmitVertex();
			gfrontColor = vec4(0,1,1,1);
			gl_Position = modelViewProjectionMatrix*vec4(xMin[i], yMin[i]-0.01, zMax[i],gl_in[i].gl_Position.w);
			EmitVertex();
			gfrontColor = vec4(0,1,1,1);
			gl_Position = modelViewProjectionMatrix*vec4(xMin[i], yMin[i]-0.01, zMin[i],gl_in[i].gl_Position.w);
			EmitVertex();

			EndPrimitive();
		}
		else {
			gfrontColor = vfrontColor[i];
			gl_Position = modelViewProjectionMatrix*gl_in[i].gl_Position;
			EmitVertex();
		}
	}
    EndPrimitive();
    for( int i = 0 ; i < 3 ; i++ )
	{
		gfrontColor = vec4(0,0,0,0);
		gl_Position = modelViewProjectionMatrix*vec4(gl_in[i].gl_Position.x, yMin[i], gl_in[i].gl_Position.z,gl_in[i].gl_Position.w);
		EmitVertex();
	}
    EndPrimitive();
}
 
