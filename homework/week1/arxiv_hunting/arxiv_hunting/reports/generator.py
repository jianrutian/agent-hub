# arxiv_hunting/reports/generator.py

class ReportGenerator:
    def __init__(self, papers):
        self.papers = papers
    
    def generate_report(self, output_path="report.txt"):
        with open(output_path, 'w') as f:
            f.write("ArXiv Hunting Report\n")
            f.write("=====================\n\n")
            
            for paper in self.papers:
                f.write(f"Title: {paper['title']}\n")
                f.write(f"Published: {paper['published']}\n")
                f.write(f"Summary: {paper['summary']}\n")
                f.write(f"Link: {paper['link']}\n")
                f.write("\n")
        
        print(f"Report generated: {output_path}")

