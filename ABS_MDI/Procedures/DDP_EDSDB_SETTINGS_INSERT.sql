CREATE OR REPLACE PROCEDURE abs_mdi."DDP_EDSDB_SETTINGS_INSERT" 
/*  Created By    Mayuresh Jagtap
	Created Date   24-08-2021
	Description   This stored Procedure used in the DDP and used for insert records in EDSDB_SETTINGS table 
*/
(
	PAR_MBG_BRAND IN VARCHAR2,
	PAR_IPADDRESS IN VARCHAR2,
	PAR_SETTING_INDEX IN NUMBER,
	PAR_BUILDING_NAME IN VARCHAR2,
	PAR_MBG_DIVISION IN	VARCHAR2,
	PAR_MBG_FAB_PLANT IN VARCHAR2,
	PAR_MBG_DETAILING_SYSTEM IN	VARCHAR2,
	PAR_WORK_ORDER_NUMBER IN VARCHAR2,
	PAR_PHASE IN VARCHAR2,
	PAR_FABRICATION_DATE IN	VARCHAR2,
	PAR_SHIP_DATE IN VARCHAR2,
	PAR_BRACING_TYPE IN	VARCHAR2,
	PAR_PRIMER_COLOR IN	VARCHAR2,
	PAR_CUSTOMER_DRAWINGS IN VARCHAR2,
	PAR_METRIC_OUTPUT IN VARCHAR2,
	PAR_SIMPLIFIED_SEC_DES IN VARCHAR2,
	PAR_ATTEMPT_ONE_SIDED_FB IN	VARCHAR2,
	PAR_NORTHERN_CLIMATE IN	VARCHAR2,
	PAR_PERCENT_TRIB_IF IN VARCHAR2,
	PAR_PERCENT_TRIB_MF IN VARCHAR2,
	PAR_GCONTDES IN	VARCHAR2,
	PAR_GDISTEAVE IN VARCHAR2,
	PAR_GDISTEXT IN VARCHAR2,
	PAR_GDISTHEAD IN VARCHAR2,
	PAR_GDISTLAP IN VARCHAR2,
	PAR_GDISTMIN IN VARCHAR2,
	PAR_PULLOVER IN VARCHAR2,
	PAR_COLDFORM_CONNECTION_TYPE IN VARCHAR2,
	PAR_STIFFENED_FRAME_CONNECTIONS	IN VARCHAR2,
	PAR_GALVANIZED_SECONDARY IN VARCHAR2,
	PAR_FRAME_SECOND_ORDER_METHOD IN VARCHAR2,
	PAR_FO_TRY_CF_UNLIPPED_CEE IN VARCHAR2,
	PAR_BOLT_FINISH	IN VARCHAR2,
	PAR_MIN_ANCHOR_DIAMETER	IN VARCHAR2,
	PAR_HOT_DIPPED_GALVANIZED IN VARCHAR2,
	PAR_MINFRAMEMOMENTBOLTDIA IN VARCHAR2,
	PAR_EDSDBBLDGVERID IN NUMBER
) AS 
BEGIN
	INSERT INTO DDP_EDSDB_SETTINGS (
		MBG_BRAND,
		CREATEDDATE,
		IPADDRESS,
		SETTING_INDEX,
		BUILDING_NAME,
		MBG_DIVISION,
		MBG_FAB_PLANT,
		MBG_DETAILING_SYSTEM,
		WORK_ORDER_NUMBER,
		PHASE,
		FABRICATION_DATE,
		SHIP_DATE,
		BRACING_TYPE,
		PRIMER_COLOR,
		CUSTOMER_DRAWINGS,
		METRIC_OUTPUT,
		SIMPLIFIED_SEC_DES,
		ATTEMPT_ONE_SIDED_FB,
		NORTHERN_CLIMATE,
		PERCENT_TRIB_IF,
		PERCENT_TRIB_MF,
		GCONTDES,
		GDISTEAVE,
		GDISTEXT,
		GDISTHEAD,
		GDISTLAP,
		GDISTMIN,
		PULLOVER,
		COLDFORM_CONNECTION_TYPE,
		STIFFENED_FRAME_CONNECTIONS,
		GALVANIZED_SECONDARY,
		FRAME_SECOND_ORDER_METHOD,
		FO_TRY_CF_UNLIPPED_CEE,
		BOLT_FINISH,
		MIN_ANCHOR_DIAMETER,
		HOT_DIPPED_GALVANIZED,
		MINFRAMEMOMENTBOLTDIA,
		EDSDBBLDGVERID
) 
VALUES 
(
	PAR_MBG_BRAND,
    CURRENT_TIMESTAMP,
	PAR_IPADDRESS,
	PAR_SETTING_INDEX,
	PAR_BUILDING_NAME,
	PAR_MBG_DIVISION,
	PAR_MBG_FAB_PLANT,
	PAR_MBG_DETAILING_SYSTEM,
	PAR_WORK_ORDER_NUMBER,
	PAR_PHASE,
	PAR_FABRICATION_DATE,
	PAR_SHIP_DATE,
	PAR_BRACING_TYPE,
	PAR_PRIMER_COLOR,
	PAR_CUSTOMER_DRAWINGS,
	PAR_METRIC_OUTPUT,
	PAR_SIMPLIFIED_SEC_DES,
	PAR_ATTEMPT_ONE_SIDED_FB,
	PAR_NORTHERN_CLIMATE,
	PAR_PERCENT_TRIB_IF,
	PAR_PERCENT_TRIB_MF,
	PAR_GCONTDES,
	PAR_GDISTEAVE,
	PAR_GDISTEXT,
	PAR_GDISTHEAD,
	PAR_GDISTLAP,
	PAR_GDISTMIN,
	PAR_PULLOVER,
	PAR_COLDFORM_CONNECTION_TYPE,
	PAR_STIFFENED_FRAME_CONNECTIONS	,
	PAR_GALVANIZED_SECONDARY,
	PAR_FRAME_SECOND_ORDER_METHOD,
	PAR_FO_TRY_CF_UNLIPPED_CEE,
	PAR_BOLT_FINISH,
	PAR_MIN_ANCHOR_DIAMETER,
	PAR_HOT_DIPPED_GALVANIZED,
	PAR_MINFRAMEMOMENTBOLTDIA,
	PAR_EDSDBBLDGVERID
);
END DDP_EDSDB_SETTINGS_INSERT;
/