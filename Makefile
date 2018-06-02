#origem https://www.drewsilcock.co.uk/using-make-and-latexmk
LATEX=pdflatex
LATEXOPT=--shell-escape
NONSTOP=--interaction=nonstopmode
OUTDIROPT=-outdir=pdf
OUTDIR=pdf
EXTDIR=ementasExternas

LATEXMK=latexmk
LATEXMKOPT=-pdf
#CONTINUOUS=-pvc
VPATH=pdf ementasExternas leis

CLASSEDESC=ProjetoXIA.pdf ArquiteturaDeComputadores.pdf EstagioSupervisionadoXIA.pdf EstruturasDeInformacao.pdf \
	SistemasEmbutidos.pdf

DESC=   AlgoritmosComputacionais.pdf AnaliseDeAlgoritmos.pdf \
	ProjetoDeSistemasOperacionais.pdf ComputacaoParalela.pdf ControleDeProcessosPorComputador.pdf \
	EngenhariaComputacional.pdf EngenhariaDeComputacaoESociedade.pdf EngenhariaDeSistemas.pdf \
	ProjetoEAdministracaoDeBancoDeDados.pdf   \
	FundamentosDeComputadores.pdf InteligenciaComputacional.pdf LaboratorioDeProgramacaoA.pdf \
	LaboratorioDeProgramacaoB.pdf LogicaEmProgramacao.pdf  \
	MineracaoDeDados.pdf ProcessamentoDeImagens.pdf \
	TeleprocessamentoERedes.pdf TeoriaDeCompiladores.pdf $(CLASSEDESC)

ELETIVAS=Eletiva1_ReconhecimentoDePadroes.pdf Eletiva2_RedesDeInterconexao.pdf \
	Eletiva3_Geomatica.pdf Eletiva4_ComputacaoDeAltoDesempenho.pdf Eletiva5_ProgramacaoParaDispositivosMoveis.pdf \
	Eletiva6_Padroes.pdf

ELETRICA= AnaliseDeSistemasFisicos.pdf CircuitosEletricosI.pdf CircuitosEletricosII.pdf MateriaisEletricosEMagneticos.pdf
ELETRONICA=PrincipiosDeTelecomunicacoesIII.pdf

INDUSTRIAL=EngenhariaDoTrabalhoI.pdf MetodosQuantitativos.pdf

TODASDISC= $(DESC) $(ELETRO) $(ELETRICA) $(ELETRONICA) $(INDUSTRIAL) $(ELETIVAS)

FLUXOGRAMA=fluxogramaEngenhariaComputacao.pdf

EXTERNOS= Basico/FisicaI.pdf Basico/FisicaII.pdf Basico/FisicaIII.pdf Basico/FisicaIV.pdf \
	Basico/Administracao.pdf Basico/IntroducaoAEconomia.pdf Basico/QuimicaX.pdf Basico/ProbEst.pdf\
	Basico/CalculoI.pdf Basico/CalculoII.pdf Basico/EDO.pdf Basico/GeometriaAnalitica.pdf \
	Basico/GeometriaDescritivaI.pdf Basico/AlgebraLinearIII.pdf Basico/DesenhoBasico.pdf  Basico/AnaliseVetorial.pdf \
	Eletronica/ControleEServomecanismosIII.pdf  Eletronica/EletronicaI.pdf Eletronica/EletronicaII.pdf  \
	Eletronica/ModelosMatematicos.pdf \
	FenomenosDeTransporte.pdf IntroducaoAEngenhariaAmbiental.pdf MecanicaTecnica.pdf ResMat.pdf  

LEIS=CES112002.pdf Deliberacao33-95.pdf res1010.pdf

IMAGENS= imagens/dep1.png imagens/subreitoria.png

PP=ProjetoPedagogico

all:    $(PP).pdf

$(PP).pdf: $(PP).tex Capitulos.tex anexos.tex svmono.cls imagens/logo_uerj_cor.jpg
	@echo Criando $@
	$(LATEXMK) $(LATEXMKOPT) $(OUTDIROPT) $(CONTINUOUS) \
		-pdflatex="$(LATEX) $(LATEXOPT) $(NONSTOP) %O %S" $(PP)

Capitulos.tex: disciplinasDB.sty

anexos.tex: $(LEIS) $(EXTERNOS) $(FLUXOGRAMA) $(DESC) $(ELETIVAS) $(ELETRICA) $(INDUSTRIAL) $(ELETRONICA)

$(TODASDISC):disciplinasDB.sty contadores.inc default.def
$(DESC):ementa.sty
$(CLASSEDESC) $(ELETRICA):ementa.cls 
$(INDUSTRIAL):ementaIndustrial.sty 
$(ELETIVAS):ementaeletiva.sty 
$(FLUXOGRAMA):fluxogramaEngenhariaComputacao.tex disciplinasDB.sty

$(TODASDISC): %.pdf: %.tex $(IMAGENS)
	@echo Criando $@
	$(LATEXMK) $(LATEXMKOPT) $(OUTDIROPT) $(CONTINUOUS) \
		-pdflatex="$(LATEX) $(LATEXOPT) $(NONSTOP) %O %S" $(PP) $<

%.pdf: %.tex 
	$(LATEXMK) $(LATEXMKOPT) $(OUTDIROPT) $(CONTINUOUS) \
		-pdflatex="$(LATEX) $(LATEXOPT) $(NONSTOP) %O %S" $(PP) $<

.refresh:
	touch .refresh

force:
	touch .refresh
	rm $(PP).pdf
	$(LATEXMK) $(LATEXMKOPT) $(CONTINUOUS) \
		-pdflatex="$(LATEX) $(LATEXOPT) %O %S" $(MAIN)

clean:
	$(LATEXMK) -C $(PP)
	rm -f $(OUTDIR)/$(PP).pdfsync
	rm -rf *~ $(OUTDIR)/*.tmp
	rm -f $(OUTDIR)/*.bbl $(OUTDIR)/*.blg $(OUTDIR)/*.aux $(OUTDIR)/*.end $(OUTDIR)/*.fls $(OUTDIR)/*.log $(OUTDIR)/*.out $(OUTDIR)/*.fdb_latexmk $(OUTDIR)/*.bcf $(OUTDIR)/*.run.xml


once:
	$(LATEXMK) $(LATEXMKOPT) -pdflatex="$(LATEX) $(LATEXOPT) %O %S" $(PP)

debug:
	$(LATEX) $(LATEXOPT) $(PP)

.PHONY: clean force once all
