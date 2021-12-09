-- task 2 

Drop TRIGGER if exists CHECK_MEMBERSHIP_UPDATE;

DELIMITER //
CREATE TRIGGER CHECK_MEMBERSHIP_UPDATE
BEFORE UPDATE ON Membership
FOR EACH ROW
BEGIN 
	DECLARE msg VARCHAR(200);
	DECLARE currentDate DATE default now();
    Declare flag boolean;
    -- when try to change membership level with the values other than 'Silver', 'Gold', 'Platinum'
    set flag = new.MembershipLevel='Platinum' or new.MembershipLevel='Silver' or new.MembershipLevel='Gold';
    if flag = false then 
		SET msg="Membership level can not have values except Platinum, Gold, Silver.";
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =msg;
	end if;
	IF new.MemberExpDate < currentDate and old.MembershipLevel <> new.MembershipLevel THEN
	-- when nothing changed except MembershipLevel
		SET msg="Membership expired! Can't upgrade membership level.";
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =msg;
	else
		if old.MembershipLevel='Platinum' and new.MembershipLevel <>'Platinum' then
			SET msg="There is no further upgrade for the PLATINUM members";
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =msg;
		elseif new.MembershipLevel='Platinum' and old.MembershipLevel='Silver' then
			SET msg="Only the GOLD member can be upgraded to the PLATINUM members";
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =msg;
		elseif new.MembershipLevel='Silver' and old.MembershipLevel<>'Silver' then
			SET msg="Silver is the lowest membership level";
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT =msg;
		end if;
            
	END IF;
END //
DELIMITER ;

 CREATE FUNCTION Find_Average_Salary(buildingName VARCHAR(50))
          BEGIN
			declare finished int default 0;
            declare salarySum int(10) default 0;
            declare salaryIndi int(10);
            declare numPeo int(10);
            DECLARE buildRec CURSOR FOR
              select e.salary
              from Employees e, Departments d
              where e.Dept=d.DeptID and
              d.DeptLocation=buildingName;
			declare continue handler for not found set finished=1;
            
            OPEN buildRec;
            REPEAT
              fetch buildRec into salaryIndi;
              if(not finished=1)then
				salarySum=salarySum+salaruIndi;
				numPeo=numPeo+1;
			   end if;
			until finished
            END REPEAT;
            select salarySum/numPeo into 'average salary'
            CLOSE buildRec;
END//

-- task 3

drop procedure if exists BrandNameCampaign;

delimiter //
create procedure BrandNameCampaign(in brandName varchar(255))
begin
	declare v_finished int default 0;
	declare campaignNo int ;
    declare campaignStart date;
    declare campaignFinish date;
	declare v_productID int;
    declare discountProduct cursor for 
		select productID from product where brand=brandName order by price desc limit 5;
	declare continue handler for not found set v_finished = 1;
    select campaignID into campaignNo from campaign order by campaignID desc limit 1;
    set campaignNo = campaignNo +1;
    
    set campaignStart = DATE_ADD(now(), INTERVAL 2 week);
    set campaignFinish = DATE_ADD(now(), INTERVAL  6 week);
    
	insert into campaign Values (campaignNo, campaignStart, campaignFinish);
    open discountProduct;
    repeat
		fetch discountProduct into v_productID;
        if not (v_finished =1) then
			insert into discountDetails Values (v_productID, campaignNo,'Silver',10);
			insert into discountDetails Values (v_productID, campaignNo,'Gold',20);
			insert into discountDetails Values (v_productID, campaignNo,'Platinum',30);
        end if;
	until v_finished
     end repeat; 
     close discountProduct;

end //
delimiter ;



