texture Tex;
texture noiseTexture;

float SparkleSize = 3;
float4 DiffuseColor;

float2 gUVPrePosition = float2( 0, 0 );
float2 gUVScale = float2( 1.0f, 1.0f );                     // UV scale
float2 gUVScaleCenter = float2( 0.5f, 0.5f );
float gUVRotAngle = 0;                   // UV Rotation
float2 gUVRotCenter = float2( 0.5f, 0.5f );
float2 gUVPosition = float2( 0, 0 );              // UV position

#include "tex_matrix.fx"
#include "mta-helper.fx"

sampler TextureSampler = sampler_state
{
    Texture   = (Tex);
};

sampler noiseSampler = sampler_state
{
	Texture = (noiseTexture);
};

struct VertexShaderInput
{
	float3 Position : POSITION0;
    //float3 Normal : NORMAL0;
    //float4 Diffuse : COLOR0;
    float2 TexCoord : TEXCOORD0;
};

struct PixelShaderInput
{
	float4 Position : POSITION0;
	//float4 Diffuse : COLOR0;
    float2 TexCoord : TEXCOORD0;
};

PixelShaderInput VertexShaderFunction(VertexShaderInput VS)
{
    // Initialize result
    PixelShaderInput PS = (PixelShaderInput)0;

    // Calculate screen pos of vertex
    PS.Position = mul(float4(VS.Position, 1), gWorldViewProjection);

    // Pass through tex coord
    PS.TexCoord = VS.TexCoord;

    // Calculate GTA lighting for buildings
    //PS.Diffuse = MTACalcGTABuildingDiffuse( VS.Diffuse );

    // Return result
    return PS;
}

float4 PixelShaderFunction(PixelShaderInput PS) : COLOR0
{
	float2 IncomingUVs = PS.TexCoord * SparkleSize;
	float4 TextureMap_6522 = tex2D(noiseSampler, IncomingUVs);
	
	float2 Sparkle2UVs = (IncomingUVs + gCameraDirection.x + gCameraDirection.y + gCameraDirection.z);
	float4 TextureMap_6083 = tex2D(noiseSampler, Sparkle2UVs);
	
	float CustomCode_546 = (TextureMap_6522.r * TextureMap_6083.g) * 1;

	float4 color = tex2D(TextureSampler, PS.TexCoord) + CustomCode_546;
		
    return color * DiffuseColor;
}

float3x3 getTextureTransform()
{
    return makeTextureTransform( gUVPrePosition, gUVScale, gUVScaleCenter, gUVRotAngle, gUVRotCenter, gUVPosition );
}

technique tec0
{
	pass P0
	{
		//VertexShader = compile vs_1_1 VertexShaderFunction();
        PixelShader = compile ps_2_0 PixelShaderFunction();
	}
	
	pass P1
	{
		// Set the UV thingy
        TextureTransform[0] = getTextureTransform();

        // Enable UV thingy
		TextureTransformFlags[0] = Count2;
	}

}

technique fallback
{
    pass P0
    {
		Texture[0] = Tex;
    }
}