-- Data Cleaning

SELECT * FROM world_layoffs.layoffs;

-- Remove Duplicates
-- Standardize the Data
-- Null values or Blank Values
-- Remove Any Columns

CREATE TABLE layoffs_staging like layoffs;

select * from layoffs_staging;

insert layoffs_staging 
select * from layoffs;

--                     Remove Duplicates

select *, ROW_NUMBER() OVER(PARTITION BY company,industry,total_laid_off,percentage_laid_off,`date`) AS row_num from layoffs_staging;

WITH duplicate_cte AS
(
select *, ROW_NUMBER() OVER(PARTITION BY company,location,industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions) AS row_num from layoffs_staging
)
SELECT * FROM duplicate_cte
where row_num>1;

select * from layoffs_staging where company='NS8';
WITH duplicate_cte AS
(
select *, ROW_NUMBER() OVER(PARTITION BY company,location,industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions) AS row_num from layoffs_staging
)
DELETE FROM duplicate_cte
where row_num>1;


CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

select * from layoffs_staging2;

insert into layoffs_staging2
select *, ROW_NUMBER() OVER(PARTITION BY company,location,industry,total_laid_off,percentage_laid_off,`date`,stage,country,funds_raised_millions) AS row_num from layoffs_staging;

select * from layoffs_staging2 where row_num>1;

SET SQL_SAFE_UPDATES = 0;

DELETE FROM layoffs_staging2 where row_num>1;

select * from layoffs_staging2 where row_num>1;

--                     Standardizing the Data

SELECT 
    company, TRIM(company)
FROM
    layoffs_staging2;
    
UPDATE layoffs_staging2
SET company= TRIM(company);

SELECT 
    *
FROM
    layoffs_staging2 where industry like 'Crypto%';
    
UPDATE layoffs_staging2
SET industry='Crypto'
where industry like 'Crypto%';

SELECT DISTINCT(industry) from layoffs_staging2 order by 1;

SELECT DISTINCT(location) FROM layoffs_staging2 ORDER BY 1;

SELECT DISTINCT country FROM layoffs_staging2 ORDER BY 1;

SELECT 
    *
FROM
    layoffs_staging2 where country like 'United States%';
    
SELECT DISTINCT country, TRIM( TRAILING '.' FROM country) from layoffs_staging2 order by 1;
    
UPDATE layoffs_staging2
SET country=TRIM(TRAILING '.' FROM country)
where country like 'United States%';

SELECT * FROM layoffs_staging2;

SELECT `date` FROM layoffs_staging2;

SELECT `date`, str_to_date(`date`,'%m/%d/%Y') FROM layoffs_staging2;

ALTER TABLE layoffs_staging2
MODIFY COLUMN `date` DATE;

UPDATE layoffs_staging2
SET `date`= str_to_date(`date`,'%m/%d/%Y');

SELECT * FROM layoffs_staging2;
 
--                              Removing Nulls

SELECT 
    *
FROM
    layoffs_staging2
WHERE
    total_laid_off IS NULL
        AND percentage_laid_off IS NULL;
        
DELETE FROM layoffs_staging2
WHERE
    total_laid_off IS NULL
        AND percentage_laid_off IS NULL;
        
UPDATE layoffs_staging2
SET industry = NULL 
WHERE industry ='';
        
SELECT * from layoffs_staging2 WHERE industry IS NULL OR industry = '';

SELECT * FROM layoffs_staging2 WHERE company='Airbnb';

SELECT * FROM layoffs_staging2 WHERE company LIKE'Bally%';

SELECT 
    t1.industry,t2.industry
FROM
    layoffs_staging2 t1
        JOIN
    layoffs_staging2 t2 ON t1.company = t2.company
WHERE
    (t1.industry IS NULL OR t1.industry = '')
        AND t2.industry IS NOT NULL;
    
UPDATE layoffs_staging2 t1
JOIN layoffs_staging2 t2
	ON t1.company=t2.company
SET t1.industry=t2.industry
WHERE (t1.industry IS NULL OR t1.industry = '')
AND t2.industry IS NOT NULL;

SELECT * FROM layoffs_staging2;

ALTER TABLE layoffs_staging2
DROP COLUMN row_num;

SELECT * FROM layoffs_staging2;









