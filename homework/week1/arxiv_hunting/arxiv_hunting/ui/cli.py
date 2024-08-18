# arxiv_hunting/ui/cli.py

import click
from arxiv_hunting.fetching.fetcher import PaperFetcher
from arxiv_hunting.reports.generator import ReportGenerator

@click.group()
def cli():
    pass

@cli.command()
@click.option('--query', prompt='ArXiv query', help='The search query for ArXiv.')
def fetch(query):
    fetcher = PaperFetcher()
    papers = fetcher.fetch_latest_papers(query=query)
    
    if papers:
        report_gen = ReportGenerator(papers)
        report_gen.generate_report(output_path="report.txt")
    else:
        print("No papers found for the given query.")

if __name__ == '__main__':
    cli()

