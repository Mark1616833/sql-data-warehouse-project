/*
Add some comments here.
*/
IF OBJECT_ID ('bronz.crm_prd_info', 'U') IS NOT NULL
	DROP TABLE bronz.crm_prd_info;
CREATE TABLE bronz.crm_prd_info (
	prd_id INT,
	prd_key NVARCHAR (50),
	prd_nm NVARCHAR (50),
	prd_cost INT,
	prd_line NVARCHAR (50),
	prd_start_dt DATETIME, 
	prd_end_dt DATETIME
);

IF OBJECT_ID ('bronz.crm_sales_details', 'U') IS NOT NULL
	DROP TABLE bronz.crm_sales_details;
CREATE TABLE bronz.crm_sales_details (
sls_ord_num NVARCHAR (50),
sls_prd_key NVARCHAR (50),
sls_cust_id INT,
sls_order_dt INT,
sls_ship_dt INT,
sls_due_dt INT,
sls_sales INT,
sls_quantity INT,
sls_price INT
);

IF OBJECT_ID ('bronz.erp_cust_az12', 'U') IS NOT NULL
	DROP TABLE bronz.erp_cust_az12;
CREATE TABLE bronz.erp_cust_az12 (
	cid NVARCHAR (50),
	bday DATE,
	gen NVARCHAR (50)
);


IF OBJECT_ID ('bronz.erp_loc_a101', 'U') IS NOT NULL
	DROP TABLE bronz.erp_loc_a101;
CREATE TABLE bronz.erp_loc_a101 (
	cid NVARCHAR (50),
	cntry NVARCHAR (50)
);

IF OBJECT_ID ('bronz.erp_px_cat_g1v2', 'U') IS NOT NULL
	DROP TABLE bronz.erp_px_cat_g1v2;
CREATE TABLE bronz.erp_px_cat_g1v2 (
	id				NVARCHAR (50),
	cat				NVARCHAR (50),
	subcat			NVARCHAR (50),
	maintenance		NVARCHAR (50)
);







