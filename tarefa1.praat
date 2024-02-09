dirVogal$ = "/home/yana/Documentos/baseVerificao/juiz/vgaJuiz/"
dirContagem$ = "/home/yana/Documentos/baseVerificao/juiz/contagemJuiz/"
#dirSilencio$ = "/home/yana/Documentos/baseVerificao/juiz/"

pastaVogal = Create Strings as file list: "pastaVogal", dirVogal$
select pastaVogal
numPastaVogal = Get number of strings
pastaContagem = Create Strings as file list: "pastaContagem", dirContagem$
select pastaContagem
numPastaContagem = Get number of strings

if numPastaVogal == numPastaContagem
    for n from 1 to numPastaVogal
        select pastaVogal
        stringPastaVogal$ = Get string: n
        comparadorVogal$ = left$(stringPastaVogal$, index(stringPastaVogal$, "_"))
        
        select pastaContagem
        stringPastaContagem$ = Get string: n
        comparadorContagem$ = left$(stringPastaContagem$, index(stringPastaContagem$, "_"))

        if comparadorVogal$ == comparadorContagem$
            audioVogal = Read from file: dirVogal$ + stringPastaVogal$
            audioSilencio = Read from file: "/home/yana/Documentos/baseVerificao/juiz/silencio.wav"
            audioContagem = Read from file: dirContagem$ + stringPastaContagem$
            select audioVogal
            plus audioSilencio
            plus audioContagem
            audio = Concatenate
            Save as WAV file: "/home/yana/Documentos/baseVerificao/juiz/tarefa1/" + comparadorVogal$ + "_tarefa1"  + ".wav"
            select audio
            Erase all
            Select outer viewport: 1.5, 10, 1, 5
            Draw: 0, 0, 0, 0, "yes", "curve" 
            Save as 300-dpi PNG file: "/home/yana/Documentos/baseVerificao/juiz/tarefa1/imagens/" + comparadorVogal$ + "_tarefa1" + ".png"
            Erase all
            select audioVogal
            plus audioSilencio
            plus audioContagem
            plus audio
            Remove
        endif
    endfor
    select all
    Remove
endif