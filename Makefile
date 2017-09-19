#origem https://www.drewsilcock.co.uk/using-make-and-latexmk
PP=ProjetoPedagogico
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

DESC=AlgoritmosComputacionais.pdf AnaliseDeAlgoritmos.pdf ArquiteturaDeComputadores.pdf \
	ProjetoDeSistemasOperacionais.pdf ComputacaoParalela.pdf ControleDeProcessosPorComputador.pdf \
	EngenhariaComputacional.pdf EngenhariaDeComputacaoESociedade.pdf EngenhariaDeSistemas.pdf \
	ProjetoEAdministracaoDeBancoDeDados.pdf EstruturasDeInformacao.pdf EstagioSupervisionadoXIA.pdf \
	FundamentosDeComputadores.pdf InteligenciaComputacional.pdf LaboratorioDeProgramacaoA.pdf \
	LaboratorioDeProgramacaoB.pdf LogicaEmProgramacao.pdf  \
	MineracaoDeDados.pdf ProcessamentoDeImagens.pdf ProjetoXIA.pdf SistemasEmbutidos.pdf \
	TeleprocessamentoERedes.pdf TeoriaDeCompiladores.pdf 

CLASSEDESC=ProjetoXIA.pdf ArquiteturaDeComputadores.pdf SistemasEmbutidos.pdf

ELETIVAS=Eletiva1_ReconhecimentoDePadroes.pdf Eletiva2_RedesDeInterconexao.pdf \
	Eletiva3_Geomatica.pdf Eletiva4_ComputacaoDeAltoDesempenho.pdf Eletiva5_ProgramacaoParaDispositivosMoveis.pdf \
	Eletiva6_Padroes.pdf

ELETRO=EletronicaIIA.pdf PrincipiosDeTelecomunicacoesIIIA.pdf ControleEServomecanismosIIIA.pdf

ELETRICA=AnaliseDeSistemasFisicos.pdf CircuitosEletricosV.pdf CircuitosEletricosVI.pdf\
	MateriaisEletricosEMagneticos.pdf

INDUSTRIAL=EngenhariaDoTrabalhoI.pdf MetodosQuantitativos.pdf

TODASDISC= $(DESC) $(ELETRO) $(ELETRICA) $(INDUSTRIAL) $(ELETIVAS)

FLUXOGRAMA=fluxogramaEngenhariaComputacao.pdf

EXTERNOS=Administracao.pdf AlgebraLinearIII.pdf AnaliseVetorial.pdf CalculoI.pdf CalculoII.pdf \
	CalculoIII.pdf DesenhoBasico.pdf EletronicaI.pdf FenomenosDeTransporte.pdf FisicaI.pdf \
	FisicaII.pdf FisicaIII.pdf FisicaIV.pdf GeometriaAnalitica.pdf GeometriaDescritivaI.pdf \
	IntroducaoAEconomia.pdf IntroducaoAEngenhariaAmbiental.pdf MateriaisEletricos.pdf MecanicaTecnica.pdf ModelosMatematicos.pdf \
	ProbEst.pdf QuimicaX.pdf ResMat.pdf

LEIS=CES112002.pdf Deliberacao33-95.pdf res1010.pdf

PPPARTES=disciplinasDB.tex Capitulos.tex anexos.tex

#Makefile yourothertexfiles
FIGURES := $(shell find imagens/* -type f)

all:    $(PP).pdf

$(TODASDISC):disciplinasDB.tex contadores.inc default.def
$(DESC):ementa.sty
$(CLASSEDESC):ementa.cls
$(ELETRO):ementaEletronica.sty 
$(ELETRICA):ementaEletrica.sty 
$(INDUSTRIAL):ementaIndustrial.sty 
$(ELETIVAS):ementaeletiva.sty 
$(FLUXOGRAMA):fluxogramaEngenhariaComputacao.tex disciplinasDB.tex

$(PP).pdf: $(PP).tex $(PPPARTES) $(DESC) $(ELETIVAS) $(ELETRO) $(ELETRICA) $(INDUSTRIAL) $(FLUXOGRAMA) $(EXTERNOS) $(LEIS)
	$(LATEXMK) $(LATEXMKOPT) $(OUTDIROPT) $(CONTINUOUS) \
		-pdflatex="$(LATEX) $(LATEXOPT) $(NONSTOP) %O %S" $(PP)

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
