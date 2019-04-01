# Local file storage
import sys
import os
from pathlib import Path 
current_path = Path().resolve()
abs_path = str(current_path.parent)
sys.path.append(abs_path)

RAW_PATH = current_path / 'data' / 'raw'
TREAT_PATH = current_path / 'data' / 'treated'
OUTPUT_PATH = current_path / 'data' / 'output'