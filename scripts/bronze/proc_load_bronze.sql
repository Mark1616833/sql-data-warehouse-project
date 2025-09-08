CREATE OR ALTER PROCEDURE bronz.load_bronz AS
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME;

	BEGIN TRY
		
		SET @batch_start_time = GETDATE();

		PRINT '==========================';
		PRINT 'Loading Bronz Layer';
		PRINT '==========================';
	
		PRINT '--------------------------';
		PRINT 'Loading CRM Tables';
		PRINT '--------------------------';
	
	
		-- 1ST TABLE
		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronz.crm_cust_info';
		TRUNCATE TABLE bronz.crm_cust_info;

		PRINT '>> Inserting Data Into: bronz.crm_cust_info';
		BULK INSERT bronz.crm_cust_info
		FROM 'C:\Users\Marcel\OneDrive\Documents - Desktop - OD\Data Engineer\Baraa - Data with Baraa\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -----------------------';

		/*
		SELECT *
		FROM bronz.crm_cust_info
		*/
			
			-- 2ND TABLE
		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronz.crm_prd_info';
		TRUNCATE TABLE bronz.crm_prd_info;

		PRINT '>> Inserting Data Into: bronz.crm_prd_info';
		BULK INSERT bronz.crm_prd_info
		FROM 'C:\Users\Marcel\OneDrive\Documents - Desktop - OD\Data Engineer\Baraa - Data with Baraa\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -----------------------';

		/*
		SELECT COUNT(*) 
		FROM bronz.crm_prd_info
		*/

		-- 3RD TABLE
		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronz.crm_sales_details';
		TRUNCATE TABLE bronz.crm_sales_details;

		PRINT '>> Inserting Data Into: bronz.crm_sales_details';
		BULK INSERT bronz.crm_sales_details
		FROM 'C:\Users\Marcel\OneDrive\Documents - Desktop - OD\Data Engineer\Baraa - Data with Baraa\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -----------------------';

		/*
		SELECT COUNT (*)
		FROM bronz.crm_sales_details
		*/

		PRINT '--------------------------';
		PRINT 'Loading ERP Tables';
		PRINT '--------------------------';

		-- 4th TABLE, THERE ARE 18483 ROWS IN THE TABLE, IN THE SOURCE THERE ARE 18484
		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronz.erp_cust_az12';
		TRUNCATE TABLE bronz.erp_cust_az12;

		PRINT '>> Inserting Data Into: bronz.erp_cust_az12';
		BULK INSERT bronz.erp_cust_az12
		FROM 'C:\Users\Marcel\OneDrive\Documents - Desktop - OD\Data Engineer\Baraa - Data with Baraa\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT 'Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -----------------------';
		/*
		SELECT COUNT (*)
		FROM bronz.erp_cust_az12
		*/

		-- TABLE 5
		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronz.erp_loc_a101';
		TRUNCATE TABLE bronz.erp_loc_a101;


		PRINT '>> Inserting Data Into: bronz.erp_loc_a101';
		BULK INSERT bronz.erp_loc_a101
		FROM 'C:\Users\Marcel\OneDrive\Documents - Desktop - OD\Data Engineer\Baraa - Data with Baraa\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -----------------------';
		/*
		SELECT COUNT (*)
		FROM bronz.erp_loc_a101
		*/

		--TABLE 6
		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronz.erp_px_cat_g1v2';
		TRUNCATE TABLE bronz.erp_px_cat_g1v2;

		PRINT '>> Inserting Data Into: bronz.erp_px_cat_g1v2';
		BULK INSERT bronz.erp_px_cat_g1v2
		FROM 'C:\Users\Marcel\OneDrive\Documents - Desktop - OD\Data Engineer\Baraa - Data with Baraa\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
		WITH (
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> Load Duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds';
		PRINT '>> -----------------------';
		/*
		SELECT COUNT (*)
		FROM bronz.erp_px_cat_g1v2
		*/

		SET @batch_end_time = GETDATE();
		PRINT '============================='
		PRINT 'Total Load Time: ' + CAST(DATEDIFF(second, @batch_start_time, @batch_end_time) AS NVARCHAR) + ' seconds';
		PRINT '============================='
	END TRY

	BEGIN CATCH
	PRINT '=================================';
	PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER';
	PRINT 'Error Message' + ERROR_MESSAGE();
	PRINT 'Error Message' + CAST (ERROR_NUMBER()AS NVARCHAR);
	PRINT 'Error Message' + CAST (ERROR_STATE() AS NVARCHAR);
	PRINT '=================================';
	END CATCH
END
