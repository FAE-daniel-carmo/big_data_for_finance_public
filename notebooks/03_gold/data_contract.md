# Data Contract: Indicadores Financeiros e Contábeis (Padrão CVM)

Este documento estabelece a especificação técnica do contrato de dados para variáveis contábeis e indicadores financeiros baseados no padrão CVM.

---

## Variáveis Nível 1

Esta tabela apresenta as variáveis fundamentais extraídas diretamente das contas contábeis.

| Variável | Descrição | CD_CONTA | DS_CONTA |
| --- | --- | --- | --- |
| **V1_AC** | Ativo Circulante | 1.01 | Ativo Circulante |
| **V1_ANC** | Ativo Não Circulante | 1.02 | Ativo Não Circulante |
| **V1_RLP** | Recebíveis Longo Prazo | 1.02.01 | Ativo Realizável a Longo Prazo |
| **V1_PC** | Passivo Circulante | 2.01 | Passivo Circulante |
| **V1_PNC** | Passivo Não Circulante | 2.02 | Passivo Não Circulante |
| **V1_ES** | Estoques | 1.01.04 | Estoques |
| **V1_CX** | Caixa | 1.01.01 | Caixa e Equivalentes de Caixa |
| **V1_AP** | Aplicações | 1.01.02 | Aplicações Financeiras |
| **V1_PL** | Património Líquido | 2.03 | Patrimônio Líquido Consolidado |
| **V1_AI** | Ativo Imobilizado | 1.02.03 | Imobilizado |
| **V1_LB** | Lucro Bruto | 3.03 | Resultado Bruto |
| **V1_RL** | Receita Líquida | 3.01 | Receita de Venda de Bens e/ou Serviços |
| **V1_CR** | Contas a Receber | 1.01.03 | Contas a Receber |
| **V1_CP** | Contas a Pagar | 2.01.02 | Fornecedores |
| **V1_FO** | Fornecedores | 2.01.02 | Fornecedores |
| **V1_LL** | Lucro Líquido | 3.11 | Lucro/Prejuízo Líquido do Período |
| **V1_EFCP** | Empréstimos e Financiamentos Curto Prazo | 2.01.04 | Empréstimos e Financiamentos |
| **V1_EFLP** | Empréstimos e Financiamentos Longo Prazo | 2.02.01 | Empréstimos e Financiamentos |
| **V1_EBIT** | EBIT | 3.05 | Resultado Antes do Resultado Financeiro e dos Tributos |
| **V1_COGS** | Custo de Bens ou serviços vendidos | 3.02 | Custo de Bens e/ou Serviços Vendidos |

---

## Variáveis Nível 2

Esta tabela contém as variáveis compostas que são calculadas a partir das variáveis de Nível 1.

| Variável | Descrição | Fórmula |
| --- | --- | --- |
| **V2_AT** | Ativo Total | `V2_AT = V1_AC + V1_ANC` |
| **V2_EFT** | Empréstimos e Financiamentos Total | `V2_EFT = V1_EFCP + V1_EFLP` |

---

## Indicadores

Esta tabela reúne os indicadores financeiros e operacionais divididos por seus respectivos tipos de análise.

| Tipo | Variável | Descrição | Fórmula |
| --- | --- | --- | --- |
| **LIQUIDEZ** | I_LIQ_GER | Liquidez Geral | `I_LIQ_GER = (V1_AC + V1_RLP) / (V1_PC + V1_PNC)` |
| **LIQUIDEZ** | I_LIQ_COR | Liquidez Corrente | `I_LIQ_COR = V1_AC / V1_PC` |
| **LIQUIDEZ** | I_LIQ_SEC | Liquidez Seca | `I_LIQ_SEC = (V1_AC - V1_ES) / V1_PC` |
| **LIQUIDEZ** | I_LIQ_IME | Liquidez Imediata | `I_LIQ_IME = (V1_CX + V1_AP) / V1_PC` |
| **ENDIVIDAMENTO** | I_PCT_CP | PCT / CP | `I_PCT_CP = (V1_PC + V1_PNC) / V1_PL` |
| **ENDIVIDAMENTO** | I_PCT_AT | PCT/AT | `I_PCT_AT = (V1_PC + V1_PNC) / V2_AT` |
| **ENDIVIDAMENTO** | I_GAR_CP_CT | Garantia CP/CT | `I_GAR_CP_CT = V1_PL / (V1_PC + V1_PNC)` |
| **ENDIVIDAMENTO** | I_COMP_ENDIV | Comp. Endividamento | `I_COMP_ENDIV = V1_PC / (V1_PC + V1_PNC)` |
| **ENDIVIDAMENTO** | I_IMOB_PL | Imobilização do PL | `I_IMOB_PL = V1_AI / V1_PL` |
| **ENDIVIDAMENTO** | I_IMOB_AT | Imobilização do AT | `I_IMOB_AT = V1_AI / V2_AT` |
| **MARGEM_LUCRO** | I_MARGEM_LUCR | Margem Bruta | `I_MARGEM_LUCR = V1_LB / V1_RL` |
| **MARGEM_LUCRO** | I_MARGEM_OPER | Margem Operacional | `I_MARGEM_OPER = V1_EBIT / V1_RL` |
| **MARGEM_LUCRO** | I_MARGEM_LIQ | Margem Líquida | `I_MARGEM_LIQ = V1_LL / V1_RL` |
| **RENTABILIDADE** | I_ROA | Retorno s/Ativo | `I_ROA = V1_LL / V2_AT` |
| **RENTABILIDADE** | I_ROE | Retorno s/Patrimonio | `I_ROE = V1_LL / V1_PL` |
| **RENTABILIDADE** | I_ROI | Retorno s/Investimento | `I_ROI = V1_LL / (V2_EFT + V1_PL)` |
| **ATIVIDADE** | I_GIR_ESTQ | Giro dos Estoques | `I_GIR_ESTQ = V1_COGS / V1_ES` |
| **ATIVIDADE** | I_GIR_CR | Giro Contas a Receber | `I_GIR_CR = V1_RL / V1_CR` |
| **ATIVIDADE** | I_GIR_CP | Giro Contas a Pagar | `I_GIR_CP = V1_COGS / V1_FO` |
| **ATIVIDADE** | I_GIR_AC | Giro Ativo Circulante | `I_GIR_AC = V1_RL / V1_AC` |
| **ATIVIDADE** | I_PMRE | PMRE (dias) | `I_PMRE = V1_ES * 360 / V1_COGS` |
| **ATIVIDADE** | I_PMRV | PMRV (dias) | `I_PMRV = V1_CR * 360 / V1_RL` |
| **ATIVIDADE** | I_PMPC | PMPC (dias) | `I_PMPC = V1_FO * 360 / V1_COGS` |
| **ATIVIDADE** | I_PMRAC | PMRAC (dias) | `I_PMRAC = V1_AC * 360 / V1_RL` |
| **CICLOS** | I_CICLO_ECON | Ciclo Econômico | `I_CICLO_ECON = I_PMRE + I_PMRV` |
| **CICLOS** | I_CICLO_FIN | Ciclo Financeiro | `I_CICLO_FIN = I_PMRE + I_PMRV - I_PMPC` |
| **RECURSOS_FIN** | I_CGL_CCL | CGL/CCL | `I_CGL_CCL = V1_AC - V1_PC` |
| **RECURSOS_FIN** | I_NCG | NCG | `I_NCG = (V1_ES + V1_CR) - V1_FO` |
| **RECURSOS_FIN** | I_ST | Saldo de Tesouraria | `I_ST = V1_AC - V1_EFCP` |