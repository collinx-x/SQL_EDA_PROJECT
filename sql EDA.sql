SELECT *
FROM layoffs_staging2;

SELECT MAX(total_laid_off), MAX(percentage_laid_off)
FROM layoffs_staging2;

SELECT MIN(total_laid_off), MIN(percentage_laid_off)
from layoffs_staging2;

SELECT *
FROM layoffs_staging2
WHERE percentage_laid_off = 1
ORDER BY total_laid_off DESC;

SELECT *
FROM layoffs_staging2
WHERE percentage_laid_off = 1
ORDER BY total_laid_off;

SELECT *
FROM layoffs_staging2
WHERE percentage_laid_off = 1
ORDER BY funds_raised_millions DESC;

SELECT company, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company
ORDER BY 2 DESC;

SELECT MIN(`DATE`), MAX(`DATE`)
FROM layoffs_staging2;

SELECT industry, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY industry
ORDER BY 2 DESC;

SELECT country, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY country
ORDER BY 2 DESC;

SELECT company, percentage_laid_off, `date`
FROM layoffs_staging2
ORDER BY 2 DESC;

SELECT country, sum(total_laid_off)
FROM layoffs_staging2
WHERE country = 'United States';

SELECT *
FROM layoffs_staging2;

SELECT YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY YEAR(`date`)
ORDER BY 1 DESC;

SELECT stage, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY stage
ORDER BY 2 DESC;

SELECT company, SUM(percentage_laid_off)
FROM layoffs_staging2
GROUP BY company
ORDER BY 2 DESC;

SELECT company, AVG(percentage_laid_off)
FROM layoffs_staging2
GROUP BY company
ORDER BY 2 DESC;

SELECT substring(`date`, 1,7) `MONTH` , SUM(total_laid_off) TOTAL_OFF
FROM layoffs_staging2
WHERE substring(`date`, 1,7) IS NOT NULL
GROUP BY `MONTH`
ORDER BY 1;

WITH Rolling_Total AS
(
SELECT substring(`date`, 1,7) `MONTH` , SUM(total_laid_off) TOTAL_OFF
FROM layoffs_staging2
WHERE substring(`date`, 1,7) IS NOT NULL
GROUP BY `MONTH`
ORDER BY 1
)
SELECT `MONTH` , TOTAL_OFF,
SUM(TOTAL_OFF) OVER(ORDER BY `MONTH`)  rolling_total
FROM Rolling_Total;


SELECT company, SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company
ORDER BY 2 DESC;

SELECT company, YEAR(`DATE`) , SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company, `DATE`
ORDER BY 3 DESC;

WITH COMPANY_YEAR (company, years, total_laid_off) AS
(
SELECT company, YEAR(`DATE`) , SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company, YEAR(`DATE`)
), COMPANY_YEAR_RANK AS 
(SELECT *,
DENSE_RANK() OVER(PARTITION BY years ORDER BY total_laid_off DESC) Ranking
FROM COMPANY_YEAR
WHERE years IS NOT NULL
)
SELECT *
FROM COMPANY_YEAR_RANK
WHERE Ranking <= 5;





SELECT * 
FROM layoffs_staging2;

















