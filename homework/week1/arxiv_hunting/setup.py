from setuptools import setup, find_packages

setup(
    name="arxiv_hunting",
    version="0.1",
    packages=find_packages(),
    install_requires=[
        "requests",
        "click",
        "PyYAML"
    ],
    entry_points={
        'console_scripts': [
            'arxiv-hunting=arxiv_hunting.ui.cli:cli',
        ],
    },
)
