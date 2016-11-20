%Não preencher daqui em diante
%contadores 
\setcounter		{numcr}{0}
\addtocounter		{numcr}{\crteorica}
\addtocounter		{numcr}{\crpratica}
\addtocounter		{numcr}{\crlab}
\addtocounter		{numcr}{\crestagio}

\setcounter		{chteoricatotal}{15*\crteorica}

\setcounter		{chprattotal}{30*\crpratica}
\setcounter		{chlabtotal}{30*\crlab}
\setcounter		{chestagiototal}{30*\crestagio}

\setcounter		{chpratsemanal}{2*\crpratica}
\setcounter		{chlabsemanal}{2*\crlab}
\setcounter		{chestagiosemanal}{2*\crestagio}

\setcounter		{chtotalsemanal}{0}
\setcounter		{chtotalsemanal}{2*\crlab}
\addtocounter		{chtotalsemanal}{2*\crpratica}
\addtocounter		{chtotalsemanal}{2*\crestagio}
\addtocounter		{chtotalsemanal}{\crteorica}

\setcounter		{chtotal}{0}
\setcounter		{chtotal}{\the\value{chestagiototal}+\the\value{chprattotal}+\the\value{chlabtotal}+\the\value{chteoricatotal}}
