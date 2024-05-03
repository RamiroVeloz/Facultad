def title_test (text):
    tittle, resume = text.split("resumen:")
    numbers = ['0','1','2','3','4','5','6','7','8','9']
    cant = 0
    words = tittle.split()
    words.pop(words.index('titulo:'))
    for number in numbers:
        if number in words:
            cant += 1
    tittle_len = len(words) - cant
    if (tittle_len > 10):
        print(f'Tittle not ok: {tittle_len} words')
    else:
        print(f'Tittle ok: {tittle_len} words')
    return resume

def resume_test (resume):
    resume = resume.replace('\n',' ')
    cleaned = resume.split ('.')
    easy = 0
    acceptable = 0
    hard = 0
    very_hard = 0
    for sentence in cleaned: 
        words = sentence.split()
        if (len(words) <= 12):
            easy  += 1
        elif (len(words) >=13 and len(words) <= 17):
            acceptable += 1
        elif (len(words) >= 18 and len(words) <= 23):
            hard += 1
        elif (len(words) >25 ):
            very_hard += 1

    print (f'Resumen: facil - {easy} , aceptable - {acceptable} , dificil - {hard} , muy dificil - {very_hard}')
    
        


article = """ titulo: Experiences in Developing a Distributed Agentbased Modeling Toolkit with Python Version 3
resumen: Distributed agent-based modeling (ABM) on high-performance
computing resources provides the promise of capturing unprecedented
details of large-scale complex systems. However, the specialized
knowledge required for developing such ABMs creates barriers to wider
adoption and utilization. Here we present our experiences in
developing an initial implementation of Repast4Py, a Python-based
distributed ABM toolkit. We build on our experiences in developing ABM
toolkits, including Repast for High Performance Computing (Repast
HPC), to identify the key elements of a useful distributed ABM
toolkit. We leverage the Numba, NumPy, and PyTorch packages and the
Python C-API to create a scalable modeling system that can exploit the
largest HPC resources and emerging computing architectures."""

resume = title_test(article)
resume_test(resume)