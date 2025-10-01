#----------------------------------------------------------------------------------------
# Nome Completo: Daniel Corradi Lavarini
# Número de chamada: 12
# Turma: B
#----------------------------------------------------------------------------------------

# LIMIT
# 1) Mostre os 3 primeiros professores cadastrados na tabela DE PROFESSORES.

SELECT nome 
FROM tbl_professor 
LIMIT 3;

#----------------------------------------------------------------------------------------
# COUNT
# 2) Conte quantos alunos existem na tabela alunos.

SELECT COUNT(id_aluno)
FROM tbl_aluno;

#----------------------------------------------------------------------------------------
# SUM
# 3) Mostre o total de faltas de todos os alunos juntos.

SELECT SUM(faltas)
FROM tbl_desempenho;

SELECT D.aluno_id, A.nome, SUM(faltas)
FROM tbl_desempenho D 
INNER JOIN tbl_aluno A
ON D.aluno_id = A.id_aluno
group by D.aluno_id;

#----------------------------------------------------------------------------------------
# AVG
# 4) Mostre a média geral das notas da disciplina de Matemática.

SELECT AVG(nota)
FROM tbl_desempenho;

#----------------------------------------------------------------------------------------
# MAX
# 5) Descubra qual foi a maior nota da disciplina de Português.

SELECT 		max(d.nota)
FROM 		tbl_desempenho d		
INNER JOIN 	tbl_disciplina i ON d.disciplina_id = i.id_disciplina 	
WHERE 		i.nome = 'Português'
ORDER BY 	i.nome;

#----------------------------------------------------------------------------------------
# MIN
# 6) Descubra qual foi a menor nota registrada na tabela de notas.

SELECT min(nota)
FROM tbl_desempenho;

#----------------------------------------------------------------------------------------
# ROUND
# 7) Mostre a média das notas de Inglês arredondada para 2 casas decimais.

SELECT round( avg (nota),2)
FROM tbl_desempenho;

#----------------------------------------------------------------------------------------
# TRUNCATE
# 8) Mostre a média das notas de História truncada (sem arredondar) para 1 casa decimal.

SELECT truncate( avg (nota),1)
FROM tbl_desempenho;

#----------------------------------------------------------------------------------------
# ABS
# 9) Mostre o valor absoluto da diferença entre a maior nota e a menor nota de Biologia.

SELECT 		ABS(MAX(d.nota)  - MIN(d.nota))
FROM 		tbl_desempenho d		
INNER JOIN 	tbl_disciplina i ON d.disciplina_id = i.id_disciplina 	
WHERE 		i.nome = 'Biologia'
ORDER BY 	i.nome;

#----------------------------------------------------------------------------------------
# Combinação (LIMIT + MAX por aluno)
# 10) Liste o id do aluno e a nota mais alta que ele obteve, mas mostre apenas os 2 primeiros resultados.

SELECT a.id_aluno ,a.nome, max(d.nota)
FROM tbl_aluno a
INNER JOIN tbl_desempenho d
GROUP BY aluno_id
LIMIT 2;

#----------------------------------------------------------------------------------------

SELECT z.nome ,a.id_aluno ,d.disciplina_id, d.nota, d.faltas
FROM tbl_aluno a
INNER JOIN tbl_desempenho d
INNER JOIN tbl_disciplina z
ON a.id_aluno = d.aluno_id;

