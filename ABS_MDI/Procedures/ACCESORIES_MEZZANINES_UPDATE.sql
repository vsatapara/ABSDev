CREATE OR REPLACE PROCEDURE abs_mdi."ACCESORIES_MEZZANINES_UPDATE" (
    MezzaninesId IN NUMBER,
    MezzanineNumber       IN  NUMBER,
	 BuildingNumber   IN   NUMBER,
    ProjectId        IN   NUMBER,
    JoistParallelToPurlins      IN   NUMBER,
    StartFrameline       IN   NUMBER,
    StopFrameline            IN   NUMBER,
    DistFromSW              IN   NUMBER,
    Width            IN   NUMBER,
    OpenDistFromSw              IN   NUMBER,
    OpenDistFromFrameline        IN   NUMBER,
    OpenWidthAlongEw       IN   NUMBER,
    OpenLengthAlongSw      IN   NUMBER,
    Design       IN   NUMBER,
    Beams  IN   NUMBER,
    Deck  IN   NUMBER,
    Joists         IN   NUMBER,
    SupportColumns     IN   NUMBER,
    EdgeAngle    IN   NUMBER,
    FloorThickness         IN   NUMBER,
    FloorHeight       IN   NUMBER,
    FloorMaterial       IN   VARCHAR2,
    InsideClearBeams       IN   NUMBER,
    MaxBeamDepth       IN   NUMBER,
    InsideClearJoists       IN   NUMBER,
    MaxJoistDepth           IN   NUMBER,
    JoistShopcoat          IN   VARCHAR2,
    JoistWelded      IN   NUMBER,
    JoistSpacing     IN   NUMBER,
    DeckType       IN   VARCHAR2,
	DeckFinish		IN VARCHAR2,
	DeckFastened    IN NUMBER,
	DeckIcboApproval IN NUMBER, 
	DeckClosure IN NUMBER, 
	LiveLoad IN NUMBER , 
	DeadLoad  IN NUMBER, 
	CollateralLoad  IN NUMBER, 
	 PartitionLoad IN  NUMBER , 
	 QuoteNumber IN  VARCHAR2 , 
	 QuoteYear IN  VARCHAR2 , 
	 EstimatorInitials IN VARCHAR2 , 
	 ExpiresOn IN VARCHAR2 , 
	 Expired IN NUMBER , 
	 NoVendor IN NUMBER , 
	 PriceStar IN NUMBER , 
	 WeightStar IN NUMBER , 
	 PriceBeams IN NUMBER , 
	 WeightBeams IN NUMBER , 
	 PriceJoists IN NUMBER , 
	 WeightJoists IN NUMBER , 
	 VendorJoists IN  VARCHAR2 , 
	 PriceDeck IN NUMBER , 
	 WeightDeck IN NUMBER , 
	 VendorDeck IN VARCHAR2 , 
	 Vibration IN NUMBER , 
	 DeckCoverage IN VARCHAR2 , 
	 HumanActivity IN NUMBER , 
	 MezzUse IN VARCHAR2 , 
	 MezzColSpacingSet IN NUMBER , 
	 StairwellWeight IN NUMBER , 
	 ClearToRafter IN NUMBER , 
	 LiveLoadReduction IN  NUMBER , 
	 AttachmentToSupport IN VARCHAR2 , 
	 AttachmentToSidelap IN VARCHAR2 , 
	 AttachmentByStarSupport IN NUMBER , 
	 AttachmentByStarSidelap IN NUMBER , 
	 JoistType IN VARCHAR2 , 
	 JoistSpacingStandard IN NUMBER , 
	 JoistSpacingSpecified IN VARCHAR2 , 
	 IntMezzColumnType IN VARCHAR2 , 
	 ColumnBaseType IN VARCHAR2 , 
	 ColumnBaseHeight IN NUMBER , 
	 JoistSpacingCustom  IN NUMBER , 
	 DeckDescription IN VARCHAR2 , 
	 DeckFinishWidth IN VARCHAR2 , 
	 DeckFinishType IN VARCHAR2 , 
	 DeckFinishGauge IN VARCHAR2 , 
	 DeckFinishFinish IN VARCHAR2 , 
	 HideWeightPrice IN NUMBER , 
    UserId          IN  NUMBER DEFAULT NULL,
    IpAddress       IN  VARCHAR2
) AS
BEGIN
    UPDATE "EDSPrice_IO_Mezzanines"
    SET
    "BuildingNumber" = BuildingNumber,
    "ProjectId" = ProjectId,
	"MezzanineNumber"=  MezzanineNumber,
    "JoistParallelToPurlins" =JoistParallelToPurlins ,
    "StartFrameline"= StartFrameline,
    "StopFrameline" =StopFrameline ,
    "DistFromSW"=DistFromSW ,
   "Width" = Width,
    "OpenDistFromSw"  = OpenDistFromSw,
    "OpenDistFromFrameline" = OpenDistFromFrameline,
    "OpenWidthAlongEw" =OpenWidthAlongEw,
    "OpenLengthAlongSw" =OpenLengthAlongSw,
    "Design"=Design,
    "Beams"=Beams,
    "Deck"= Deck,
    "Joists"=Joists ,
    "SupportColumns"=SupportColumns,
   "EdgeAngle"=EdgeAngle ,
    "FloorThickness" =FloorThickness,
    "FloorHeight"  =FloorHeight,
    "FloorMaterial"= FloorMaterial,
    "InsideClearBeams"=InsideClearBeams,
    "MaxBeamDepth" = MaxBeamDepth,
    "InsideClearJoists" = InsideClearJoists,
   "MaxJoistDepth"=MaxJoistDepth,
    "JoistShopcoat"=JoistShopcoat,
    "JoistWelded" =JoistWelded,
    "JoistSpacing" = JoistSpacing,
    "DeckType" =DeckType,
	"DeckFinish"=DeckFinish,
	"DeckFastened"=DeckFastened  ,
	"DeckIcboApproval"=DeckIcboApproval, 
	"DeckClosure"=DeckClosure, 
	"LiveLoad"=LiveLoad, 
	"DeadLoad"= DeadLoad, 
	"CollateralLoad"=CollateralLoad, 
	 "PartitionLoad" =PartitionLoad , 
	 "QuoteNumber"  =QuoteNumber, 
	 "QuoteYear" =QuoteYear , 
	 "EstimatorInitials" =EstimatorInitials, 
	 "ExpiresOn"=ExpiresOn , 
	 "Expired"=Expired, 
	 "NoVendor"=NoVendor , 
	 "PriceStar"= PriceStar, 
	 "WeightStar"  =WeightStar, 
	 "PriceBeams"  =PriceBeams, 
	 "WeightBeams" = WeightBeams, 
	 "PriceJoists"=PriceJoists , 
	"WeightJoists"  =WeightJoists, 
	 "VendorJoists" =VendorJoists , 
	 "PriceDeck" =PriceDeck, 
	 "WeightDeck" = WeightDeck, 
	 "VendorDeck" =VendorDeck, 
	 "Vibration"= Vibration , 
	 "DeckCoverage" =DeckCoverage, 
	 "HumanActivity"= HumanActivity, 
	 "MezzUse" =  MezzUse  , 
	 "MezzColSpacingSet" = MezzColSpacingSet  , 
	 "StairwellWeight" = StairwellWeight  , 
	 "ClearToRafter" =   ClearToRafter, 
	 "LiveLoadReduction" =   LiveLoadReduction , 
	 "AttachmentToSupport" =  AttachmentToSupport  , 
	 "AttachmentToSidelap" =  AttachmentToSidelap  , 
	 "AttachmentByStarSupport" =  AttachmentByStarSupport, 
	 "AttachmentByStarSidelap"  = AttachmentByStarSidelap , 
	 "JoistType" = JoistType  , 
	 "JoistSpacingStandard" =  JoistSpacingStandard  , 
	 "JoistSpacingSpecified"  =  JoistSpacingSpecified, 
	 "IntMezzColumnType" = IntMezzColumnType  , 
	 "ColumnBaseType"   = ColumnBaseType , 
	 "ColumnBaseHeight"  = ColumnBaseHeight, 
	 "JoistSpacingCustom" =    JoistSpacingCustom, 
	 "DeckDescription" = DeckDescription   , 
	 "DeckFinishWidth" =  DeckFinishWidth  , 
	 "DeckFinishType" = DeckFinishType  , 
	 "DeckFinishGauge"=DeckFinishGauge   , 
	 "DeckFinishFinish" = DeckFinishFinish  , 
	 "HideWeightPrice" =  HideWeightPrice , 
        "ModifiedBy" = UserId,
        "ModifiedDate" = CURRENT_TIMESTAMP,
        "IpAddress" = IpAddress
    WHERE
        "MezzaninesId" = MezzaninesId;
END ACCESORIES_Mezzanines_UPDATE;
/