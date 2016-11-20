#origem https://www.drewsilcock.co.uk/using-make-and-latexmk
LATEX=pdflatex
LATEXOPT=--shell-escape
NONSTOP=--interaction=nonstopmode
#AUXDIROPT=-auxdir=aux
OUTDIROPT=-outdir=pdf
OUTDIR=pdf

LATEXMK=latexmk
LATEXMKOPT=-pdf
#CONTINUOUS=-pvc

MAIN=AlgoritmosComputacionais AnaliseDeAlgoritmos ArquiteturaDeComputadores \
	CircuitosEletricosV AnaliseDeSistemasFisicos CircuitosEletricosVI \
	ProjetoDeSistemasOperacionais ComputacaoParalela ControleDeProcessosPorComputador \
	EngenhariaComputacional EngenhariaDeComputacaoESociedade EngenhariaDeSistemas \
	ProjetoEAdministracaoDeBancoDeDados Eletiva1_ReconhecimentoDePadroes Eletiva2_RedesDeInterconexao \
	Eletiva3_Geomatica Eletiva4_ComputacaoDeAltoDesempenho Eletiva5_ProgramacaoParaDispositivosMoveis \
	Eletiva6_Padroes EletronicaIIA EstruturasDeInformacao EstagioSupervisionadoXIA \
	FundamentosDeComputadores InteligenciaComputacional LaboratorioDeProgramacaoA \
	LaboratorioDeProgramacaoB LogicaEmProgramacao MateriaisEletricosEMagneticos \
	MineracaoDeDados ProcessamentoDeImagens ProjetoXIA SistemasEmbutidos \
	TeleprocessamentoERedes TeoriaDeCompiladores \
	fluxogramaEngenhariaComputacao \
	ProjetoPedagogico
#	    \
#	  \
#	 
SOURCES=$(MAIN).tex ementa.sty ementaEletrica.sty ementaEletronica.sty ementaeletiva.sty
#Makefile yourothertexfiles
FIGURES := $(shell find imagens/* -type f)

all:    $(MAIN).pdf

.refresh:
	touch .refresh

$(MAIN).pdf: $(MAIN).tex .refresh $(SOURCES) $(FIGURES)
	$(LATEXMK) $(LATEXMKOPT) $(OUTDIROPT) $(CONTINUOUS) \
		-pdflatex="$(LATEX) $(LATEXOPT) $(NONSTOP) %O %S" $(MAIN)

force:
	touch .refresh
	rm $(MAIN).pdf
	$(LATEXMK) $(LATEXMKOPT) $(CONTINUOUS) \
		-pdflatex="$(LATEX) $(LATEXOPT) %O %S" $(MAIN)

clean:
	$(LATEXMK) -C $(MAIN)
	rm -f $(OUTDIR)/$(MAIN).pdfsync
	rm -rf *~ $(OUTDIR)/*.tmp
	rm -f $(OUTDIR)/*.bbl $(OUTDIR)/*.blg $(OUTDIR)/*.aux $(OUTDIR)/*.end $(OUTDIR)/*.fls $(OUTDIR)/*.log $(OUTDIR)/*.out $(OUTDIR)/*.fdb_latexmk $(OUTDIR)/*.bcf $(OUTDIR)/*.run.xml


once:
	$(LATEXMK) $(LATEXMKOPT) -pdflatex="$(LATEX) $(LATEXOPT) %O %S" $(MAIN)

debug:
	$(LATEX) $(LATEXOPT) $(MAIN)

.PHONY: clean force once all
