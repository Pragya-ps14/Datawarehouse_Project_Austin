-- Accessing the created database
USE GRP01_PROJECT_DB;


-- Error Table Queries

-- Crime Reports Error List
SELECT  COUNT(ECR.Incident_Number)
  FROM  FACT_CRIME_REPORTS FCR LEFT JOIN DIM_CR_INCIDENT DCI
		ON FCR.Incident_Number = DCI.Incident_Number
		LEFT JOIN DIM_CR_OFFENCE DCO
		ON FCR.Highest_Offence_Code = DCO.Highest_Offence_Code
		LEFT JOIN DIM_CR_LOCATION DCL
		ON FCR.Location_ID = DCL.Location_ID
		LEFT JOIN DIM_CR_UCR DCU
		ON FCR.UCR_Category = DCU.UCR_Category
		RIGHT JOIN ERR_CRIME_REPORTS ECR
		ON FCR.Incident_Number = ECR.Incident_Number

-- Bike Transportation Error List
SELECT  COUNT(EBT.OBJECTID)
  FROM  FACT_BIKE_TRANSPORT FBT LEFT JOIN DIM_BT_LOCATION DBL
		ON FBT.Location_ID = DBL.Location_ID
		RIGHT JOIN ERR_BIKE_TRANSPORT EBT
		ON FBT.OBJECT_ID = EBT.OBJECTID

-- Traffic Camera Error List
SELECT  COUNT(ETC.Camera_ID)
  FROM  FACT_TRAFFIC_CAMERA FTC LEFT JOIN DIM_TC_CAM_IP DTCI
		ON FTC.IP_ID = DTCI.IP_ID
		LEFT JOIN DIM_TC_CAM_LOCATION DTCL
		ON FTC.Location_ID = DTCL.Location_ID
		RIGHT JOIN ERR_TRAFFIC_CAMERA ETC
		ON FTC.Camera_ID = ETC.Camera_ID

-- Unemployment Error List
SELECT  COUNT(EU.As_of_Date)
  FROM  ERR_UNEMPLOYMENT EU