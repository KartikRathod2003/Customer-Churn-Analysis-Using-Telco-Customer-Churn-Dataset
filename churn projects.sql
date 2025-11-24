use projects;
select*from CustomerChurn_Dataset;

              --- count row ---
select count(*) from CustomerChurn_Dataset;

          -- Detecting Duplicate Customer --
select customerid,count(*) as dupicate
   from customerchurn_dataset
    group by customerid
     having count(*)>1;

           --  Null or Blank Check For Text Columns -- 
           
	select 
        sum( case when customerid is null or customerid="" then 1 else 0 end) as null_customerid
        from CustomerChurn_Dataset;
select sum(case when gender is null or gender = '' then 1 else 0 end)
as null_gender from customerchurn_dataset;

select sum(case when SeniorCitizen is null or SeniorCitizen = '' then 1 else 0 end)
as null_SeniorCitizen from customerchurn_dataset;

select sum(case when Partner is null or Partner = '' then 1 else 0 end) 
as null_Partner from customerchurn_dataset;

select sum(case when Dependents is null or Dependents = '' then 1 else 0 end) 
as null_Dependents from customerchurn_dataset;

select sum(case when PhoneService is null or PhoneService = '' then 1 else 0 end) 
as null_PhoneService from customerchurn_dataset;

select sum(case when MultipleLines is null or MultipleLines = '' then 1 else 0 end) 
as null_MultipleLines from customerchurn_dataset;

select sum(case when InternetService is null or InternetService = '' then 1 else 0 end) 
as null_InternetService from customerchurn_dataset;

select sum(case when OnlineSecurity is null or OnlineSecurity = '' then 1 else 0 end) 
as null_OnlineSecurity from customerchurn_dataset;

select sum(case when OnlineBackup is null or OnlineBackup = '' then 1 else 0 end) 
as null_OnlineBackup from customerchurn_dataset;

select sum(case when DeviceProtection is null or DeviceProtection = '' then 1 else 0 end) 
as null_DeviceProtection from customerchurn_dataset;

select sum(case when TechSupport is null or TechSupport = '' then 1 else 0 end) 
as null_TechSupport from customerchurn_dataset;

select sum(case when StreamingTV is null or StreamingTV = '' then 1 else 0 end) 
as null_StreamingTV from customerchurn_dataset;

select sum(case when StreamingMovies is null or StreamingMovies = '' then 1 else 0 end) 
as null_StreamingMovies from customerchurn_dataset;

select sum(case when Contract is null or Contract = '' then 1 else 0 end) 
as null_Contract from customerchurn_dataset;

select sum(case when PaperlessBilling is null or PaperlessBilling = '' then 1 else 0 end) 
as null_PaperlessBilling from customerchurn_dataset;

select sum(case when PaymentMethod is null or PaymentMethod = '' then 1 else 0 end) 
as null_PaymentMethod from customerchurn_dataset;

-- Null & Blank Check for Numeric Columns --
select sum(case when tenure is null then 1 else 0 end) 
as null_tenure from customerchurn_dataset;

select sum(case when MonthlyCharges is null then 1 else 0 end) 
as null_MonthlyCharges from customerchurn_dataset;

select sum(case when TotalCharges is null then 1 else 0 end) 
as null_TotalCharges from customerchurn_dataset;

select sum(case when Churn is null then 1 else 0 end)
as null_Churn from customerchurn_dataset;

select sum(case when AvgChargesPerMonth is null then 1 else 0 end) 
as null_AvgChargesPerMonth from customerchurn_dataset;

-- Validating number columns for negative or zero value --
select * from customerchurn_dataset where tenure < 0 or tenure=0 or
monthlyCharges < 0 or monthlyCharges = 0 or AvgChargesPerMonth < 0 or AvgChargesPerMonth = 0;


-- Validating unique category --

select distinct gender from customerchurn_dataset;
select distinct Contract from customerchurn_dataset;
select distinct PaymentMethod from customerchurn_dataset;
select distinct InternetService from customerchurn_dataset;



--- AGGREGATION ---

-- Overall churn rate --

select count(*) as total_customers,
sum(case when Churn = 'Yes' then 1 else 0 end) as churned_customers,
ROUND(100.0 * sum(case when Churn = 'Yes' then 1 else 0 end) / count(*), 2) as churn_rate
from customerchurn_dataset;

-- churn rate by gender --

select gender,
count(*) as total_customers,
sum(case when Churn="yes" then 1 else 0 end) as churned_customers,
round(100*sum(case when Churn = "Yes"then 1 else 0 end)/count(*),2) as churn_rate
from customerchurn_dataset
group by gender
order by churn_rate;

-- churn rate by senior citizens --

select SeniorCitizen,
count(*) as total_customers,
sum(case when Churn = 'Yes' then 1 else 0 end) as churned,
ROUND(100.0 * sum(case when Churn = 'Yes' then 1 else 0 end) / count(*), 2) as churn_rate
from customerchurn_dataset
group by SeniorCitizen
order by churn_rate;


-- churn rate by contract --

select contract,
count(*) as total_customers,
sum(case when Churn = 'Yes' then 1 else 0 end) as churned,
ROUND(100.0 * sum(case when Churn = 'Yes' then 1 else 0 end) / count(*), 2) as churn_rate
from customerchurn_dataset
group by contract
order by churn_rate;

-- churn by internet service --

select InternetService,
count(*) as total_customers,
sum(case when Churn = 'Yes' then 1 else 0 end) as churned,
ROUND(100.0 * sum(case when Churn = 'Yes' then 1 else 0 end) / count(*), 2) as churn_rate
from customerchurn_dataset
group by InternetService
order by churn_rate;

-- churn by payment method --

select paymentmethod,
count(*) as total_customers,
sum(case when Churn = 'Yes' then 1 else 0 end) as churned,
ROUND(100.0 * sum(case when Churn = 'Yes' then 1 else 0 end) / count(*), 2) as churn_rate
from customerchurn_dataset
group by paymentmethod
order by churn_rate;


-- churn by tenure --

select case when tenure between 0 and 12  then '0-1 year'
when tenure between 13 and 24 then '1-2 year'
when tenure between 25 and 48 then '2-4 year'
when tenure > 48 then '4+ year' end as tenure_group,
count(*) as total_customers,
sum(case when Churn = 'Yes' then 1 else 0 end) as churned,
ROUND(100.0 * sum(case when Churn = 'Yes' then 1 else 0 end) / count(*), 2) as churn_rate
from customerchurn_dataset
group by tenure_group
order by tenure_group;









