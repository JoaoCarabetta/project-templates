import os
import sys
sys.path.insert(0, '../')
sys.path.insert(0, '../scripts')

from pathlib import Path 
current_path = Path().resolve()
abs_path = str(current_path.parent)
sys.path.append(abs_path)

RAW_PATH = current_path.parent / 'data' / 'raw'
TREAT_PATH = current_path.parent / 'data' / 'treated'
OUTPUT_PATH = current_path.parent / 'data' / 'output'
FIGURES_PATH = current_path.parent / 'data' / 'figures'
THEMES_PATH = current_path.parent / 'themes'