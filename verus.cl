

//#define BYTE(x, y)			(amd_bfe((uint)((x) >> ((y >= 32U) ? 32U : 0U)), (y) - (((y) >= 32) ? 32U : 0), 8U))

//__constant static const uint sbox[64] = { 0x7b777c63, 0xc56f6bf2, 0x2b670130, 0x76abd7fe, 0x7dc982ca, 0xf04759fa, 0xafa2d4ad, 0xc072a49c, 0x2693fdb7, 0xccf73f36, 0xf1e5a534, 0x1531d871, 0xc323c704, 0x9a059618, 0xe2801207, 0x75b227eb, 0x1a2c8309, 0xa05a6e1b, 0xb3d63b52, 0x842fe329, 0xed00d153, 0x5bb1fc20, 0x39becb6a, 0xcf584c4a, 0xfbaaefd0, 0x85334d43, 0x7f02f945, 0xa89f3c50, 0x8f40a351, 0xf5389d92, 0x21dab6bc, 0xd2f3ff10, 0xec130ccd, 0x1744975f, 0x3d7ea7c4, 0x73195d64, 0xdc4f8160, 0x88902a22, 0x14b8ee46, 0xdb0b5ede, 0x0a3a32e0, 0x5c240649, 0x62acd3c2, 0x79e49591, 0x6d37c8e7, 0xa94ed58d, 0xeaf4566c, 0x08ae7a65, 0x2e2578ba, 0xc6b4a61c, 0x1f74dde8, 0x8a8bbd4b, 0x66b53e70, 0x0ef60348, 0xb9573561, 0x9e1dc186, 0x1198f8e1, 0x948ed969, 0xe9871e9b, 0xdf2855ce, 0x0d89a18c, 0x6842e6bf, 0x0f2d9941, 0x16bb54b0 };
__constant static const unsigned char sbox[256] =
{ 0x63, 0x7c, 0x77, 0x7b, 0xf2, 0x6b, 0x6f, 0xc5, 0x30, 0x01, 0x67, 0x2b, 0xfe,
  0xd7, 0xab, 0x76, 0xca, 0x82, 0xc9, 0x7d, 0xfa, 0x59, 0x47, 0xf0, 0xad, 0xd4,
  0xa2, 0xaf, 0x9c, 0xa4, 0x72, 0xc0, 0xb7, 0xfd, 0x93, 0x26, 0x36, 0x3f, 0xf7,
  0xcc, 0x34, 0xa5, 0xe5, 0xf1, 0x71, 0xd8, 0x31, 0x15, 0x04, 0xc7, 0x23, 0xc3,
  0x18, 0x96, 0x05, 0x9a, 0x07, 0x12, 0x80, 0xe2, 0xeb, 0x27, 0xb2, 0x75, 0x09,
  0x83, 0x2c, 0x1a, 0x1b, 0x6e, 0x5a, 0xa0, 0x52, 0x3b, 0xd6, 0xb3, 0x29, 0xe3,
  0x2f, 0x84, 0x53, 0xd1, 0x00, 0xed, 0x20, 0xfc, 0xb1, 0x5b, 0x6a, 0xcb, 0xbe,
  0x39, 0x4a, 0x4c, 0x58, 0xcf, 0xd0, 0xef, 0xaa, 0xfb, 0x43, 0x4d, 0x33, 0x85,
  0x45, 0xf9, 0x02, 0x7f, 0x50, 0x3c, 0x9f, 0xa8, 0x51, 0xa3, 0x40, 0x8f, 0x92,
  0x9d, 0x38, 0xf5, 0xbc, 0xb6, 0xda, 0x21, 0x10, 0xff, 0xf3, 0xd2, 0xcd, 0x0c,
  0x13, 0xec, 0x5f, 0x97, 0x44, 0x17, 0xc4, 0xa7, 0x7e, 0x3d, 0x64, 0x5d, 0x19,
  0x73, 0x60, 0x81, 0x4f, 0xdc, 0x22, 0x2a, 0x90, 0x88, 0x46, 0xee, 0xb8, 0x14,
  0xde, 0x5e, 0x0b, 0xdb, 0xe0, 0x32, 0x3a, 0x0a, 0x49, 0x06, 0x24, 0x5c, 0xc2,
  0xd3, 0xac, 0x62, 0x91, 0x95, 0xe4, 0x79, 0xe7, 0xc8, 0x37, 0x6d, 0x8d, 0xd5,
  0x4e, 0xa9, 0x6c, 0x56, 0xf4, 0xea, 0x65, 0x7a, 0xae, 0x08, 0xba, 0x78, 0x25,
  0x2e, 0x1c, 0xa6, 0xb4, 0xc6, 0xe8, 0xdd, 0x74, 0x1f, 0x4b, 0xbd, 0x8b, 0x8a,
  0x70, 0x3e, 0xb5, 0x66, 0x48, 0x03, 0xf6, 0x0e, 0x61, 0x35, 0x57, 0xb9, 0x86,
  0xc1, 0x1d, 0x9e, 0xe1, 0xf8, 0x98, 0x11, 0x69, 0xd9, 0x8e, 0x94, 0x9b, 0x1e,
  0x87, 0xe9, 0xce, 0x55, 0x28, 0xdf, 0x8c, 0xa1, 0x89, 0x0d, 0xbf, 0xe6, 0x42,
0x68, 0x41, 0x99, 0x2d, 0x0f, 0xb0, 0x54, 0xbb, 0x16 };

