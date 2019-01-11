texture godray;

float contrast = 11;
float saturation = 0.8;

sampler GodraySampler = sampler_state
{
    Texture = <godray>;
	MinFilter = Linear;
    MagFilter = Linear;
    MipFilter = Linear;
    AddressU = Clamp;
    AddressV = Clamp;
};


float4 GodRayPixelShader(float2 texCoords : TEXCOORD) : COLOR
{
	float4 godrayColor = tex2D(GodraySampler, texCoords);
	
	float4 baseColor = (godrayColor*3);
	baseColor.rgb /= 3;

	baseColor.r *= 1+0.05*saturation;
	baseColor.g *= 1;
	baseColor.b *= 1+0.1*saturation;
	
	float4 workColor1 = baseColor;
	float4 workColor2 = baseColor;
	float4 workColor3 = baseColor;

	workColor1.rgb *= pow(workColor1.rgb, (workColor1.r - contrast * 2) + 1.0f) * 0;
	workColor1.rgb += workColor3.rgb;
	
	workColor2.rgb *= pow(workColor2.rgb, (workColor2.r - contrast * 2) + 1.0f) * 0;
	workColor2.rgb += workColor3.rgb;	
	
	float value = (workColor2.r + workColor2.g + workColor2.b) / 3;
	workColor2.r = value;
	workColor2.g = value;
	workColor2.b = value;
	
	float4 finalColor = (workColor1 * saturation) + (workColor2 * (1 - saturation));
	
	return finalColor;
}

technique ImageQuality
{
    pass Pass0
    {
		PixelShader = compile ps_2_0 GodRayPixelShader();
    }
}