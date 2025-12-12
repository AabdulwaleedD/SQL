SELECT *
FROM gene_expression;

DELETE FROM gene_expression
WHERE Gene_title IS NULL;

-- Upregulated genes
SELECT * FROM gene_expression
WHERE adj_p_val < 0.05 AND F > 0.5;

SELECT TOP (10)
FROM gene_expression
WHERE adj_P_Val < 0.05 AND F > 0.5
ORDER BY logFC DESC;

-- Downregulated
SELECT * FROM gene_expression
WHERE adj_p_val < 0.05 AND F < -0.5;

SELECT TOP (10) FROM gene_expression
WHERE adj_P_Val < 0.05 AND F <- 0.5
ORDER BY logFC ASC;

