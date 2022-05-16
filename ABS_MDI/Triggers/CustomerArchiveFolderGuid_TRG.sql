CREATE OR REPLACE TRIGGER abs_mdi."CustomerArchiveFolderGuid_TRG" 
BEFORE  UPDATE ON abs_mdi."CustomerArchiveFolders" 
FOR EACH ROW 
BEGIN    


    IF UPDATING THEN

         /* IF (:old."CustomerId" != :new."CustomerId") 
        THEN
            "HistoryEventsOP"(:new."MODIFIEDBY",'CustomerArchiveFolders','CustomerId', :old."CustomerId", :new."CustomerId",:new."IPADDRESS"); 
        END IF; */

        IF (:old."Name" != :new."Name") 
        THEN
            "HistoryEventsOP"(:new."MODIFIEDBY",'CustomerArchiveFolders','Name', :old."Name", :new."Name",:new."IPADDRESS"); 
        END IF;

        	IF (:old."ParentCustomerArchiveFolderGuid"  != :new."ParentCustomerArchiveFolderGuid") 
        THEN
            "HistoryEventsOP"(:new."MODIFIEDBY",'CustomerArchiveFolders','ParentCustomerArchiveFolderGuid', :old."ParentCustomerArchiveFolderGuid", :new."ParentCustomerArchiveFolderGuid",:new."IPADDRESS"); 
        END IF; 

        IF (:old."SortOrder"  != :new."SortOrder") 
            THEN
                "HistoryEventsOP"(:new."MODIFIEDBY",'CustomerArchiveFolders','SortOrder', :old."SortOrder", :new."SortOrder",:new."IPADDRESS"); 
            END IF;     

        IF (:old."IPADDRESS"  != :new."IPADDRESS") 
            THEN
                "HistoryEventsOP"(:new."MODIFIEDBY",'CustomerArchiveFolders','IPADDRESS', :old."IPADDRESS", :new."IPADDRESS",:new."IPADDRESS"); 
            END IF; 

        IF (:old."MODIFIEDBY"  != :new."MODIFIEDBY") 
            THEN
                "HistoryEventsOP"(:new."MODIFIEDBY",'CustomerArchiveFolders','MODIFIEDBY', :old."MODIFIEDBY", :new."MODIFIEDBY",:new."IPADDRESS"); 
            END IF; 


    END IF; 
END;


/