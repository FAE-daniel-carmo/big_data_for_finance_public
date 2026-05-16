# Data Contract: Indicadores Financeiros e Contábeis (Padrão CVM)

Este documento estabelece a especificação técnica do contrato de dados para variáveis contábeis e indicadores financeiros baseados no padrão CVM.

---

## 1. Mapeamento de Variáveis Base (Plano de Contas)

| Variável | Descrição | CD_CONTA | DS_CONTA |
| :--- | :--- | :--- | :--- |
| **AC** | Ativo Circulante | `1.01` | Ativo Circulante |
| **ANC** | Ativo Não Circulante | `1.02` | Ativo Não Circulante |
| **RLP** | Recebíveis Longo Prazo | `1.02.01` | Ativo Realizável a Longo Prazo |
| **PC** | Passivo Circulante | `2.01` | Passivo Circulante |
| **PNC** | Passivo Não Circulante | `2.02` | Passivo Não Circulante |
| **ES** | Estoques | `1.01.04` | Estoques |
| **CX** | Caixa | `1.01.01` | Caixa e Equivalentes de Caixa |
| **AP** | Aplicações | `1.01.02` | Aplicações Financeiras |
| **PL** | Patrimônio Líquido | `2.03` | Patrimônio Líquido Consolidado |
| **AI** | Ativo Imobilizado | `1.02.03` | Imobilizado |
| **LB** | Lucro Bruto | `3.03` | Resultado Bruto |
| **RL** | Receita Líquida | `3.01` | Receita de Venda de Bens e/ou Serviços |
| **CR** | Contas a Receber | `1.01.03` | Contas a Receber |
| **CP** | Contas a Pagar | `2.01.02` | Fornecedores |
| **FO** | Fornecedores | `2.01.02` | Fornecedores |
| **LL** | Lucro Líquido | `3.11` | Lucro/Prejuízo Líquido do Período |
| **EFCP** | Empréstimos e Financiamentos Curto Prazo | `2.01.04` | Empréstimos e Financiamentos |
| **EFLP** | Empréstimos e Financiamentos Longo Prazo | `2.02.01` | Empréstimos e Financiamentos |
| **EBIT** | EBIT | `3.05` | Resultado Antes do Resultado Financeiro e dos Tributos |
| **COGS** | Custo de Bens ou serviços vendidos | `3.02` | Custo de Bens e/ou Serviços Vendidos |

---

## 2. Variáveis Intermediárias (Cálculos de Apoio)

| Variável | Descrição | Fórmula |
| :--- | :--- | :--- |
| **PCT** | Participação do Capital de Terceiros | `PCT = PC + PNC` |
| **AT** | Ativo Total | `AT = AC + ANC` |
| **EFT** | Empréstimos e Financiamentos Total | `EFT = EFCP + EFLP` |

---

## 3. Tabela Unificada de Indicadores

| Tipo | Variável | Descrição | Fórmula |
| :--- | :--- | :--- | :--- |
| **LIQUIDEZ** | `I_LIQ_GER` | Liquidez Geral | `(AC + RLP) / (PC + PNC)` |
| **LIQUIDEZ** | `I_LIQ_COR` | Liquidez Corrente | `AC / PC` |
| **LIQUIDEZ** | `I_LIQ_SEC` | Liquidez Seca | `(AC - ES) / PC` |
| **LIQUIDEZ** | `I_LIQ_IME` | Liquidez Imediata | `(CX + AP) / PC` |
| **ENDIVIDAMENTO** | `I_PCT_CP` | PCT / CP | `(PC + PNC) / PL` |
| **ENDIVIDAMENTO** | `I_PCT_AT` | PCT/AT | `(PC + PNC) / AT` |
| **ENDIVIDAMENTO** | `I_GAR_CP_CT` | Garantia CP/CT | `PL / (PC + PNC)` |
| **ENDIVIDAMENTO** | `I_COMP_ENDIV` | Comp. Endividamento | `PC / (PC + PNC)` |
| **ENDIVIDAMENTO** | `I_IMOB_PL` | Imobilização do PL | `AI / PL` |
| **ENDIVIDAMENTO** | `I_IMOB_AT` | Imobilização do AT | `AI / AT` |
| **MARGEM_LUCRO** | `I_MARGEM_LUCR` | Margem Bruta | `LB / RL` |
| **MARGEM_LUCRO** | `I_MARGEM_OPER` | Margem Operacional | `EBIT / RL` |
| **MARGEM_LUCRO** | `I_MARGEM_LIQ` | Margem Líquida | `LL / RL` |
| **RENTABILIDADE** | `I_ROA` | Retorno s/Ativo | `LL / AT` |
| **RENTABILIDADE** | `I_ROE` | Retorno s/Patrimonio | `LL / PL` |
| **RENTABILIDADE** | `I_ROI` | Retorno s/Investimento | `LL / (EFT + PL)` |
| **ATIVIDADE** | `I_GIR_ESTQ` | Giro dos Estoques | `COGS / ES` |
| **ATIVIDADE** | `I_GIR_CR` | Giro Contas a Receber | `RL / CR` |
| **ATIVIDADE** | `I_GIR_CP` | Giro Contas a Pagar | `COGS / FO` |
| **ATIVIDADE** | `I_GIR_AC` | Giro Ativo Circulante | `RL / AC` |
| **ATIVIDADE** | `I_PMRE` | PMRE (dias) | `(ES * 360) / COGS` |
| **ATIVIDADE** | `I_PMRV` | PMRV (dias) | `(CR * 360) / RL` |
| **ATIVIDADE** | `I_PMPC` | PMPC (dias) | `(FO * 360) / COGS` |
| **ATIVIDADE** | `I_PMRAC` | PMRAC (dias) | `(AC * 360) / RL` |
| **CICLOS** | `I_CICLO_ECON` | Ciclo Econômico | `I_PMRE + I_PMRV` |
| **CICLOS** | `I_CICLO_FIN` | Ciclo Financeiro | `I_PMRE + I_PMRV - I_PMPC` |
| **RECURSOS_FIN** | `I_CGL_CCL` | CGL/CCL | `AC - PC` |
| **RECURSOS_FIN** | `I_NCG` | NCG | `(ES + CR) - FO` |
| **RECURSOS_FIN** | `I_ST` | Saldo de Tesouraria | `AC - EFCP` |

---
*Nota: A variável original contendo `ECP` na fórmula de Saldo de Tesouraria foi mapeada para `EFCP` (Empréstimos e Financiamentos de Curto Prazo) para manter consistência com o plano de contas mapeado.*
