--Q1 = D
--Q2 = D
--Q3 = A
--Q4 = C

-- Q5 = B
-- Sobre o ENEM 2020, qual é a média da nota em matemática 
-- apenas para as alunas do sexo Feminino?

SELECT 
    --AVG(nu_nota_mt) AS MEDIA_MAT_FEM
    AVG(NULLIF(nu_nota_mt,0))
FROM 
    "stg_enem2020"
WHERE 
    tp_sexo = 'F'


-- Q6 = D
-- Qual é a média da nota em Ciências Humanas para os alunos 
-- do sexo masculino que estudaram numa escola no estado de São Paulo?

SELECT 
AVG(nu_nota_ch) AS MEDIA_CH_SP
FROM 
    "stg_enem2020"
WHERE 
    tp_sexo = 'M' AND
    sg_uf_esc = 'SP'

--Q7 = C
-- Qual é a média da nota em Ciências Humanas dos alunos que 
-- estudaram numa escola na cidade de Natal?

SELECT 
AVG(nu_nota_ch) AS MEDIA_CH_NATAL
FROM 
    "stg_enem2020"
WHERE 
    no_municipio_esc = 'Natal'

--Q8 = B
-- Qual é o município (município da escola) que obteve a maior
-- nota MÉDIA em matemática?

-- Novo Itacolomi = 4117297
-- Novo Xingu = 4313466
-- Biquinhas = 3107000

SELECT 
    co_municipio_esc,
    AVG(NULLIF(nu_nota_mt,0))
FROM 
    "stg_enem2020"
where
    co_municipio_esc = 4117297 or 
    co_municipio_esc = 4313466 or 
    co_municipio_esc = 3107000 
group by 
    co_municipio_esc


--Q9 = C
-- Quantas pessoas que estudaram numa escola em Recife fizeram
-- a prova do ENEM nessa mesma cidade?

SELECT 
    count(*)
FROM 
    "stg_enem2020"
WHERE 
    --no_municipio_esc = 'Recife'
    co_municipio_esc = 2611606 AND 
    co_municipio_prova = 2611606


-- Q10 = B
-- Qual é a nota média em Ciências Humanas dos alunos que 
-- estudaram numa escola no estado de Santa Catarina e 
-- possuem PELO MENOS 1 banheiro em casa?

SELECT 
    AVG(nu_nota_ch) AS MEDIA_CH_SC
FROM 
    "stg_enem2020"
WHERE 
    sg_uf_esc = 'SC' and
    q008 != 'A'


-- Q11 = A
-- Qual é a nota média em matemática dos alunos cuja mãe possui
-- PELO MENOS o ensino superior completo, do sexo feminino que 
-- estudaram numa escola em Belo Horizonte?

SELECT 
    AVG(nu_nota_mt) AS MEDIA_MAT
FROM 
    "stg_enem2020"
WHERE 
    tp_sexo = 'F' AND
    --no_municipio_esc = 'Belo Horizonte'
    co_municipio_esc = 3106200 AND 
    (q002 = 'F' OR q002 = 'G')



