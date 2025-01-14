#!/bin/bash

venv_name="taggui-macos"

# Clona il repository git nel corrente diretto
git clone https://github.com/huchukato/taggui-macos.git

# Entra nella cartella del progetto
cd taggui-macos

# Controlla se l'ambiente virtuale esiste già
if [ -d "$venv_name" ]; then
    echo "L'ambiente virtuale $venv_name esiste già."
else
    # Crea l'ambiente virtuale con Python
    python3 -m venv $venv_name

    echo "L'ambiente virtuale $venv_name è stato creato correttamente."

    # Attiva l'ambiente virtuale
    source $venv_name/bin/activate

    # Aggiorna pip all'interno dell'ambiente virtuale
    python -m pip install --upgrade pip

    # Installa Pytorch
    python -m pip install --pre torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/nightly/cpu

    # Installa le dipendenze dalla lista di pip REQUIREMENTS
    python -m pip install -r requirements-osx-arm64.txt

fi

# Avvia lo script Python
python /taggui/run_gui.py
