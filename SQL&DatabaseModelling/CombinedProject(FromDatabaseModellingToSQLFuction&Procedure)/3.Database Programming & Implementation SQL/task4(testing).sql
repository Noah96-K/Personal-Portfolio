-- task 4 Part(a)

-- task 2 testing

-- a.2.1 when try to upgrade the membeshipLevel for the expired member
Update Membership set MembershipLevel='Gold' where MembershipID=2;
Update Membership set MembershipLevel='Platinum' where MembershipID=2;

-- a.2.2 when try to change silver to platinum 
Update Membership set MembershipLevel='Platinum' where MembershipID=5;

-- a.2.3 when try to change silver to gold (vaild)
Update Membership set MembershipLevel='Gold' where MembershipID=5;

-- a.2.4 when try to change gold to silver
Update Membership set MembershipLevel='Silver' where MembershipID=1;

-- a.2.5 when try to change gold to platinum (vaild)
Update Membership set MembershipLevel='Platinum' where MembershipID=1;

-- a.2.6 when try to change platinum to silver or gold
Update Membership set MembershipLevel='Silver' where MembershipID=3;
Update Membership set MembershipLevel='Gold' where MembershipID=3;


-- test 3 testing

-- a.3.1 when call the procedure with 'Blonde'
call BrandNameCampaign('Blonde');

-- a.3.2 when call the procedure with 'Penfold'
call BrandNameCampaign('Penfold');



-- task 4 Part(b)

-- task 2 testing
-- b.2.1 insert values to check what happens when trying to change the membership level of a row having today as an expiry date
insert into membership values (6, 'Noah', 'Kwon', 'ahweqwheq@gmail.com','Gold' ,date(now()));
-- test when today is the expiry date
-- purpose : prove that relation between member expiry date and the current time is well set up
Update Membership set MembershipLevel='Platinum' where MembershipID=6;

-- b.2.2 Other variables like FirstName, LastName can be changed even when the expiry date is passed since there are no given restrictions for that
-- purpose: prove that there are no expiry date restrictions for updating other variables except membershipLevel
Update Membership set FirstName='Bree' where MembershipID=2;
Update Membership set eMail='test@email'where MembershipID=2;

-- b.2.3 As an extension of test b.2.2 try to change two variables includes membership level when membership is expired
-- purpose: prove that membershipLevel can not be updated even with updating other variables when membership is expired
Update Membership set FirstName='quin',  MembershipLevel='Gold' where MembershipID=2;

-- b.2.4 more than two other variables include membershipLevel can be changed if the update is valid
-- purpose: prove that more than two other variables can be changed if the new values are valid
Update Membership set eMail='GoldTest@google.com', membershipLevel='Platinum' where MembershipID=4;

-- b.2.5 when trying to change MembershipLevel to an invalid value which is not 'Silver', 'Gold', 'Platinum'
-- purpose: prove that membershipLevel can not be any other values than ‘Silver’, ‘Gold’, ‘Platinum’
Update Membership set MembershipLevel='test' where MembershipID=5;
Update Membership set MembershipLevel='test' where MembershipID=1;
Update Membership set MembershipLevel='test' where MembershipID=3;

-- b.2.6 when try to change membershipLevel into same membershipLevel
-- purpose: prove that changing membershipLevel into the same value is valid
Update Membership set MembershipLevel='Silver' where MembershipID=5;
Update Membership set MembershipLevel='Gold' where MembershipID=1;
Update Membership set MembershipLevel='Platinum' where MembershipID=3;
Update Membership set MembershipLevel='Silver' where MembershipID=2;

-- task 3 testing
-- b.3.1 insert more products which are brand is 'Penfold'
-- purpose: insert more 'Penfold' products to check if the sorting function in the procedure is working well. before there are only 4 default 'Penfold' products so they can not be tested.
insert into product values (6, 'Wine', 'Bottle',2021,550,'Penfold');
insert into product values (7, 'Wine', 'Bottle',2020,530,'Penfold');
insert into product values (8, 'Wine', 'Bottle',2018,320,'Penfold');
insert into product values (9, 'Wine', 'Bottle',2019,3800,'Penfold');

-- b.3.2 call function with 'Penfold'
-- purpose: test that this procedure can offer the sale campaign for the top 5 expensive 'Penfold' products
call BrandNameCampaign('Penfold');

-- b.3.3 insert 3 products which are brand is 'XXXX'
-- purpose: test that this procedure can be performed for the new brand products which were not in the default table
insert into product values (10, 'Wine', 'Bottle',2019,30,'XXXX');
insert into product values (11, 'beer', 'Bottle',2020,15,'XXXX');
insert into product values (12, 'Wine', 'can',2020,35,'XXXX');

-- b.3.4 call function with 'XXXX'
-- purpose: test that this procedure can offer the sale campaign for the top 3 expensive 'XXXX' products
call BrandNameCampaign('XXXX');

-- b.3.5 call function with 'randomtest'
-- purpose: Test campaigns when there are no products with a given brand.
call BrandNameCampaign('randomtest');
