CREATE OR REPLACE PROCEDURE abs_mdi."SYSTEMVARIABLES_UPDATE" 
(       
        SystemVariableId IN NUMBER,
        MinimumPasswordLength IN NUMBER,
        LoginConfirmationDays IN NUMBER,
        PasswordResetConfirmationDays IN NUMBER,
        LoginRetries IN NUMBER,
        SessionTimeout IN NUMBER,
        MaximumAttachmentSize IN NUMBER,
        AcceptableAttachmentTypes IN VARCHAR2,
        AcceptableLogoTypes IN VARCHAR2,
        SystemVersion IN VARCHAR2,
        CopyrightInformation IN VARCHAR2,
        NoContentMessageOrders IN VARCHAR2,
        NoContentMessageQuotes IN VARCHAR2,
        NoContentMessageLeads IN VARCHAR2,
        NoContentMessageContacts IN VARCHAR2,
        NoContentMessageUpcomingEvents IN VARCHAR2,
        NoContentMessageFeatureAnnouncements IN VARCHAR2,
        NoContentMessageBuilderNews IN VARCHAR2,
        NoContentMessageJobBoard IN VARCHAR2,
        DailyNotificationTimeUtc IN VARCHAR2,
        WeeklyNotificationTimeUtc IN VARCHAR2,
        NotificationDayOfTheWeek IN VARCHAR2,
        NotificationSliderSpeed IN NUMBER,
        ThrottlingThreshold IN NUMBER,
        ThrottlingDelay IN NUMBER,
        UserId IN NUMBER,
        IpAddress IN VARCHAR2
)
AS 
BEGIN
UPDATE "SystemVariable" SET        
    "MinimumPasswordLength" = MinimumPasswordLength,
    "LoginConfirmationDays" = LoginConfirmationDays,
    "PasswordResetConfirmationDays" = PasswordResetConfirmationDays,
    "LoginRetries" = LoginRetries,
    "SessionTimeout" = SessionTimeout,
    "MaximumAttachmentSize" = MaximumAttachmentSize,
    "AcceptableAttachmentTypes" = AcceptableAttachmentTypes,
    "AcceptableLogoTypes" = AcceptableLogoTypes,
    "SystemVersion" = SystemVersion,
    "CopyrightInformation" = CopyrightInformation,
    "NoContentMessageOrders" = NoContentMessageOrders,
    "NoContentMessageQuotes" = NoContentMessageQuotes,
    "NoContentMessageLeads" = NoContentMessageLeads,
    "NoContentMessageContacts" = NoContentMessageContacts,
    "NoContentMessageUpcomingEvents" = NoContentMessageUpcomingEvents,
    "NoContentMessageFeatureAnnouncements" = NoContentMessageFeatureAnnouncements,
    "NoContentMessageBuilderNews" = NoContentMessageBuilderNews,
    "NoContentMessageJobBoard" = NoContentMessageJobBoard,
    "DailyNotificationTimeUtc" = DailyNotificationTimeUtc,
    "WeeklyNotificationTimeUtc" = WeeklyNotificationTimeUtc,
    "NotificationDayOfTheWeek" = NotificationDayOfTheWeek,
    "NotificationSliderSpeed" = NotificationSliderSpeed,
    "ThrottlingThreshold" = ThrottlingThreshold,
    "ThrottlingDelay" = ThrottlingDelay,
    "ModifiedBy" = UserId,
    "ModifiedDate" = CURRENT_TIMESTAMP,
    "IpAddress" = IpAddress
 where "SystemVariableId" = SystemVariableId;    
    
END SYSTEMVARIABLES_UPDATE;
/