#define XT(x) (((x) << 1) ^ ((((x) >> 7) & 1) * 0x1b))

void memcpy_decker(unsigned char *dst, unsigned char *src, int len) {
	int i;
	for (i = 0; i< len; i++) { dst[i] = src[i]; }
}
void aesenc(unsigned char *s,__local uchar sharedMemory1[256])
{
	uchar i, t, u;
	uchar v[4][4];

	for (i = 0; i < 16; ++i) {
		v[((i >> 2) + 4 - (i & 3)) & 3][i & 3] = sharedMemory1[s[i]];
	}

	for (i = 0; i < 4; ++i) {
		t = v[i][0];
		u = v[i][0] ^ v[i][1] ^ v[i][2] ^ v[i][3];
		v[i][0] = v[i][0] ^ u ^ XT(v[i][0] ^ v[i][1]);
		v[i][1] = v[i][1] ^ u ^ XT(v[i][1] ^ v[i][2]);
		v[i][2] = v[i][2] ^ u ^ XT(v[i][2] ^ v[i][3]);
		v[i][3] = v[i][3] ^ u ^ XT(v[i][3] ^ t);
	}
	for (i = 0; i < 16; ++i) {
		s[i] = (unsigned char)v[i >> 2][i & 3]; // VerusHash have 0 rc vector
	}
}

// Simulate _mm_unpacklo_epi32
void unpacklo32(unsigned char *t, unsigned char *a, unsigned char *b)
{
	unsigned char tmp[16];
	memcpy_decker(tmp, a, 4);
	memcpy_decker(tmp + 4, b, 4);
	memcpy_decker(tmp + 8, a + 4, 4);
	memcpy_decker(tmp + 12, b + 4, 4);
	memcpy_decker(t, tmp, 16);
}

// Simulate _mm_unpackhi_epi32
void unpackhi32(unsigned char *t, unsigned char *a, unsigned char *b)
{
	unsigned char tmp[16];
	memcpy_decker(tmp, a + 8, 4);
	memcpy_decker(tmp + 4, b + 8, 4);
	memcpy_decker(tmp + 8, a + 12, 4);
	memcpy_decker(tmp + 12, b + 12, 4);
	memcpy_decker(t, tmp, 16);

}
__kernel __attribute__((reqd_work_group_size(256, 1, 1)))
__kernel void kernel_verushash(__global uchar *midstate, __global uint *output, __global ulong *target, __global uint *counter)
{ 
    //printf("horsemeat salad");
	__private uint gid = get_global_id(0);
    //    __private uint lid = get_local_id(0);   //needed if worksize is reduced
	__private unsigned char s[64] , tmp[32];
        __local uchar sharedMemory1[256];   //sharemem fastest
	__private uchar in[64];
     
        
	int i, j;

	//if (lid < 256) //		for (i = 0; i < 64; ++i)
            sharedMemory1[lid] = sbox[lid];
        

	for (i = 0; i < 32; ++i)
		s[i] = midstate[i];  //copy midstate to s

	for (i = 32; i < 64; ++i)
			s[i] = 0x00;  
        
	((uint *)&s[0])[8] = gid;
	for (i = 0; i < 64; ++i)
                in[i] = s[i];  
	
   mem_fence(CLK_LOCAL_MEM_FENCE);

	for (i = 0; i < 5; ++i) {
		// aes round(s)
		
		for (j = 0; j < 2; ++j) {

			aesenc(s, sharedMemory1);
			aesenc(s + 16, sharedMemory1);
			aesenc(s + 32, sharedMemory1);
			aesenc(s + 48, sharedMemory1);
		}

		unpacklo32(tmp, s, s + 16);

		unpackhi32(s, s, s + 16);
		unpacklo32(s + 16, s + 32, s + 48);

		unpackhi32(s + 32, s + 32, s + 48);
		unpacklo32(s + 48, s, s + 32);
		unpackhi32(s, s, s + 32);
		unpackhi32(s + 32, s + 16, tmp);

		unpacklo32(s + 16, s + 16, tmp);

	}

	
	for (i = 0; i < 64; i++) {
		s[i] = s[i] ^ in[i];
	}

	/* Truncated */
	memcpy_decker(tmp, s + 8, 8);
	memcpy_decker(tmp + 8, s + 24, 8);
	memcpy_decker(tmp + 16, s + 32, 8);
	memcpy_decker(tmp + 24, s + 48, 8);
       // mem_fence(CLK_LOCAL_MEM_FENCE);   
        
if(((ulong*)&tmp[0])[3] < target[3])
{ 
   output[0] = gid;
   
}
      
        
        
       // mem_fence(CLK_LOCAL_MEM_FENCE);
}
// Simulate _mm_aesenc_si128 instructions from AESNI


