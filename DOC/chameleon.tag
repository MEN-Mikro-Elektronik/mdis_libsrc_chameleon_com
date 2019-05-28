<?xml version='1.0' encoding='ISO-8859-1' standalone='yes'?>
<tagfile>
  <compound kind="page">
    <filename>index</filename>
    <title></title>
    <name>index</name>
  </compound>
  <compound kind="file">
    <name>chameleon.c</name>
    <path>/opt/menlinux/LIBSRC/CHAMELEON/COM/</path>
    <filename>chameleon_8c</filename>
    <class kind="struct">CHAMELEON_HDL</class>
    <member kind="function">
      <type>CHAMELEONV0_STATIC_EXTERN void</type>
      <name>ChameleonTerm</name>
      <anchor>a0</anchor>
      <arglist>(CHAMELEON_HANDLE **chahP)</arglist>
    </member>
    <member kind="function">
      <type>CHAMELEONV0_STATIC_EXTERN int32</type>
      <name>ChameleonInit</name>
      <anchor>a1</anchor>
      <arglist>(OSS_HANDLE *osh, int pciBus, int pciDev, CHAMELEON_HANDLE **chahP)</arglist>
    </member>
    <member kind="function">
      <type>CHAMELEONV0_STATIC_EXTERN int32</type>
      <name>ChameleonGlobalIdent</name>
      <anchor>a2</anchor>
      <arglist>(CHAMELEON_HANDLE *h, char *variantP, int *revisionP)</arglist>
    </member>
    <member kind="function">
      <type>CHAMELEONV0_STATIC_EXTERN int32</type>
      <name>ChameleonUnitIdent</name>
      <anchor>a3</anchor>
      <arglist>(CHAMELEON_HANDLE *h, int idx, CHAMELEON_UNIT *info)</arglist>
    </member>
    <member kind="function">
      <type>CHAMELEONV0_STATIC_EXTERN int32</type>
      <name>ChameleonUnitFind</name>
      <anchor>a4</anchor>
      <arglist>(CHAMELEON_HANDLE *h, int modCode, int instance, CHAMELEON_UNIT *info)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>chameleon.h</name>
    <path>/opt/menlinux/INCLUDE/COM/MEN/</path>
    <filename>chameleon_8h</filename>
    <class kind="struct">CHAM_FUNCTBL</class>
    <class kind="struct">CHAMELEON_UNIT</class>
    <class kind="struct">CHAMELEONV2_BA</class>
    <class kind="struct">CHAMELEONV2_BRIDGE</class>
    <class kind="struct">CHAMELEONV2_CPU</class>
    <class kind="struct">CHAMELEONV2_FIND</class>
    <class kind="struct">CHAMELEONV2_INFO</class>
    <class kind="struct">CHAMELEONV2_TABLE</class>
    <class kind="struct">CHAMELEONV2_UNIT</class>
    <class kind="struct">FPGA_HEADER_INFO</class>
    <member kind="define">
      <type>#define</type>
      <name>CHAMELEONV2_PCIDEV_ILL</name>
      <anchor>a0</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>CHAMELEONV2_PCIDEV_ERR</name>
      <anchor>a1</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>CHAMELEONV2_TABLE_NOT_FOUND</name>
      <anchor>a2</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>CHAMELEONV2_TABLE_REV_UNSUP</name>
      <anchor>a3</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>CHAMELEONV2_TABLE_ERR</name>
      <anchor>a4</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>CHAMELEONV2_DTYPE_UNSUP</name>
      <anchor>a5</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>CHAMELEONV2_BAR_UNASSIGNED</name>
      <anchor>a6</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>CHAMELEONV2_BARDESC_MISSING</name>
      <anchor>a7</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>CHAMELEONV2_HANDLE_ILL</name>
      <anchor>a8</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>CHAMELEONV2_OUT_OF_RES</name>
      <anchor>a9</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>CHAMELEONV2_NO_MORE_ENTRIES</name>
      <anchor>a10</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>CHAMELEONV2_UNIT_FOUND</name>
      <anchor>a0</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>CHAMELEONV2_BRIDGE_FOUND</name>
      <anchor>a1</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>CHAMELEONV2_CPU_FOUND</name>
      <anchor>a2</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>CHAMELEON_MAGIC_00</name>
      <anchor>a0</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>CHAMELEON_MAGIC_01</name>
      <anchor>a1</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>CHAMELEON_MAGIC_02</name>
      <anchor>a2</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>CHAMELEONV2_BUSTYPE_WB</name>
      <anchor>a0</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>CHAMELEONV2_BUSTYPE_AV</name>
      <anchor>a1</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>CHAMELEONV2_BUSTYPE_LPC</name>
      <anchor>a2</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>CHAMELEONV2_BUSTYPE_ISA</name>
      <anchor>a3</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>CHAMELEONV2_FF_BRGALL</name>
      <anchor>a0</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>CHAMELEONV2_FILENAME_SIZE</name>
      <anchor>a117</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>void</type>
      <name>CHAMELEONV2_HANDLE</name>
      <anchor>a138</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>int32</type>
      <name>ChameleonInit</name>
      <anchor>a140</anchor>
      <arglist>(OSS_HANDLE *, int pciBus, int pciDev, CHAMELEON_HANDLE **)</arglist>
    </member>
    <member kind="function">
      <type>int32</type>
      <name>ChameleonGlobalIdent</name>
      <anchor>a141</anchor>
      <arglist>(CHAMELEON_HANDLE *, char *variantP, int *revisionP)</arglist>
    </member>
    <member kind="function">
      <type>int32</type>
      <name>ChameleonUnitIdent</name>
      <anchor>a142</anchor>
      <arglist>(CHAMELEON_HANDLE *, int idx, CHAMELEON_UNIT *)</arglist>
    </member>
    <member kind="function">
      <type>int32</type>
      <name>ChameleonUnitFind</name>
      <anchor>a143</anchor>
      <arglist>(CHAMELEON_HANDLE *, int modCode, int instance, CHAMELEON_UNIT *)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>ChameleonTerm</name>
      <anchor>a144</anchor>
      <arglist>(CHAMELEON_HANDLE **)</arglist>
    </member>
    <member kind="function">
      <type>int32</type>
      <name>ChameleonLoadEm01</name>
      <anchor>a145</anchor>
      <arglist>(OSS_HANDLE *osh, const FPGA_HEADER *fpgaCode, void *pldRegBase)</arglist>
    </member>
    <member kind="function">
      <type>int32</type>
      <name>ChameleonLoadEp01</name>
      <anchor>a146</anchor>
      <arglist>(OSS_HANDLE *osh, const FPGA_HEADER *fpgaCode, void *pldRegBase)</arglist>
    </member>
    <member kind="function">
      <type>int32</type>
      <name>ChameleonLoadEm03</name>
      <anchor>a147</anchor>
      <arglist>(OSS_HANDLE *osh, const FPGA_HEADER *fpgaCode, void *pldRegBase)</arglist>
    </member>
    <member kind="function">
      <type>int32</type>
      <name>ChameleonLoadEm04</name>
      <anchor>a149</anchor>
      <arglist>(OSS_HANDLE *osh, const FPGA_HEADER *fpgaCode)</arglist>
    </member>
    <member kind="function">
      <type>int32</type>
      <name>ChameleonFpgaCodeIdentEm04</name>
      <anchor>a150</anchor>
      <arglist>(const FPGA_HEADER *fpgaCode, int *variantP, int *revisionP)</arglist>
    </member>
    <member kind="function">
      <type>int32</type>
      <name>ChameleonLoad_A015</name>
      <anchor>a151</anchor>
      <arglist>(OSS_HANDLE *osh, int icNumber, const FPGA_HEADER *fpgaCode)</arglist>
    </member>
    <member kind="function">
      <type>const char *</type>
      <name>ChameleonModName</name>
      <anchor>a152</anchor>
      <arglist>(u_int16 modCode)</arglist>
    </member>
    <member kind="function">
      <type>const char *</type>
      <name>CHAM_DevIdToName</name>
      <anchor>a153</anchor>
      <arglist>(u_int16 devId)</arglist>
    </member>
    <member kind="function">
      <type>u_int16</type>
      <name>CHAM_ModCodeToDevId</name>
      <anchor>a154</anchor>
      <arglist>(u_int16 modCode)</arglist>
    </member>
    <member kind="function">
      <type>u_int16</type>
      <name>CHAM_DevIdToModCode</name>
      <anchor>a155</anchor>
      <arglist>(u_int16 devId)</arglist>
    </member>
    <member kind="function">
      <type>int32</type>
      <name>ChameleonFpgaHeaderIdent</name>
      <anchor>a156</anchor>
      <arglist>(const void *_hdr, u_int32 maxSize, FPGA_HEADER_INFO *info)</arglist>
    </member>
    <member kind="function">
      <type>int32</type>
      <name>ChameleonFpgaDataXor</name>
      <anchor>a157</anchor>
      <arglist>(const u_int32 *p, u_int32 nBytes, u_int32 *xorP)</arglist>
    </member>
    <member kind="function">
      <type>int32</type>
      <name>ChameleonFpgaDataCheckXor</name>
      <anchor>a158</anchor>
      <arglist>(FPGA_HEADER_INFO *info)</arglist>
    </member>
    <member kind="function">
      <type>int32</type>
      <name>ChameleonFpgaHeaderOkForBoard</name>
      <anchor>a159</anchor>
      <arglist>(const FPGA_HEADER_INFO *info, const char *mainProductName, const char *carrierName)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>chameleon_int.h</name>
    <path>/opt/menlinux/LIBSRC/CHAMELEON/COM/</path>
    <filename>chameleon__int_8h</filename>
  </compound>
  <compound kind="file">
    <name>chameleon_strings.c</name>
    <path>/opt/menlinux/LIBSRC/CHAMELEON/COM/</path>
    <filename>chameleon__strings_8c</filename>
    <member kind="function">
      <type>const char *</type>
      <name>ChameleonModName</name>
      <anchor>a0</anchor>
      <arglist>(u_int16 modCode)</arglist>
    </member>
    <member kind="function">
      <type>const char *</type>
      <name>CHAM_DevIdToName</name>
      <anchor>a1</anchor>
      <arglist>(u_int16 devId)</arglist>
    </member>
    <member kind="function">
      <type>u_int16</type>
      <name>CHAM_ModCodeToDevId</name>
      <anchor>a2</anchor>
      <arglist>(u_int16 modCode)</arglist>
    </member>
    <member kind="function">
      <type>u_int16</type>
      <name>CHAM_DevIdToModCode</name>
      <anchor>a3</anchor>
      <arglist>(u_int16 devId)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>chameleonload_a015.c</name>
    <path>/opt/menlinux/LIBSRC/CHAMELEON/COM/</path>
    <filename>chameleonload__a015_8c</filename>
    <member kind="function">
      <type>int32</type>
      <name>ChameleonLoad_A015</name>
      <anchor>a13</anchor>
      <arglist>(OSS_HANDLE *osh, int icNumber, const FPGA_HEADER *fpgaCode)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>chameleonloadem01.c</name>
    <path>/opt/menlinux/LIBSRC/CHAMELEON/COM/</path>
    <filename>chameleonloadem01_8c</filename>
    <member kind="function">
      <type>int32</type>
      <name>ChameleonLoadEm01</name>
      <anchor>a2</anchor>
      <arglist>(OSS_HANDLE *osh, const FPGA_HEADER *fpgaCode, void *pldRegBase)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>chameleonloadem03.c</name>
    <path>/opt/menlinux/LIBSRC/CHAMELEON/COM/</path>
    <filename>chameleonloadem03_8c</filename>
    <member kind="function">
      <type>int32</type>
      <name>ChameleonLoadEm03</name>
      <anchor>a6</anchor>
      <arglist>(OSS_HANDLE *osh, const FPGA_HEADER *fpgaCode, void *pldRegBase)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>chameleonloadem04.c</name>
    <path>/opt/menlinux/LIBSRC/CHAMELEON/COM/</path>
    <filename>chameleonloadem04_8c</filename>
    <member kind="function">
      <type>int32</type>
      <name>ChameleonFpgaCodeIdentEm04</name>
      <anchor>a11</anchor>
      <arglist>(const FPGA_HEADER *fpgaCode, int *variantP, int *revisionP)</arglist>
    </member>
    <member kind="function">
      <type>int32</type>
      <name>ChameleonLoadEm04</name>
      <anchor>a12</anchor>
      <arglist>(OSS_HANDLE *osh, const FPGA_HEADER *fpgaCode)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>chameleonloadep01.c</name>
    <path>/opt/menlinux/LIBSRC/CHAMELEON/COM/</path>
    <filename>chameleonloadep01_8c</filename>
    <member kind="function">
      <type>int32</type>
      <name>ChameleonLoadEp01</name>
      <anchor>a2</anchor>
      <arglist>(OSS_HANDLE *osh, const FPGA_HEADER *fpgaCode, void *pldRegBase)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>chameleonv2.c</name>
    <path>/opt/menlinux/LIBSRC/CHAMELEON/COM/</path>
    <filename>chameleonv2_8c</filename>
    <class kind="struct">_BRG_NODE</class>
    <class kind="struct">_CPU_NODE</class>
    <class kind="struct">_TBL_NODE</class>
    <class kind="struct">_UNIT_NODE</class>
    <class kind="struct">BRG_LIST</class>
    <class kind="struct">CHAMELEONV2_HDL</class>
    <class kind="struct">CPU_LIST</class>
    <class kind="struct">PCILOC</class>
    <class kind="struct">TBL_LIST</class>
    <class kind="struct">UNIT_LIST</class>
    <member kind="typedef">
      <type>_TBL_NODE</type>
      <name>TBL_NODE</name>
      <anchor>a13</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>_UNIT_NODE</type>
      <name>UNIT_NODE</name>
      <anchor>a14</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>_CPU_NODE</type>
      <name>CPU_NODE</name>
      <anchor>a15</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>_BRG_NODE</type>
      <name>BRG_NODE</name>
      <anchor>a16</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>_STATIC_ int32</type>
      <name>InitPci</name>
      <anchor>a1</anchor>
      <arglist>(OSS_HANDLE *osh, u_int32 pciBus, u_int32 pciDev, u_int32 pciFunc, CHAMELEONV2_HANDLE **chahP)</arglist>
    </member>
    <member kind="function">
      <type>_STATIC_ int32</type>
      <name>InitInside</name>
      <anchor>a2</anchor>
      <arglist>(OSS_HANDLE *osh, void *tblAddr, CHAMELEONV2_HANDLE **chahP)</arglist>
    </member>
    <member kind="function">
      <type>_STATIC_ int32</type>
      <name>Info</name>
      <anchor>a3</anchor>
      <arglist>(CHAMELEONV2_HANDLE *chah, CHAMELEONV2_INFO *info)</arglist>
    </member>
    <member kind="function">
      <type>_STATIC_ int32</type>
      <name>TableIdent</name>
      <anchor>a4</anchor>
      <arglist>(CHAMELEONV2_HANDLE *chah, u_int32 idx, CHAMELEONV2_TABLE *table)</arglist>
    </member>
    <member kind="function">
      <type>_STATIC_ int32</type>
      <name>UnitIdent</name>
      <anchor>a5</anchor>
      <arglist>(CHAMELEONV2_HANDLE *chah, u_int32 idx, CHAMELEONV2_UNIT *unit)</arglist>
    </member>
    <member kind="function">
      <type>_STATIC_ int32</type>
      <name>BridgeIdent</name>
      <anchor>a8</anchor>
      <arglist>(CHAMELEONV2_HANDLE *chah, u_int32 idx, CHAMELEONV2_BRIDGE *bridge)</arglist>
    </member>
    <member kind="function">
      <type>_STATIC_ int32</type>
      <name>CpuIdent</name>
      <anchor>a7</anchor>
      <arglist>(CHAMELEONV2_HANDLE *chah, u_int32 idx, CHAMELEONV2_CPU *cpu)</arglist>
    </member>
    <member kind="function">
      <type>_STATIC_ int32</type>
      <name>InstanceFind</name>
      <anchor>a10</anchor>
      <arglist>(CHAMELEONV2_HANDLE *chah, int32 idx, CHAMELEONV2_FIND find, CHAMELEONV2_UNIT *unit, CHAMELEONV2_BRIDGE *bridge, CHAMELEONV2_CPU *cpu)</arglist>
    </member>
    <member kind="function">
      <type>_STATIC_ void</type>
      <name>Term</name>
      <anchor>a12</anchor>
      <arglist>(CHAMELEONV2_HANDLE **chahP)</arglist>
    </member>
    <member kind="function">
      <type>int32</type>
      <name>CHAM_Init</name>
      <anchor>a0</anchor>
      <arglist>(CHAM_FUNCTBL *fP)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>fpgaheader.c</name>
    <path>/opt/menlinux/LIBSRC/CHAMELEON/COM/</path>
    <filename>fpgaheader_8c</filename>
    <member kind="function">
      <type>int32</type>
      <name>ChameleonFpgaHeaderIdent</name>
      <anchor>a8</anchor>
      <arglist>(const void *_hdr, u_int32 maxSize, FPGA_HEADER_INFO *info)</arglist>
    </member>
    <member kind="function">
      <type>int32</type>
      <name>ChameleonFpgaDataXor</name>
      <anchor>a9</anchor>
      <arglist>(const u_int32 *p, u_int32 nBytes, u_int32 *xorP)</arglist>
    </member>
    <member kind="function">
      <type>int32</type>
      <name>ChameleonFpgaDataCheckXor</name>
      <anchor>a10</anchor>
      <arglist>(FPGA_HEADER_INFO *info)</arglist>
    </member>
    <member kind="function">
      <type>int32</type>
      <name>ChameleonFpgaHeaderOkForBoard</name>
      <anchor>a13</anchor>
      <arglist>(const FPGA_HEADER_INFO *info, const char *mainProductName, const char *carrierName)</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>_BRG_NODE</name>
    <filename>struct__BRG__NODE.html</filename>
  </compound>
  <compound kind="struct">
    <name>_CPU_NODE</name>
    <filename>struct__CPU__NODE.html</filename>
  </compound>
  <compound kind="struct">
    <name>_TBL_NODE</name>
    <filename>struct__TBL__NODE.html</filename>
  </compound>
  <compound kind="struct">
    <name>_UNIT_NODE</name>
    <filename>struct__UNIT__NODE.html</filename>
  </compound>
  <compound kind="struct">
    <name>BRG_LIST</name>
    <filename>structBRG__LIST.html</filename>
  </compound>
  <compound kind="struct">
    <name>CHAM_FUNCTBL</name>
    <filename>structCHAM__FUNCTBL.html</filename>
    <member kind="variable">
      <type>int32(*</type>
      <name>InitPci</name>
      <anchor>o0</anchor>
      <arglist>)(OSS_HANDLE *osh, u_int32 pciBus, u_int32 pciDev, u_int32 pciFunc, CHAMELEONV2_HANDLE **chahP)</arglist>
    </member>
    <member kind="variable">
      <type>int32(*</type>
      <name>InitInside</name>
      <anchor>o1</anchor>
      <arglist>)(OSS_HANDLE *osh, void *tblAddr, CHAMELEONV2_HANDLE **chahP)</arglist>
    </member>
    <member kind="variable">
      <type>int32(*</type>
      <name>Info</name>
      <anchor>o2</anchor>
      <arglist>)(CHAMELEONV2_HANDLE *chah, CHAMELEONV2_INFO *info)</arglist>
    </member>
    <member kind="variable">
      <type>int32(*</type>
      <name>TableIdent</name>
      <anchor>o3</anchor>
      <arglist>)(CHAMELEONV2_HANDLE *chah, u_int32 idx, CHAMELEONV2_TABLE *table)</arglist>
    </member>
    <member kind="variable">
      <type>int32(*</type>
      <name>UnitIdent</name>
      <anchor>o4</anchor>
      <arglist>)(CHAMELEONV2_HANDLE *chah, u_int32 idx, CHAMELEONV2_UNIT *unit)</arglist>
    </member>
    <member kind="variable">
      <type>int32(*</type>
      <name>BridgeIdent</name>
      <anchor>o5</anchor>
      <arglist>)(CHAMELEONV2_HANDLE *chah, u_int32 idx, CHAMELEONV2_BRIDGE *bridge)</arglist>
    </member>
    <member kind="variable">
      <type>int32(*</type>
      <name>CpuIdent</name>
      <anchor>o6</anchor>
      <arglist>)(CHAMELEONV2_HANDLE *chah, u_int32 idx, CHAMELEONV2_CPU *cpu)</arglist>
    </member>
    <member kind="variable">
      <type>int32(*</type>
      <name>InstanceFind</name>
      <anchor>o7</anchor>
      <arglist>)(CHAMELEONV2_HANDLE *chah, int32 idx, CHAMELEONV2_FIND find, CHAMELEONV2_UNIT *unit, CHAMELEONV2_BRIDGE *bridge, CHAMELEONV2_CPU *cpu)</arglist>
    </member>
    <member kind="variable">
      <type>void(*</type>
      <name>Term</name>
      <anchor>o8</anchor>
      <arglist>)(CHAMELEONV2_HANDLE **chahP)</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>CHAMELEON_HDL</name>
    <filename>structCHAMELEON__HDL.html</filename>
  </compound>
  <compound kind="struct">
    <name>CHAMELEON_UNIT</name>
    <filename>structCHAMELEON__UNIT.html</filename>
    <member kind="variable">
      <type>u_int16</type>
      <name>modCode</name>
      <anchor>o0</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int16</type>
      <name>revision</name>
      <anchor>o1</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int16</type>
      <name>instance</name>
      <anchor>o2</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int16</type>
      <name>interrupt</name>
      <anchor>o3</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int16</type>
      <name>bar</name>
      <anchor>o4</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int32</type>
      <name>offset</name>
      <anchor>o6</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>void *</type>
      <name>addr</name>
      <anchor>o7</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>CHAMELEONV2_BA</name>
    <filename>structCHAMELEONV2__BA.html</filename>
    <member kind="variable">
      <type>u_int32</type>
      <name>addr</name>
      <anchor>o0</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int32</type>
      <name>size</name>
      <anchor>o1</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>int8</type>
      <name>type</name>
      <anchor>o2</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>CHAMELEONV2_BRIDGE</name>
    <filename>structCHAMELEONV2__BRIDGE.html</filename>
    <member kind="variable">
      <type>u_int16</type>
      <name>devId</name>
      <anchor>o0</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int16</type>
      <name>variant</name>
      <anchor>o1</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int16</type>
      <name>revision</name>
      <anchor>o2</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int16</type>
      <name>busId</name>
      <anchor>o3</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int16</type>
      <name>instance</name>
      <anchor>o4</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int16</type>
      <name>nextBus</name>
      <anchor>o5</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int16</type>
      <name>interrupt</name>
      <anchor>o6</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int16</type>
      <name>bar</name>
      <anchor>o7</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int16</type>
      <name>dbar</name>
      <anchor>o8</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int16</type>
      <name>group</name>
      <anchor>o9</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int32</type>
      <name>offset</name>
      <anchor>o10</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int32</type>
      <name>size</name>
      <anchor>o11</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>void *</type>
      <name>addr</name>
      <anchor>o12</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>CHAMELEONV2_CPU</name>
    <filename>structCHAMELEONV2__CPU.html</filename>
    <member kind="variable">
      <type>u_int16</type>
      <name>devId</name>
      <anchor>o0</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int16</type>
      <name>variant</name>
      <anchor>o1</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int16</type>
      <name>revision</name>
      <anchor>o2</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int16</type>
      <name>busId</name>
      <anchor>o3</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int16</type>
      <name>instance</name>
      <anchor>o4</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int16</type>
      <name>group</name>
      <anchor>o5</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int16</type>
      <name>interrupt</name>
      <anchor>o6</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int32</type>
      <name>bootAddr</name>
      <anchor>o8</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int32</type>
      <name>reserved</name>
      <anchor>o9</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>CHAMELEONV2_FIND</name>
    <filename>structCHAMELEONV2__FIND.html</filename>
    <member kind="variable">
      <type>int16</type>
      <name>devId</name>
      <anchor>o0</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>int16</type>
      <name>variant</name>
      <anchor>o1</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>int16</type>
      <name>instance</name>
      <anchor>o2</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>int16</type>
      <name>busId</name>
      <anchor>o3</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>int16</type>
      <name>group</name>
      <anchor>o4</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int16</type>
      <name>flags</name>
      <anchor>o5</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>int32</type>
      <name>bootAddr</name>
      <anchor>o6</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>CHAMELEONV2_HDL</name>
    <filename>structCHAMELEONV2__HDL.html</filename>
  </compound>
  <compound kind="struct">
    <name>CHAMELEONV2_INFO</name>
    <filename>structCHAMELEONV2__INFO.html</filename>
    <member kind="variable">
      <type>u_int16</type>
      <name>chaRev</name>
      <anchor>o0</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int16</type>
      <name>busId</name>
      <anchor>o1</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int16</type>
      <name>tableNbr</name>
      <anchor>o2</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int16</type>
      <name>unitNbr</name>
      <anchor>o3</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int16</type>
      <name>bridgeNbr</name>
      <anchor>o4</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int16</type>
      <name>cpuNbr</name>
      <anchor>o5</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>CHAMELEONV2_BA</type>
      <name>ba</name>
      <anchor>o6</anchor>
      <arglist>[6]</arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>CHAMELEONV2_TABLE</name>
    <filename>structCHAMELEONV2__TABLE.html</filename>
    <member kind="variable">
      <type>u_int16</type>
      <name>busType</name>
      <anchor>o0</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int16</type>
      <name>busId</name>
      <anchor>o1</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>char</type>
      <name>model</name>
      <anchor>o2</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int16</type>
      <name>revision</name>
      <anchor>o3</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>char</type>
      <name>file</name>
      <anchor>o4</anchor>
      <arglist>[CHAMELEONV2_FILENAME_SIZE]</arglist>
    </member>
    <member kind="variable">
      <type>u_int16</type>
      <name>magicWord</name>
      <anchor>o5</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int16</type>
      <name>minRevision</name>
      <anchor>o6</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>CHAMELEONV2_UNIT</name>
    <filename>structCHAMELEONV2__UNIT.html</filename>
    <member kind="variable">
      <type>u_int16</type>
      <name>devId</name>
      <anchor>o0</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int16</type>
      <name>variant</name>
      <anchor>o1</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int16</type>
      <name>revision</name>
      <anchor>o2</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int16</type>
      <name>busId</name>
      <anchor>o3</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int16</type>
      <name>instance</name>
      <anchor>o4</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int16</type>
      <name>group</name>
      <anchor>o5</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int16</type>
      <name>interrupt</name>
      <anchor>o6</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int16</type>
      <name>bar</name>
      <anchor>o7</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int32</type>
      <name>offset</name>
      <anchor>o8</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int32</type>
      <name>size</name>
      <anchor>o9</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>void *</type>
      <name>addr</name>
      <anchor>o10</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable">
      <type>u_int32</type>
      <name>reserved</name>
      <anchor>o11</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="struct">
    <name>CPU_LIST</name>
    <filename>structCPU__LIST.html</filename>
  </compound>
  <compound kind="struct">
    <name>FPGA_HEADER_INFO</name>
    <filename>structFPGA__HEADER__INFO.html</filename>
  </compound>
  <compound kind="struct">
    <name>PCILOC</name>
    <filename>structPCILOC.html</filename>
  </compound>
  <compound kind="struct">
    <name>TBL_LIST</name>
    <filename>structTBL__LIST.html</filename>
  </compound>
  <compound kind="struct">
    <name>UNIT_LIST</name>
    <filename>structUNIT__LIST.html</filename>
  </compound>
  <compound kind="page">
    <name>_cham0func</name>
    <title>Chameleon-V0 Functions</title>
    <filename>_cham0func</filename>
  </compound>
  <compound kind="page">
    <name>chameleondummy</name>
    <title>MEN logo</title>
    <filename>chameleondummy</filename>
  </compound>
  <compound kind="page">
    <name>_cham2func</name>
    <title>Chameleon-V2 Functions</title>
    <filename>_cham2func</filename>
  </compound>
  <compound kind="group">
    <name>_CHAM_FUNC</name>
    <title>Chameleon-V0 Functions</title>
    <filename>group____CHAM__FUNC.html</filename>
    <member kind="function">
      <type>CHAMELEONV0_STATIC_EXTERN void</type>
      <name>ChameleonTerm</name>
      <anchor>a0</anchor>
      <arglist>(CHAMELEON_HANDLE **chahP)</arglist>
    </member>
    <member kind="function">
      <type>CHAMELEONV0_STATIC_EXTERN int32</type>
      <name>ChameleonInit</name>
      <anchor>a1</anchor>
      <arglist>(OSS_HANDLE *osh, int pciBus, int pciDev, CHAMELEON_HANDLE **chahP)</arglist>
    </member>
    <member kind="function">
      <type>CHAMELEONV0_STATIC_EXTERN int32</type>
      <name>ChameleonGlobalIdent</name>
      <anchor>a2</anchor>
      <arglist>(CHAMELEON_HANDLE *h, char *variantP, int *revisionP)</arglist>
    </member>
    <member kind="function">
      <type>CHAMELEONV0_STATIC_EXTERN int32</type>
      <name>ChameleonUnitIdent</name>
      <anchor>a3</anchor>
      <arglist>(CHAMELEON_HANDLE *h, int idx, CHAMELEON_UNIT *info)</arglist>
    </member>
    <member kind="function">
      <type>CHAMELEONV0_STATIC_EXTERN int32</type>
      <name>ChameleonUnitFind</name>
      <anchor>a4</anchor>
      <arglist>(CHAMELEON_HANDLE *h, int modCode, int instance, CHAMELEON_UNIT *info)</arglist>
    </member>
  </compound>
  <compound kind="group">
    <name>_CHAM_CODE_FUNC</name>
    <title>Chameleon Code Functions</title>
    <filename>group____CHAM__CODE__FUNC.html</filename>
    <member kind="function">
      <type>const char *</type>
      <name>ChameleonModName</name>
      <anchor>a0</anchor>
      <arglist>(u_int16 modCode)</arglist>
    </member>
    <member kind="function">
      <type>const char *</type>
      <name>CHAM_DevIdToName</name>
      <anchor>a1</anchor>
      <arglist>(u_int16 devId)</arglist>
    </member>
    <member kind="function">
      <type>u_int16</type>
      <name>CHAM_ModCodeToDevId</name>
      <anchor>a2</anchor>
      <arglist>(u_int16 modCode)</arglist>
    </member>
    <member kind="function">
      <type>u_int16</type>
      <name>CHAM_DevIdToModCode</name>
      <anchor>a3</anchor>
      <arglist>(u_int16 devId)</arglist>
    </member>
  </compound>
  <compound kind="group">
    <name>_CHAMV2_FUNC</name>
    <title>Chameleon-V2 Functions</title>
    <filename>group____CHAMV2__FUNC.html</filename>
    <member kind="function">
      <type>int32</type>
      <name>CHAM_Init</name>
      <anchor>a0</anchor>
      <arglist>(CHAM_FUNCTBL *fP)</arglist>
    </member>
    <member kind="function">
      <type>_STATIC_ int32</type>
      <name>InitPci</name>
      <anchor>a1</anchor>
      <arglist>(OSS_HANDLE *osh, u_int32 pciBus, u_int32 pciDev, u_int32 pciFunc, CHAMELEONV2_HANDLE **chahP)</arglist>
    </member>
    <member kind="function">
      <type>_STATIC_ int32</type>
      <name>InitInside</name>
      <anchor>a2</anchor>
      <arglist>(OSS_HANDLE *osh, void *tblAddr, CHAMELEONV2_HANDLE **chahP)</arglist>
    </member>
    <member kind="function">
      <type>_STATIC_ int32</type>
      <name>Info</name>
      <anchor>a3</anchor>
      <arglist>(CHAMELEONV2_HANDLE *chah, CHAMELEONV2_INFO *info)</arglist>
    </member>
    <member kind="function">
      <type>_STATIC_ int32</type>
      <name>TableIdent</name>
      <anchor>a4</anchor>
      <arglist>(CHAMELEONV2_HANDLE *chah, u_int32 idx, CHAMELEONV2_TABLE *table)</arglist>
    </member>
    <member kind="function">
      <type>_STATIC_ int32</type>
      <name>UnitIdent</name>
      <anchor>a5</anchor>
      <arglist>(CHAMELEONV2_HANDLE *chah, u_int32 idx, CHAMELEONV2_UNIT *unit)</arglist>
    </member>
    <member kind="function">
      <type>_STATIC_ int32</type>
      <name>CpuIdent</name>
      <anchor>a7</anchor>
      <arglist>(CHAMELEONV2_HANDLE *chah, u_int32 idx, CHAMELEONV2_CPU *cpu)</arglist>
    </member>
    <member kind="function">
      <type>_STATIC_ int32</type>
      <name>BridgeIdent</name>
      <anchor>a8</anchor>
      <arglist>(CHAMELEONV2_HANDLE *chah, u_int32 idx, CHAMELEONV2_BRIDGE *bridge)</arglist>
    </member>
    <member kind="function">
      <type>_STATIC_ int32</type>
      <name>InstanceFind</name>
      <anchor>a10</anchor>
      <arglist>(CHAMELEONV2_HANDLE *chah, int32 idx, CHAMELEONV2_FIND find, CHAMELEONV2_UNIT *unit, CHAMELEONV2_BRIDGE *bridge, CHAMELEONV2_CPU *cpu)</arglist>
    </member>
    <member kind="function">
      <type>_STATIC_ void</type>
      <name>Term</name>
      <anchor>a12</anchor>
      <arglist>(CHAMELEONV2_HANDLE **chahP)</arglist>
    </member>
  </compound>
  <compound kind="group">
    <name>_CHAMV2_ERRCODES</name>
    <title>Chameleon-V2 Error Codes</title>
    <filename>group____CHAMV2__ERRCODES.html</filename>
    <member kind="define">
      <type>#define</type>
      <name>CHAMELEONV2_PCIDEV_ILL</name>
      <anchor>a0</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>CHAMELEONV2_PCIDEV_ERR</name>
      <anchor>a1</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>CHAMELEONV2_TABLE_NOT_FOUND</name>
      <anchor>a2</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>CHAMELEONV2_TABLE_REV_UNSUP</name>
      <anchor>a3</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>CHAMELEONV2_TABLE_ERR</name>
      <anchor>a4</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>CHAMELEONV2_DTYPE_UNSUP</name>
      <anchor>a5</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>CHAMELEONV2_BAR_UNASSIGNED</name>
      <anchor>a6</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>CHAMELEONV2_BARDESC_MISSING</name>
      <anchor>a7</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>CHAMELEONV2_HANDLE_ILL</name>
      <anchor>a8</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>CHAMELEONV2_OUT_OF_RES</name>
      <anchor>a9</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>CHAMELEONV2_NO_MORE_ENTRIES</name>
      <anchor>a10</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="group">
    <name>_CHAMV2_SUCCCODES</name>
    <title>Chameleon-V2 Success Codes</title>
    <filename>group____CHAMV2__SUCCCODES.html</filename>
    <member kind="define">
      <type>#define</type>
      <name>CHAMELEONV2_UNIT_FOUND</name>
      <anchor>a0</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>CHAMELEONV2_BRIDGE_FOUND</name>
      <anchor>a1</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>CHAMELEONV2_CPU_FOUND</name>
      <anchor>a2</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="group">
    <name>_CHAM_MAGICWORD</name>
    <title>Chameleon Magic Words</title>
    <filename>group____CHAM__MAGICWORD.html</filename>
    <member kind="define">
      <type>#define</type>
      <name>CHAMELEON_MAGIC_00</name>
      <anchor>a0</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>CHAMELEON_MAGIC_01</name>
      <anchor>a1</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>CHAMELEON_MAGIC_02</name>
      <anchor>a2</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="group">
    <name>_CHAMV2_BUSTYPE</name>
    <title>Chameleon-V2 Bus Types</title>
    <filename>group____CHAMV2__BUSTYPE.html</filename>
    <member kind="define">
      <type>#define</type>
      <name>CHAMELEONV2_BUSTYPE_WB</name>
      <anchor>a0</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>CHAMELEONV2_BUSTYPE_AV</name>
      <anchor>a1</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>CHAMELEONV2_BUSTYPE_LPC</name>
      <anchor>a2</anchor>
      <arglist></arglist>
    </member>
    <member kind="define">
      <type>#define</type>
      <name>CHAMELEONV2_BUSTYPE_ISA</name>
      <anchor>a3</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="group">
    <name>_CHAMV2_FF</name>
    <title>Chameleon-V2 InstanceFind() Flags</title>
    <filename>group____CHAMV2__FF.html</filename>
    <member kind="define">
      <type>#define</type>
      <name>CHAMELEONV2_FF_BRGALL</name>
      <anchor>a0</anchor>
      <arglist></arglist>
    </member>
  </compound>
</tagfile>
