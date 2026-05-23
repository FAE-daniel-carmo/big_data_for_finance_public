CREATE TABLE layer_03_gold.mart_indicadores_financeiros_x (
    -- Chaves e Atributos de Identificação / Contexto
    "CNPJ_CIA" VARCHAR(255) NOT NULL,
    "DT_REFER" DATE NOT NULL,
    "RAZAO_SOCIAL" VARCHAR(255) NOT NULL,
    "SETOR" VARCHAR(255),
    "TP_MERC" VARCHAR(255),

    -- Variáveis Nível 1 (Camada Base de Valores)
    "V1_AC" NUMERIC(18, 4),        -- Ativo Circulante
    "V1_ANC" NUMERIC(18, 4),       -- Ativo Não Circulante
    "V1_RLP" NUMERIC(18, 4),       -- Recebíveis Longo Prazo
    "V1_PC" NUMERIC(18, 4),        -- Passivo Circulante
    "V1_PNC" NUMERIC(18, 4),       -- Passivo Não Circulante
    "V1_ES" NUMERIC(18, 4),        -- Estoques
    "V1_CX" NUMERIC(18, 4),        -- Caixa
    "V1_AP" NUMERIC(18, 4),        -- Aplicações
    "V1_PL" NUMERIC(18, 4),        -- Patrimônio Líquido
    "V1_AI" NUMERIC(18, 4),        -- Ativo Imobilizado
    "V1_LB" NUMERIC(18, 4),        -- Lucro Bruto
    "V1_RL" NUMERIC(18, 4),        -- Receita Líquida
    "V1_CR" NUMERIC(18, 4),        -- Contas a Receber
    "V1_CP" NUMERIC(18, 4),        -- Contas a Pagar
    "V1_FO" NUMERIC(18, 4),        -- Fornecedores
    "V1_LL" NUMERIC(18, 4),        -- Lucro Líquido
    "V1_EFCP" NUMERIC(18, 4),      -- Empréstimos e Financiamentos Curto Prazo
    "V1_EFLP" NUMERIC(18, 4),      -- Empréstimos e Financiamentos Longo Prazo
    "V1_EBIT" NUMERIC(18, 4),      -- EBIT
    "V1_COGS" NUMERIC(18, 4),      -- Custo de Bens ou serviços vendidos

    -- Variáveis Nível 2 (Valores Agregados)
    "V2_AT" NUMERIC(18, 4),        -- Ativo Total
    "V2_EFT" NUMERIC(18, 4),       -- Empréstimos e Financiamentos Total

    -- Indicadores: Liquidez
    "I_LIQ_GER" NUMERIC(18, 4),    -- Liquidez Geral
    "I_LIQ_COR" NUMERIC(18, 4),    -- Liquidez Corrente
    "I_LIQ_SEC" NUMERIC(18, 4),    -- Liquidez Seca
    "I_LIQ_IME" NUMERIC(18, 4),    -- Liquidez Imediata

    -- Indicadores: Endividamento
    "I_PCT_CP" NUMERIC(18, 4),     -- PCT / CP
    "I_PCT_AT" NUMERIC(18, 4),     -- PCT/AT
    "I_GAR_CP_CT" NUMERIC(18, 4),  -- Garantia CP/CT
    "I_COMP_ENDIV" NUMERIC(18, 4), -- Comp. Endividamento
    "I_IMOB_PL" NUMERIC(18, 4),    -- Imobilização do PL
    "I_IMOB_AT" NUMERIC(18, 4),    -- Imobilização do AT

    -- Indicadores: Margem de Lucro
    "I_MARGEM_LUCR" NUMERIC(18, 4), -- Margem Bruta
    "I_MARGEM_OPER" NUMERIC(18, 4), -- Margem Operacional
    "I_MARGEM_LIQ" NUMERIC(18, 4),  -- Margem Líquida

    -- Indicadores: Rentabilidade
    "I_ROA" NUMERIC(18, 4),        -- Retorno s/Ativo
    "I_ROE" NUMERIC(18, 4),        -- Retorno s/Patrimonio
    "I_ROI" NUMERIC(18, 4),        -- Retorno s/Investimento

    -- Indicadores: Atividade
    "I_GIR_ESTQ" NUMERIC(18, 4),   -- Giro dos Estoques
    "I_GIR_CR" NUMERIC(18, 4),     -- Giro Contas a Receber
    "I_GIR_CP" NUMERIC(18, 4),     -- Giro Contas a Pagar
    "I_GIR_AC" NUMERIC(18, 4),     -- Giro Ativo Circulante
    "I_PMRE" NUMERIC(18, 4),       -- PMRE (dias)
    "I_PMRV" NUMERIC(18, 4),       -- PMRV (dias)
    "I_PMPC" NUMERIC(18, 4),       -- PMPC (dias)
    "I_PMRAC" NUMERIC(18, 4),      -- PMRAC (dias)

    -- Indicadores: Ciclos
    "I_CICLO_ECON" NUMERIC(18, 4),  -- Ciclo Econômico
    "I_CICLO_FIN" NUMERIC(18, 4),   -- Ciclo Financeiro

    -- Indicadores: Recursos Financeiros
    "I_CGL_CCL" NUMERIC(18, 4),    -- CGL/CCL
    "I_NCG" NUMERIC(18, 4),        -- NCG
    "I_ST" NUMERIC(18, 4),         -- Saldo de Tesouraria

    -- Definição da Chave Primária Composta
    CONSTRAINT pk_mart_indicadores_financeiros PRIMARY KEY ("CNPJ_CIA", "DT_REFER")
);

-- Índices para otimização utilizando a sintaxe de identificadores delimitados
CREATE INDEX idx_mart_ind_fin_dt_refer ON layer_03_gold.mart_indicadores_financeiros_x("DT_REFER");
CREATE INDEX idx_mart_ind_fin_setor ON layer_03_gold.mart_indicadores_financeiros_x("SETOR");
